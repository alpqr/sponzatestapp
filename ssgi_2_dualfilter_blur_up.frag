#if QSHADER_VIEW_COUNT >= 2
#define SAMPLE_INPUT(uv) texture(INPUT, vec3(uv, VIEW_INDEX))
#else
#define SAMPLE_INPUT(uv) texture(INPUT, uv)
#endif

void MAIN()
{
    vec4 c0 = SAMPLE_INPUT(INPUT_UV);
    if (debugMode == 6 || debugMode == 7) {
        FRAGCOLOR = c0;
        return;
    }

    const vec2 uv = INPUT_UV;
    const vec2 halfpixel = 0.5 / (INPUT_SIZE / 2.0);
    const float offset = 3.0;

    vec3 sum = SAMPLE_INPUT(uv + vec2(-halfpixel.x * 2.0, 0.0) * offset).rgb;
    sum += SAMPLE_INPUT(uv + vec2(-halfpixel.x, halfpixel.y) * offset).rgb * 2.0;
    sum += SAMPLE_INPUT(uv + vec2(0.0, halfpixel.y * 2.0) * offset).rgb;
    sum += SAMPLE_INPUT(uv + vec2(halfpixel.x, halfpixel.y) * offset).rgb * 2.0;
    sum += SAMPLE_INPUT(uv + vec2(halfpixel.x * 2.0, 0.0) * offset).rgb;
    sum += SAMPLE_INPUT(uv + vec2(halfpixel.x, -halfpixel.y) * offset).rgb * 2.0;
    sum += SAMPLE_INPUT(uv + vec2(0.0, -halfpixel.y * 2.0) * offset).rgb;
    sum += SAMPLE_INPUT(uv + vec2(-halfpixel.x, -halfpixel.y) * offset).rgb * 2.0;

    FRAGCOLOR = vec4(sum / 12.0, c0.a);
}
