sources = [
  'texMgr.cpp',
  'bufMgr.cpp',
  'texMgrData.cpp',
  'texMgrCreat.cpp',
  'texMgrMem.cpp',
  'texMgrCon.cpp',
  'tqlInit.cpp',
  'loadDDSx/texLoad.cpp',
  'loadDDSx/texResize.cpp',
  'texMgrMt.cpp',
  'texMgrFileFactory.cpp',
  'texMgrSymFactory.cpp',
  'texMgrStubFactory.cpp',
  'textureFormat.cpp',
  'convertPixelFormat.cpp',
  'regTexCreateRaw.cpp',
  'regTexCreateTiff.cpp',
  'drv3dReset.cpp',
  'setGamma.cpp',
  'debug3dBuffered.cpp',
  'debug3dCached.cpp',
  'debug3dStates.cpp',
  'debug3dTex.cpp',
  'texPackMgr2.cpp',
  'createTex.cpp',
  'picMgr.cpp',
  'splashScreen.cpp',
  'applyTmd.cpp',
  'texIdHolder.cpp',
  'bufIdHolder.cpp',
  'resizableTex.cpp',
  'ringCPUQueryLock.cpp',
  'MaskedOcclusionCulling.cpp',
  'occlusionSystem.cpp',
  'quadIndexBuffer.cpp',
  'serialIntBuffer.cpp',
  'resourcePool.cpp',
  'texStreamingContext.cpp',
]

system = host_machine.system()

arch = host_machine.cpu()
message('cpu family is', arch)

deps = [
  # base
  engine_library_dep,
  # includes
  dagorInclude,
  dag_includes,
  engineSharedInclude,
  # packages
  stl_pkg,
  rectangleBinPack_pkg,
  libtiff_pkg,
]

if sse_level >= 6
  subdir('moc_avx')
  deps += engine_moc_avx_dep
endif

engine_lib3d = static_library(
  'lib3d',
  sources: sources,
  cpp_args: cpp_args,
  dependencies: deps,
)