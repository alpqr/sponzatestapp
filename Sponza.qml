import QtQuick
import QtQuick3D

Node {
    id: root
    property alias usedInBakedLighting: nodes_0_.usedInBakedLighting
    property alias lightmapBaseResolution: nodes_0_.lightmapBaseResolution
    property alias bakedLightmap: nodes_0_.bakedLightmap
    property alias texelsPerUnit: nodes_0_.texelsPerUnit

    // Materials
    PrincipledMaterial {
        id: _material
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/5061699253647017043.png"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/11872827283454512094.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/11872827283454512094.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/8773302468495022225.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        cullMode: Material.NoCulling
        alphaMode: PrincipledMaterial.Mask
    }
    PrincipledMaterial {
        id: _material_1
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/8006627369776289000.png"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/715093869573992647.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/715093869573992647.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/12501374198249454378.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        cullMode: Material.NoCulling
        alphaMode: PrincipledMaterial.Mask
    }
    PrincipledMaterial {
        id: _material_2
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/7268504077753552595.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/8503262930880235456.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/8503262930880235456.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/4477655471536070370.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_3
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/8750083169368950601.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/16885566240357350108.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/16885566240357350108.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/13982482287905699490.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_4
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/5792855332885324923.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/11968150294050148237.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/11968150294050148237.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/16299174074766089871.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_5
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/14650633544276105767.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/4871783166746854860.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/4871783166746854860.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/2051777328469649772.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_6
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/15295713303328085182.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/9916269861720640319.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/9916269861720640319.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/10388182081421875623.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_7
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/6047387724914829168.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/8051790464816141987.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/8051790464816141987.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/15722799267630235092.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_8

        // floor
        //baseColor: "white"

        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/5823059166183034438.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/13824894030729245199.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/13824894030729245199.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        roughness: 0.25
        normalMap: Texture {
            source: "maps/14267839433702832875.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque

    }
    PrincipledMaterial {
        id: _material_9
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/7441062115984513793.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/8114461559286000061.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/8114461559286000061.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/6667038893015345571.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_10
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/11490520546946913238.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/3455394979645218238.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/3455394979645218238.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/3628158980083700836.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_11
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/6151467286084645207.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/8783994986360286082.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/8783994986360286082.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/7645212358685992005.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_12
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/white.png"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_13
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/4975155472559461469.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/3371964815757888145.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/3371964815757888145.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/2299742237651021498.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_14
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/4675343432951571524.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/7815564343179553343.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/7815564343179553343.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/7056944414013900257.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_15
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/2775690330959970771.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/7815564343179553343.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/7815564343179553343.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/2374361008830720677.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_16
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/2185409758123873465.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/7815564343179553343.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/7815564343179553343.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/332936164838540657.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_17
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/17876391417123941155.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/466164707995436622.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/466164707995436622.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/6593109234861095314.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_18
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/11474523244911310074.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/466164707995436622.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/466164707995436622.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/4601176305987539675.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_19
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/9288698199695299068.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/466164707995436622.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/466164707995436622.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/4910669866631290573.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_20
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/16275776544635328252.png"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/1219024358953944284.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/1219024358953944284.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/14170708867020035030.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        cullMode: Material.NoCulling
        alphaMode: PrincipledMaterial.Mask
    }
    PrincipledMaterial {
        id: _material_21
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/755318871556304029.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/2411100444841994089.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/2411100444841994089.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/3827035219084910048.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_22
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/8481240838833932244.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/17556969131407844942.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/17556969131407844942.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/10381718147657362067.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_23
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/6772804448157695701.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/13196865903111448057.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/13196865903111448057.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/759203620573749278.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_24
        baseColor: "#cacaca"
        baseColorMap: Texture {
            source: "maps/2969916736137545357.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/8747919177698443163.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/8747919177698443163.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 1
        roughness: 1
        normalMap: Texture {
            source: "maps/14118779221266351425.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: _material_25
        metalness: 1
        roughness: 1
        alphaMode: PrincipledMaterial.Opaque
    }
    // end of Materials

    Model {
        id: nodes_0_
        scale.x: 0.008
        scale.y: 0.008
        scale.z: 0.008
        source: "sponza.mesh"
        materials: [
            _material,
            _material_1,
            _material_2,
            _material_3,
            _material_4,
            _material_5,
            _material_6,
            _material_7,
            _material_5,
            _material_8,
            _material_6,
            _material_5,
            _material_9,
            _material_4,
            _material_6,
            _material_4,
            _material_5,
            _material_6,
            _material_5,
            _material_6,
            _material_5,
            _material_6,
            _material_5,
            _material_6,
            _material_5,
            _material_6,
            _material_5,
            _material_6,
            _material_5,
            _material_6,
            _material_5,
            _material_6,
            _material_5,
            _material_6,
            _material_5,
            _material_4,
            _material_5,
            _material_4,
            _material_10,
            _material_4,
            _material_10,
            _material_4,
            _material_10,
            _material_4,
            _material_9,
            _material_4,
            _material_8,
            _material_7,
            _material_5,
            _material_11,
            _material_12,
            _material_4,
            _material_13,
            _material,
            _material_14,
            _material_15,
            _material_16,
            _material_14,
            _material_15,
            _material_14,
            _material_16,
            _material_15,
            _material_13,
            _material_17,
            _material_18,
            _material_19,
            _material_18,
            _material_19,
            _material_18,
            _material_17,
            _material_19,
            _material_18,
            _material_17,
            _material_20,
            _material_21,
            _material_20,
            _material_21,
            _material_20,
            _material_21,
            _material_20,
            _material_21,
            _material_1,
            _material_2,
            _material_1,
            _material_2,
            _material_1,
            _material_2,
            _material_1,
            _material_2,
            _material_1,
            _material_2,
            _material_1,
            _material_2,
            _material_1,
            _material_2,
            _material_22,
            _material_23,
            _material_3,
            _material_23,
            _material_3,
            _material_4,
            _material_24,
            _material_4
        ]
    }
}
