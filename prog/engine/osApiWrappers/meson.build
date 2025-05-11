sources = files(
  #linux sources
  'linux/linuxClipboard.cpp',

  #linux android sources
  'linux/linuxSetTitle.cpp',
  'convertUTF.cpp',
  'posix/posixAIOAsyncRead.cpp',
  
  'basePath.cpp',
  'basePathMgr.cpp',
  'cpuFeatures.cpp',
  'cpuJobs.cpp',
  'critsec.cpp',
  'dbgStr.cpp',
  'dbgStrFmt.cpp',
  'directoryService.cpp',
  'directoryWatch.cpp',
  'dynLib.cpp',
  'events.cpp',
  'fileIoErr.cpp',
  'findFilePosix.cpp',
  'getRealFname.cpp',
  'globalMutex.cpp',
  'ip2str.cpp',
  'limBufWriter.cpp',
  'localCmp.cpp',
  'miscApi.cpp',
  'mmap.cpp',
  'namedMounts.cpp',
  'progGlobals.cpp',
  'rwlock.cpp',
  'setThreadName.cpp',
  'sharedMem.cpp',
  'shellExecute.cpp',
  'simplifyFname.cpp',
  'singleProcessChecker.cpp',
  'sockets.cpp',
  'spinlock.cpp',
  'stackHlpFill.cpp',
  'stackHlpGet.cpp',
  'symHlp.cpp',
  'syncFileIo.cpp',
  'threads.cpp',
  'timedCritsec.cpp',
  'unicode.cpp',
  'virtualMem.cpp',
  'vromfs.cpp',
  'wildcards.cpp',
  'wndProcComponent.cpp',
)

static_library(
  'osApiWrappers',
  sources: sources,
  dependencies: [
    # base
    engine_library_dep,
    # includes
    dagorInclude,
    engineSharedInclude,
    # packages
    stl_pkg,
    x11_pkg,
  ],
)