sources = [
  'checkCpuid.cpp',
  'globals.cpp',
  'globals3d.cpp',
  'initCrt.cpp',
  'loadSettings.cpp',
  'applyCmdline.cpp',
  'mbReport.cpp',
  'inpDevClsDrv.cpp',
  'regCommonGameTex.cpp',
  'regCommonToolTex.cpp',
  'regTexCreateDds.cpp',
  'regTexCreateLoadable.cpp',
  'setDefFileTF.cpp',
  'setDefSymTF.cpp',
  'splashScreen_stub.cpp',
  'memReport.cpp',
  'memReportRef.cpp',
  'joy_data.cpp',
  'kbd_data.cpp',
  'ms_data.cpp',
]

system = host_machine.system()

if system == 'windows'
  sources += [
    'mbWinReport.cpp',
  ]
endif

engine_startup = static_library(
  'startup',
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