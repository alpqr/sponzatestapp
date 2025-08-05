#if QSHADER_VIEW_COUNT >= 2
#define SAMPLE_INPUT(uv) texture(INPUT, vec3(uv, VIEW_INDEX))
#define SAMPLE_DEPTH(uv) texture(DEPTH_TEXTURE, vec3(uv, VIEW_INDEX)).r
#define SAMPLE_NORMAL(uv) normalize(texture(NORMAL_TEXTURE, uv).rgb)
#define PROJECTION PROJECTION_MATRIX[VIEW_INDEX]
#else
#define SAMPLE_INPUT(uv) texture(INPUT, uv)
#define SAMPLE_DEPTH(uv) texture(DEPTH_TEXTURE, uv).r
#define SAMPLE_NORMAL(uv) normalize(texture(NORMAL_TEXTURE, uv).rgb)
#define PROJECTION PROJECTION_MATRIX
#endif

#if QSHADER_VIEW_COUNT >= 2
#define SAMPLE_LAST_FRAME_INDIRECT_AND_AO(uv) texture(blurredIndirectAndAoSampler, vec3(uv, VIEW_INDEX))
#else
#define SAMPLE_LAST_FRAME_INDIRECT_AND_AO(uv) texture(blurredIndirectAndAoSampler, uv)
#endif

vec3 getPos(vec2 uv)
{
    float depth = SAMPLE_DEPTH(uv);
    vec2 ndc = uv * 2.0 - 1.0;

    float zd = depth; // why not linearized? but it sucks when we do, so don't

    float aspect = INPUT_SIZE.x / INPUT_SIZE.y;
    //float fovRad = radians(60.0);
    float fovRad = 2.0 * atan(1.0 / PROJECTION[1][1]);
    if (NDC_Y_UP < 0.0)
        fovRad *= -1.0;
    float halfFovTan = tan(0.5 * fovRad);
    vec3 viewPos = vec3(ndc.x * aspect * halfFovTan * zd, ndc.y * halfFovTan * zd, -zd);

    viewPos.y *= qt_normalAdjustViewportFactor; // isYUpInFramebuffer ? 1.0 : -1.0

    return viewPos;
}

vec3 getNormal(vec2 uv)
{
    return normalize(mat3(VIEW_MATRIX) * SAMPLE_NORMAL(uv));
}

uint countBits(uint value) // there is no bitCount() in GLSL < 400
{
    // https://graphics.stanford.edu/%7Eseander/bithacks.html
    value = value - ((value >> 1u) & 0x55555555u);
    value = (value & 0x33333333u) + ((value >> 2u) & 0x33333333u);
    return ((value + (value >> 4u) & 0xF0F0F0Fu) * 0x1010101u) >> 24u;
}

const uint sectorCount = 32;
const float pi = 3.14159265359;
const float twoPi = 2.0 * pi;
const float halfPi = 0.5 * pi;

vec4 SSILVB()
{
    // https://cybereality.com/screen-space-indirect-lighting-with-visibility-bitmask-improvement-to-gtao-ssao-real-time-ambient-occlusion-algorithm-glsl-shader-implementation/
    uint indirect = 0;
    uint occlusion = 0;
    float visibility = 0.0;
    vec3 lighting = vec3(0.0);

    const vec2 aspect = INPUT_SIZE.yx / INPUT_SIZE.x;
    const vec3 position = getPos(INPUT_UV);
    const vec3 camera = normalize(-position);
    const vec3 normal = getNormal(INPUT_UV);

    const float sliceRotation = twoPi / (sliceCount - 1.0);
    const float sampleScale = (-sampleRadius * PROJECTION[0][0]) / position.z;
    const float sampleOffset = 0.01;

    // https://blog.demofox.org/2022/01/01/interleaved-gradient-noise-a-different-kind-of-low-discrepancy-sequence/
    const float jitter = mod(52.9829189 * mod(0.06711056 * FRAGCOORD.x + 0.00583715 * FRAGCOORD.y, 1.0), 1.0) - 0.5;

    for (float slice = 0.0; slice < sliceCount + 0.5; slice += 1.0) {
        const float phi = sliceRotation * (slice + jitter) + pi;
        const vec2 omega = vec2(cos(phi), sin(phi));
        const vec3 direction = vec3(omega.x, omega.y, 0.0);
        const vec3 orthoDirection = direction - dot(direction, camera) * camera;
        const vec3 axis = cross(direction, camera);
        const vec3 projNormal = normal - axis * dot(normal, axis);
        const float projLength = length(projNormal);

        const float signN = sign(dot(orthoDirection, projNormal));
        const float cosN = clamp(dot(projNormal, camera) / projLength, 0.0, 1.0);
        const float n = signN * acos(cosN);

        for (float currentSample = 0.0; currentSample < sampleCount + 0.5; currentSample += 1.0) {
            const float sampleStep = (currentSample + jitter) / sampleCount + sampleOffset;
            // GL: - others: +
            const vec2 sampleUV = INPUT_UV - qt_normalAdjustViewportFactor * (sampleStep * sampleScale * omega * aspect);
            const vec3 samplePosition = getPos(sampleUV);
            const vec3 sampleNormal = getNormal(sampleUV);
            const vec3 sampleDistance = samplePosition - position;
            const float sampleLength = length(sampleDistance);
            const vec3 sampleHorizon = sampleDistance / sampleLength;
            vec2 minMaxHorizon = acos(vec2(dot(sampleHorizon, camera), dot(normalize(sampleDistance - camera * hitThickness), camera)));
            minMaxHorizon = clamp((minMaxHorizon + n + halfPi) / pi, 0.0, 1.0);

            // https://cdrinmatane.github.io/posts/ssaovb-code/
            uint startBit = uint(minMaxHorizon.x * float(sectorCount));
            uint horizonAngle = uint(ceil((minMaxHorizon.y - minMaxHorizon.x) * float(sectorCount)));
            uint angleBit = horizonAngle > 0 ? uint(0xFFFFFFFFu >> (sectorCount - horizonAngle)) : 0;
            indirect = angleBit << startBit;

            if (indirectLightEnabled || debugMode != 0) {
                vec3 sampleLight = SAMPLE_INPUT(sampleUV).rgb;
                if (fakeLightBounce) {
                    vec3 indirectFromLastFrame = SAMPLE_LAST_FRAME_INDIRECT_AND_AO(sampleUV).rgb;
                    sampleLight = sampleLight * (1.0 + indirectFromLastFrame * indirectLightBoost);
                }
                lighting += (1.0 - float(countBits(indirect & ~occlusion)) / float(sectorCount))
                    * sampleLight * clamp(dot(normal, sampleHorizon), 0.0, 1.0)
                    * clamp(dot(sampleNormal, -sampleHorizon), 0.0, 1.0);
            }

            occlusion |= indirect;
        }
        visibility += 1.0 - float(countBits(occlusion)) / float(sectorCount);
    }

    visibility /= sliceCount;
    lighting /= sliceCount;

    return vec4(lighting, visibility);
}

void MAIN()
{
    vec4 indirectAndAo = SSILVB();

    if (debugMode == 6)
        FRAGCOLOR = vec4(getPos(INPUT_UV), 1.0);
    else if (debugMode == 7)
        FRAGCOLOR = vec4(getNormal(INPUT_UV), 1.0);
    else
        FRAGCOLOR = indirectAndAo;
}
