sources = [
  'fastStrMap.cpp',
  'tabMem.cpp',
  'tabSorted.cpp',
  'strImpl.cpp',
  'dobject.cpp',
  'fatalCtx.cpp',
  'bitArray.cpp',
  'syncExecScheduler.cpp',
  'hierBitMem.cpp',
  'restart.cpp',
  'texMetaData.cpp',
  'unicodeHlp.cpp',
  'safeArg.cpp',
  'threadPool.cpp',
  'parallelFor.cpp',
  'watchdog.cpp',
  'delayedActions.cpp',
  'treeBitmap.cpp',
  'lag.cpp',
  'fnameMap.cpp',
  'fileMd5Validate.cpp',
]

engine_baseUtil = static_library(
  'baseUtil',
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
    md5_pkg,
  ],
)