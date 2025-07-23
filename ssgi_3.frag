#if QSHADER_VIEW_COUNT >= 2
#define SAMPLE_INPUT(uv) texture(INPUT, vec3(uv, VIEW_INDEX))
#define SAMPLE_INDIRECT_AND_AO(uv) texture(blurredIndirectAndAoSampler, vec3(uv, VIEW_INDEX))
#else
#define SAMPLE_INPUT(uv) texture(INPUT, uv)
#define SAMPLE_INDIRECT_AND_AO(uv) texture(blurredIndirectAndAoSampler, uv)
#endif

void MAIN()
{
    vec4 sceneColor = SAMPLE_INPUT(INPUT_UV);
    vec4 indirectAndAo = SAMPLE_INDIRECT_AND_AO(INPUT_UV);

    float ao = indirectAndAo.a;
    vec3 indirect = indirectAndAo.rgb;

    if (renderMode == 0)
        if (indirectApplyMode == 0)
            FRAGCOLOR = vec4(sceneColor.rgb * ao * (1.0 + indirect * indirectBoost), sceneColor.a);
        else
            FRAGCOLOR = vec4(sceneColor.rgb * ao + indirect * indirectBoost, sceneColor.a);
    else if (renderMode == 1)
        FRAGCOLOR = sceneColor;
    else if (renderMode == 2)
        if (indirectApplyMode == 0)
            FRAGCOLOR = vec4(sceneColor.rgb * (1.0 + indirect * indirectBoost), sceneColor.a);
        else
            FRAGCOLOR = vec4(sceneColor.rgb + indirect * indirectBoost, sceneColor.a);
    else if (renderMode == 3)
        FRAGCOLOR = vec4(sceneColor.rgb * ao, sceneColor.a);
    else if (renderMode == 4)
        FRAGCOLOR = vec4(indirect, 1.0);
    else if (renderMode == 5)
        FRAGCOLOR = vec4(vec3(ao), 1.0);
    else if (renderMode == 6)
        FRAGCOLOR = vec4(indirectAndAo.rgb, 1.0); // just the positions
    else if (renderMode == 7)
        FRAGCOLOR = vec4(indirectAndAo.rgb, 1.0); // just the normals
}
