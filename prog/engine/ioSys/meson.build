sources = [
  'baseIo.cpp',
  'fileIo.cpp',
  'memIo.cpp',
  'chainedMemIo.cpp',
  'ioUtils.cpp',
  'zlibIo.cpp',
  'zlibIoFatal.cpp',
  'zstdIo.cpp',
  'zstdIoFatal.cpp',
  'asyncIo.cpp',
  'asyncIoCached.cpp',
  'msgIo.cpp',
  'obsolete_cfg.cpp',
  'roDataBlk.cpp',
  'vromfsLoad.cpp',
  'vromfsBacked.cpp',
  'findFiles.cpp',
  'fastSeqRead.cpp',
  'asyncWrite.cpp',
  'lzmaDecIo.cpp',
  'lzmaEnc.cpp',
  'lzmaIoFatal.cpp',
  'brotli.cpp',
  'oodleIoStub.cpp',
]

cpp_args = [ '-DUSE_ZLIB_VER=0xFF0000' ]

engine_kernel = static_library(
  'ioSys',
  sources: sources,
  cpp_args: cpp_args,
  dependencies: [
    # base
    engine_library_dep,
    # includes
    dagorInclude,
    dag_includes,
    engineSharedInclude,
    # packages
    stl_pkg,
    zlib_pkg,
    zstd_pkg,
    lzma_pkg,
  ],
)