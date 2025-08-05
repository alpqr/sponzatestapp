import QtQuick
import QtQuick3D

Effect {
    id: ssgiEffect

    property bool indirectLightEnabled: true
    property bool fakeLightBounce: false
    property real indirectLightBoost: 2.0
    property real bufferSizeFactor: 0.5

    property real sampleCount: 4.0
    property real sampleRadius: 0.1
    property real sliceCount: 4.0
    property real hitThickness: 0.5

    property int debugMode: 0

    readonly property TextureInput indirectAndAoSampler: TextureInput {
        texture: Texture {}
    }

    readonly property TextureInput blurredIndirectAndAoSampler: TextureInput {
        texture: Texture {}
    }

    Buffer {
        id: indirectAndAoBuffer
        name: "indirectAndAoBuffer"
        sizeMultiplier: ssgiEffect.bufferSizeFactor
    }

    Buffer {
        id: blurredIndirectAndAoBuffer
        name: "blurredIndirectAndAoBuffer"
        sizeMultiplier: ssgiEffect.bufferSizeFactor
        bufferFlags: Buffer.SceneLifetime // for fakeLightBounce
    }

    Pass {
        id: ssaoAndIndirectPass
        output: indirectAndAoBuffer
        shaders: [
            Shader {
                stage: Shader.Fragment
                shader: "ssgi_1.frag"
            }
        ]
        commands: [
            // for fakeLightBounce
            BufferInput {
                // because it is SceneLifetime, so here this is the result from the previous frame
                buffer: blurredIndirectAndAoBuffer
                sampler: "blurredIndirectAndAoSampler"
            }
        ]
    }

    Buffer {
        id: tempBuffer1
        name: "tempBuffer1"
        sizeMultiplier: ssgiEffect.bufferSizeFactor * 0.5
    }
    Buffer {
        id: tempBuffer2
        name: "tempBuffer2"
        sizeMultiplier: ssgiEffect.bufferSizeFactor * 0.5 * 0.5
    }
    Buffer {
        id: tempBuffer3
        name: "tempBuffer3"
        sizeMultiplier: ssgiEffect.bufferSizeFactor * 0.5 * 0.5 * 0.5
    }
    Pass {
        id: indirectLightBufferBlurDownInputTo1
        output: tempBuffer1
        shaders: [
            Shader {
                stage: Shader.Fragment
                shader: "ssgi_2_dualfilter_blur_down.frag"
            }
        ]
        commands: [
            BufferInput {
                buffer: indirectAndAoBuffer
            }
        ]
    }
    Pass {
        id: indirectLightBufferBlurDown1To2
        output: tempBuffer2
        shaders: [
            Shader {
                stage: Shader.Fragment
                shader: "ssgi_2_dualfilter_blur_down.frag"
            }
        ]
        commands: [
            BufferInput {
                buffer: tempBuffer1
            }
        ]
    }
    Pass {
        id: indirectLightBufferBlurUp2To1
        output: tempBuffer1
        shaders: [
            Shader {
                stage: Shader.Fragment
                shader: "ssgi_2_dualfilter_blur_up.frag"
            }
        ]
        commands: [
            BufferInput {
                buffer: tempBuffer2
            }
        ]
    }
    Pass {
        id: indirectLightBufferBlurUp1ToOutput
        output: blurredIndirectAndAoBuffer
        shaders: [
            Shader {
                stage: Shader.Fragment
                shader: "ssgi_2_dualfilter_blur_up.frag"
            }
        ]
        commands: [
            BufferInput {
                buffer: tempBuffer1
            }
        ]
    }

    Pass {
        id: ssgiCompositionPass
        shaders: [
        Shader {
                stage: Shader.Fragment
                shader: "ssgi_3.frag"
            }
        ]
        commands: [
            BufferInput {
                buffer: blurredIndirectAndAoBuffer
                sampler: "blurredIndirectAndAoSampler"
            }
        ]
    }

    passes:
        [ ssaoAndIndirectPass,
          indirectLightBufferBlurDownInputTo1, indirectLightBufferBlurDown1To2,
          indirectLightBufferBlurUp2To1, indirectLightBufferBlurUp1ToOutput,
          ssgiCompositionPass
        ]
}
