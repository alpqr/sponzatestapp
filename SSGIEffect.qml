import QtQuick
import QtQuick3D

Effect {
    id: ssgiEffect

    property int renderMode: 0
    property real blurAmount: 0.01
    property real bufferSizeFactor: 0.5
    property real fov: 45.0
    property real sampleCount: 4.0
    property real sampleRadius: 0.1
    property real sliceCount: 4.0
    property real hitThickness: 0.5
    property real indirectBoost: 1.0
    property int indirectApplyMode: 0

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
    }

    passes: [
        Pass {
            output: indirectAndAoBuffer
            shaders: [
                Shader {
                    stage: Shader.Fragment
                    shader: "ssgi_1.frag"
                }
            ]
        },

        Pass {
            output: blurredIndirectAndAoBuffer
            shaders: [
                Shader {
                    stage: Shader.Fragment
                    shader: "ssgi_2.frag"
                }
            ]
            commands: [
                BufferInput {
                    buffer: indirectAndAoBuffer
                    sampler: "indirectAndAoSampler"
                }
            ]
        },

        Pass {
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
    ]
}
