sources = [
  'scene.cpp',
  'sceneIo.cpp',
  'tiledScene.cpp',
  'buildVisTree.cpp',
  'loadLevel.cpp',
  'physMat.cpp',
  'frtdump.cpp',
  'frtdumpMgr.cpp',
  'renderSceneMgr.cpp',
  'staticFxObjs.cpp',
  'visibility.cpp',
  'occlusionMap.cpp',
  'objsToPlace.cpp',
  'kdtree.cpp',
  'occlusionIo.cpp',
]

engine_scene = static_library(
  'scene',
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