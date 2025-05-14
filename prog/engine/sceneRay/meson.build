sources = [
  'buildableSceneRay.cpp',
  'deserializedSceneRay.cpp',
  'sceneray.cpp',
  'tri_box_overlap.cpp',
]

engine_sceneRay = static_library(
  'sceneRay',
  sources: sources,
  dependencies: [
    # base
    engine_library_dep,
    # includes
    dagorInclude,
    dag_includes,
    engineSharedInclude,
    # packages
    stl_pkg,
  ],
)