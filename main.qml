import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick3D
import QtQuick3D.Helpers
import SponzaTestApp

Item {
    View3D {
        id: v3d
        anchors.fill: parent

        extensions: [
            TriangleExtension {
                enabled: cbExt.checked
                NumberAnimation on rotation { from: 0; to: 360; duration: 4000; loops: -1 }
                y: 50
                x: -100
                scale: 50
            }
        ]

        environment: SceneEnvironment {
            id: env

            backgroundMode: cbIbl.checked ? SceneEnvironment.SkyBox : SceneEnvironment.Transparent
            lightProbe: cbIbl.checked ? skytex : null
            probeExposure: 0.5

            lightmapper: Lightmapper {
                indirectLightFactor: 3
                //samples: 512
                //indirectLightEnabled: false
            }

            antialiasingMode: cbMsaa.checked ? SceneEnvironment.MSAA : SceneEnvironment.NoAA
            antialiasingQuality: SceneEnvironment.High // 4x
        }

        Texture {
            id: skytex
            source: "00455_OpenfootageNET_field_low.ktx"
        }

        PerspectiveCamera {
            id: camera
            y: 100
            eulerRotation.y: -90
            x: -400
            //x: -10
            frustumCullingEnabled: cbFrustCull.checked

//            Node {
//                z: -100
//                Rectangle {
//                    opacity: 0.7
//                    gradient: Gradient {
//                        GradientStop { position: 0; color: "lightsteelblue" }
//                        GradientStop { position: 1; color: "black" }
//                    }
//                    width: 500
//                    height: 500
//                    radius: 10
//                    x: -50
//                    y: -50
//                    ColumnLayout {
//                    }
//                }
//            }
        }

        Node {
            id: root
            scale: Qt.vector3d(100, 100, 100)
            property real lightBrightness: 5
            property bool lightmapEnabled: cbLm.checked
            property int defaultLightBakeMode: Light.BakeModeAll // Light.BakeModeIndirect
            property int lightBakeMode: cbLm.checked ? defaultLightBakeMode : Light.BakeModeDisabled

            PointLight {
                id: centerLight
                objectName: "centerLight"
                bakeMode: root.lightBakeMode
                y: 2
                color: "#d9c62b"
                brightness: root.lightBrightness
                castsShadow: cbShadows.checked
                shadowFactor: 75
                Model {
                    source: "#Cube"
                    usedInBakedLighting: true
                    // The light cannot be inside the cube, either the cube
                    // must be moved or usedInBakedLighting must be turned off.
                    y: 0.5
                    scale: Qt.vector3d(0.0001, 0.0001, 0.0001)
                    materials: PrincipledMaterial {
                        lighting: PrincipledMaterial.NoLighting
                    }
                }
            }

            Suzanne {
                usedInBakedLighting: true
                lightmapBaseResolution: 256 // reduce it, we know that this model in this scene does not need an 1000+ size lightmap
                bakedLightmap: BakedLightmap {
                    enabled: root.lightmapEnabled
                    key: "suzanne1"
                    loadPrefix: "file:"
                }
                y: 1
                scale: Qt.vector3d(0.5, 0.5, 0.5)
                eulerRotation.y: -90
            }

            PointLight {
                id: movingOrangeLight
                visible: cbMoveLightSphere.checked
                x: 8.5
                y: 3
                SequentialAnimation on z {
                    running: movingOrangeLight.visible
                    NumberAnimation { from: 1.5; to: 0; duration: 5000 }
                    NumberAnimation { from: 0; to: 1.5; duration: 5000 }
                    loops: -1
                }
                color: "#ffa342"
                brightness: 5
                castsShadow: cbShadows.checked
                shadowFactor: 75
                Model {
                    source: "#Cube"
                    scale: Qt.vector3d(0.0001, 0.0001, 0.0001)
                    materials: PrincipledMaterial {
                        lighting: PrincipledMaterial.NoLighting
                    }
                }
                Model {
                    source: "#Sphere"
                    scale: Qt.vector3d(0.02, 0.02, 0.02)
                    y: -2
                    materials: PrincipledMaterial { }
                }
            }

            PointLight {
                id: orangeLight
                objectName: "orangeLight"
                x: 9
                y: 1.5
                z: 3.25
                bakeMode: root.lightBakeMode
                color: "#ffa342"
                brightness: root.lightBrightness
                castsShadow: cbShadows.checked
                shadowFactor: 75
                Model {
                    source: "#Cube"
                    usedInBakedLighting: true
                    y: 0.5
                    scale: Qt.vector3d(0.0001, 0.0001, 0.0001)
                    materials: PrincipledMaterial {
                        lighting: PrincipledMaterial.NoLighting
                    }
                }
            }

            PointLight {
                id: greenLight
                objectName: "greenLight"
                bakeMode: root.lightBakeMode
                x: 9
                y: 1.5
                z: -3.5
                color: "#87ff70"
                brightness: root.lightBrightness
                castsShadow: cbShadows.checked
                shadowFactor: 75
                Model {
                    source: "#Cube"
                    usedInBakedLighting: true
                    y: 0.5
                    scale: Qt.vector3d(0.0001, 0.0001, 0.0001)
                    materials: PrincipledMaterial {
                        lighting: PrincipledMaterial.NoLighting
                    }
                }
            }

            PointLight {
                id: blueLight
                objectName: "blueLight"
                bakeMode: root.lightBakeMode
                x: -9.5
                y: 1.5
                z: -3.5
                color: "#4170ff"
                brightness: root.lightBrightness
                castsShadow: cbShadows.checked
                shadowFactor: 75
                Model {
                    source: "#Cube"
                    usedInBakedLighting: true
                    y: 0.5
                    scale: Qt.vector3d(0.0001, 0.0001, 0.0001)
                    materials: PrincipledMaterial {
                        lighting: PrincipledMaterial.NoLighting
                    }
                }
            }

            PointLight {
                id: purpleLight
                objectName: "purpleLight"
                bakeMode: root.lightBakeMode
                x: -9.5
                y: 1.5
                z: 3.25
                color: "#b770ff"
                brightness: root.lightBrightness
                castsShadow: cbShadows.checked
                shadowFactor: 75
                Model {
                    source: "#Cube"
                    usedInBakedLighting: true
                    y: 0.5
                    scale: Qt.vector3d(0.0001, 0.0001, 0.0001)
                    materials: PrincipledMaterial {
                        lighting: PrincipledMaterial.NoLighting
                    }
                }
            }

            SpotLight {
                id: spotLight
                objectName: "spotLight"
                bakeMode: root.lightBakeMode
                x: -7.5
                y: 1.2
                z: 2
                eulerRotation.x: -2
                eulerRotation.y: -130
                eulerRotation.z: -1.5
                coneAngle: 30
                innerConeAngle: 20
                brightness: root.lightBrightness
                Model {
                    source: "#Cube"
                    usedInBakedLighting: true
                    y: 0.5
                    scale: Qt.vector3d(0.0001, 0.0001, 0.0001)
                    materials: PrincipledMaterial {
                        lighting: PrincipledMaterial.NoLighting
                    }
                }
            }

            Sponza {
                usedInBakedLighting: true
                bakedLightmap: BakedLightmap {
                    enabled: root.lightmapEnabled
                    key: "sponza1"
                    loadPrefix: "file:"
                }
            }
        }

        Node {
            id: panelNode
            NumberAnimation on y {
                id: panelShowAnim
                from: 0
                to: 350
                duration: 700
                running: false
            }
            NumberAnimation on y {
                id: panelHideAnim
                from: 350
                to: 0
                duration: 700
                running: false
            }
            y: 0
            x: 500
            z: -175
            eulerRotation.y: -90
            Node {
                Rectangle {
                    gradient: Gradient {
                        GradientStop { position: 0; color: "lightsteelblue" }
                        GradientStop { position: 1; color: "lightGray" }
                    }
                    width: 300
                    height: 400
                    radius: 10

                    ColumnLayout {
                        x: 4
                        y: 4
                        Label {
                            text: "FPS: " + v3d.renderStats.fps + "\nGPU time: " + v3d.renderStats.lastCompletedGpuTime.toFixed(4) + " ms"
                        }
                        CheckBox {
                            id: cbMsaa
                            text: "MSAA (4x)"
                            checked: true
                        }
                        CheckBox {
                            id: cbIbl
                            text: "IBL (skybox)"
                            checked: true
                        }
                        CheckBox {
                            id: cbLm
                            text: "Use baked lightmap"
                            checked: false
                        }
                        CheckBox {
                            id: cbShadows
                            text: "Shadows (real-time)"
                            checked: true
                            enabled: !cbLm.checked
                        }
                        CheckBox {
                            visible: false
                            id: cbFrustCull
                            text: "Frustum culling"
                            checked: false
                        }
                        CheckBox {
                            id: cbExt
                            text: "Show thing"
                            checked: false
                        }
                        CheckBox {
                            id: cbRenderCont
                            text: "Render continuously (when nothing animates)"
                            checked: true
                        }
                        CheckBox {
                            id: cbMoveLightSphere
                            text: "Moving light/sphere (real-time shadow only)"
                            checked: false
                        }
                    }
                }
            }
            // hide the backface
            Node {
                z: -0.1
                Rectangle {
                    gradient: Gradient {
                        GradientStop { position: 0; color: "lightsteelblue" }
                        GradientStop { position: 1; color: "lightGray" }
                    }
                    width: 300
                    height: 400
                    radius: 10
                }
            }
        }

        WasdController {
            controlledObject: camera
            acceptedButtons: Qt.RightButton
        }
    }

    Item {
        width: debugViewToggleText.implicitWidth
        height: debugViewToggleText.implicitHeight
        anchors.right: parent.right
        Text {
            id: debugViewToggleText
            text: "Click here " + (dbg.visible ? "to hide DebugView" : "for DebugView")
            font.pointSize: 8
            color: "white"
            anchors.right: parent.right
            anchors.top: parent.top
        }
        MouseArea {
            anchors.fill: parent
            onClicked: dbg.visible = !dbg.visible
            DebugView {
                y: debugViewToggleText.height * 2
                anchors.right: parent.right
                source: v3d
                id: dbg
                visible: false
            }
        }
    }

    FrameAnimation {
        running: cbRenderCont.checked
        onTriggered: v3d.update()
    }

    focus: true
    Keys.onTabPressed: if (panelNode.y === 0) panelShowAnim.running = true; else panelHideAnim.running = true
}
