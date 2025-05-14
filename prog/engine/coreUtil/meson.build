sources = [
  'simplePBlock.cpp',
  'base64.cpp',
  'localization.cpp',
  'flyMode.cpp',
]

engine_coreUtil = static_library(
  'coreUtil',
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