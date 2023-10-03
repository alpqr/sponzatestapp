import QtQuick
import QtQuick3D

Node {
    property alias usedInBakedLighting: suzanne.usedInBakedLighting
    property alias lightmapBaseResolution: suzanne.lightmapBaseResolution
    property alias bakedLightmap: suzanne.bakedLightmap

    // Materials
    PrincipledMaterial {
        id: suzanne_material
        baseColorMap: Texture {
            source: "maps/Suzanne_BaseColor.png"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityChannel: Material.A
        metalnessMap: Texture {
            source: "maps/Suzanne_MetallicRoughness.png"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        metalnessChannel: Material.B
        roughnessMap: Texture {
            source: "maps/Suzanne_MetallicRoughness.png"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        roughnessChannel: Material.G
        metalness: 0.2
        roughness: 0.2
        alphaMode: PrincipledMaterial.Opaque
        //opacity: 0.4
    }
    // end of Materials

    Model {
        id: suzanne
        source: "suzanne.mesh"
        materials: [
            suzanne_material
        ]
    }
}
