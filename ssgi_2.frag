#if QSHADER_VIEW_COUNT >= 2
#define SAMPLE_INPUT(uv) texture(indirectAndAoSampler, vec3(uv, VIEW_INDEX))
#else
#define SAMPLE_INPUT(uv) texture(indirectAndAoSampler, uv)
#endif

void MAIN()
{
    vec4 c0 = SAMPLE_INPUT(INPUT_UV);
    if (renderMode == 6 || renderMode == 7) {
        FRAGCOLOR = c0;
        return;
    }

    const float amount = blurAmount;
    vec4 c1 = SAMPLE_INPUT(vec2(INPUT_UV.x - amount, INPUT_UV.y - amount));
    vec4 c2 = SAMPLE_INPUT(vec2(INPUT_UV.x + amount, INPUT_UV.y - amount));
    vec4 c3 = SAMPLE_INPUT(vec2(INPUT_UV.x - amount, INPUT_UV.y + amount));
    vec4 c4 = SAMPLE_INPUT(vec2(INPUT_UV.x + amount, INPUT_UV.y + amount));
    vec4 c5 = SAMPLE_INPUT(vec2(INPUT_UV.x - (amount * 2.0), INPUT_UV.y));
    vec4 c6 = SAMPLE_INPUT(vec2(INPUT_UV.x, INPUT_UV.y - (amount * 2.0)));
    vec4 c7 = SAMPLE_INPUT(vec2(INPUT_UV.x, INPUT_UV.y + (amount * 2.0)));
    vec4 c8 = SAMPLE_INPUT(vec2(INPUT_UV.x + (amount * 2.0), INPUT_UV.y));

    FRAGCOLOR = vec4((c1.rgb + c2.rgb + c3.rgb + c4.rgb + c5.rgb + c6.rgb + c7.rgb + c8.rgb) / 8.0, c0.a);
}
