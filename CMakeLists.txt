cmake_minimum_required(VERSION 3.14)
project(sponzatestapp LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 COMPONENTS Core Gui Qml Quick Quick3D ShaderTools OPTIONAL_COMPONENTS GuiPrivate Quick3DPrivate)

qt_add_executable(sponzatestapp
    main.cpp
)
target_link_libraries(sponzatestapp PUBLIC
    Qt::Core
    Qt::GuiPrivate
    Qt::Qml
    Qt::Quick
    Qt::Quick3DPrivate
)

qt6_add_shaders(sponzatestapp "shaders"
    PREFIX
        "/"
    FILES
        "color.vert"
        "color.frag"
)

qt6_add_lightprobe_images(sponzatestapp "ibl_assets"
    PREFIX
        "/"
    FILES
        "00455_OpenfootageNET_field_low.hdr"
)

qt6_add_resources(sponzatestapp "sponzatestapp_assets0"
    PREFIX
        "/"
    FILES
        qtquickcontrols2.conf
)

qt6_add_resources(sponzatestapp "sponzatestapp_assets"
    PREFIX
        "/"
    FILES
    "sponza.mesh"
    "maps/10381718147657362067.jpg"
    "maps/10388182081421875623.jpg"
    "maps/11474523244911310074.jpg"
    "maps/11490520546946913238.jpg"
    "maps/11872827283454512094.jpg"
    "maps/11968150294050148237.jpg"
    "maps/1219024358953944284.jpg"
    "maps/12501374198249454378.jpg"
    "maps/13196865903111448057.jpg"
    "maps/13824894030729245199.jpg"
    "maps/13982482287905699490.jpg"
    "maps/14118779221266351425.jpg"
    "maps/14170708867020035030.jpg"
    "maps/14267839433702832875.jpg"
    "maps/14650633544276105767.jpg"
    "maps/15295713303328085182.jpg"
    "maps/15722799267630235092.jpg"
    "maps/16275776544635328252.png"
    "maps/16299174074766089871.jpg"
    "maps/16885566240357350108.jpg"
    "maps/17556969131407844942.jpg"
    "maps/17876391417123941155.jpg"
    "maps/2051777328469649772.jpg"
    "maps/2185409758123873465.jpg"
    "maps/2299742237651021498.jpg"
    "maps/2374361008830720677.jpg"
    "maps/2411100444841994089.jpg"
    "maps/2775690330959970771.jpg"
    "maps/2969916736137545357.jpg"
    "maps/332936164838540657.jpg"
    "maps/3371964815757888145.jpg"
    "maps/3455394979645218238.jpg"
    "maps/3628158980083700836.jpg"
    "maps/3827035219084910048.jpg"
    "maps/4477655471536070370.jpg"
    "maps/4601176305987539675.jpg"
    "maps/466164707995436622.jpg"
    "maps/4675343432951571524.jpg"
    "maps/4871783166746854860.jpg"
    "maps/4910669866631290573.jpg"
    "maps/4975155472559461469.jpg"
    "maps/5061699253647017043.png"
    "maps/5792855332885324923.jpg"
    "maps/5823059166183034438.jpg"
    "maps/6047387724914829168.jpg"
    "maps/6151467286084645207.jpg"
    "maps/6593109234861095314.jpg"
    "maps/6667038893015345571.jpg"
    "maps/6772804448157695701.jpg"
    "maps/7056944414013900257.jpg"
    "maps/715093869573992647.jpg"
    "maps/7268504077753552595.jpg"
    "maps/7441062115984513793.jpg"
    "maps/755318871556304029.jpg"
    "maps/759203620573749278.jpg"
    "maps/7645212358685992005.jpg"
    "maps/7815564343179553343.jpg"
    "maps/8006627369776289000.png"
    "maps/8051790464816141987.jpg"
    "maps/8114461559286000061.jpg"
    "maps/8481240838833932244.jpg"
    "maps/8503262930880235456.jpg"
    "maps/8747919177698443163.jpg"
    "maps/8750083169368950601.jpg"
    "maps/8773302468495022225.jpg"
    "maps/8783994986360286082.jpg"
    "maps/9288698199695299068.jpg"
    "maps/9916269861720640319.jpg"
    "maps/white.png"
    "suzanne.mesh"
    "maps/Suzanne_BaseColor.png"
    "maps/Suzanne_MetallicRoughness.png"
)

qt_add_qml_module(sponzatestapp
    VERSION
        1.0
    URI
        SponzaTestApp
    QML_FILES
        main.qml
        Sponza.qml
        Suzanne.qml
    # SOURCES
    #     triangle.cpp triangle.h
    RESOURCE_PREFIX
        /
    NO_RESOURCE_TARGET_PATH
)
