sources = files(
  'boundingSphere.cpp',
  'calc_occluder.cpp',
  'capsuleTriangle.cpp',
  'checkNanTest.cpp',
  'colorMatrix.cpp',
  'convexHullComputer.cpp',
  # x86 arch sources
  'dxtDecompressSimd.cpp',
  'ffd44.cpp',
  'frustum.cpp',
  'gaussTbl.cpp',
  'geomTree.cpp',
  'half.cpp',
  'imageFunctions.cpp',
  'kaiserSimd.cpp',
  'math2d.cpp',
  'math3d.cpp',
  'mathAng.cpp',
  'mathUtils.cpp',
  'mesh.cpp',
  'perlin.cpp',
  'polyUtils.cpp',
  # static library sources
  'rndSeed.cpp',
  'sHmath.cpp',
  'triangleBoxIntersection.cpp',
  'triangleTriangleIntersection.cpp',
  'wooray2d.cpp',
  'wooray3d.cpp',
)

engine_math = static_library(
  'math',
  sources: sources,
  dependencies: [
    # base
    engine_library_dep,
    # includes
    dagorInclude,
    engineSharedInclude,
    dag_includes,
    # packages
    stl_pkg,
    mumhash_pkg,
  ],
)