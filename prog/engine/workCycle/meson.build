sources = [
  'gameSetts.cpp',
  'gameActRate.cpp',
  'gameSceneSelect.cpp',
  'gameSceneRenderer.cpp',
  'resetSpentTime.cpp',
  'workCycle.cpp',
  'workCyclePerf.cpp',
  'initVideo.cpp',
  'initNullJoystick.cpp',
  'initNullKeyb.cpp',
  'initNullMouse.cpp',
  'commonStart.cpp',
  'mainWndProc.cpp',
]

# Определяем платформу
system = host_machine.system()
deps = []

# Общие исходники для Windows, XboxOne и Scarlett
if system in ['windows', 'xboxone', 'scarlett']
  sources += [
    'initJoystick.cpp',
    'initJoystickXInput.cpp',
    'initKeybWin.cpp',
    'initMouseWin.cpp',
    'idleCycle.cpp'
  ]
endif

# Специфичные для Windows исходники
if system == 'windows'
  sources += 'windows/threadedWindow.cpp'
endif

# Специфичные для XboxOne и Scarlett исходники
if system in ['xboxone', 'scarlett']
  sources += [
    'xbox/keyboard.cpp',
    'xbox/IME.cpp'
  ]
endif

# Специфичные для macOS исходники
if system == 'darwin'  # macOS
  sources += [
    'macosx/macIdleCycle.mm',
    'initKeybWin.cpp',
    'initMouseWin.cpp'
  ]
endif

# Специфичные для iOS исходники
if system == 'ios'
  sources += [
    'macosx/iosIdleCycle.mm',
    'initJoystick.cpp',
    'initKeybWin.cpp',
    'initMouseWin.cpp'
  ]
endif

# Специфичные для tvOS исходники
if system == 'tvos'
  sources += [
    'macosx/iosIdleCycle.mm',
    'macosx/initRemoteControl.mm',
    'initKeybWin.cpp',
    'initMouseWin.cpp'
  ]
endif

# Специфичные для Linux исходники
if system == 'linux'
  sources += [
    'idleCycle.cpp',
    'initKeybWin.cpp',
    'initMouseWin.cpp',
    'initJoystickSteam.cpp'
  ]
  
  # Обработка опции X11
  linux_use_x11 = get_option('linux_use_x11')
  if linux_use_x11
    deps += x11_pkg
  endif
endif

# Специфичные для Android исходники
if system == 'android'
  sources += [
    'idleCycle.cpp',
    'initJoystick.cpp',
    'initKeybWin.cpp',
    'initMouseWin.cpp'
  ]
endif

engine_workCycle = static_library(
  'workCycle',
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
  ] + deps,
)