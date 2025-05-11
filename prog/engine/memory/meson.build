sources = files(
  'dlmalloc-2.8.4.c',
  'dagmem.cpp',
  'allocStep.cpp',
  'maxCrtPoolSz.cpp',
  'mspaceAlloc.cpp',
  'framemem.cpp',
  'physMem.cpp',
)

static_library(
  'memory',
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