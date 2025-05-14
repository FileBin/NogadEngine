# Общие исходные файлы
sources = [
  'fatalerr.cpp',
  'kernelGlobalSetting.cpp',
  'globalVars/occlusion_map.cpp',
  'globalVars/hdrMode.cpp',
  'cdebug.c',
  'debugDumpStack.cpp',
  'logimpl.cpp',
  'writeStream.cpp',
  'cpuControl.cpp',
  'perfTimer.cpp',
  'dagorHwExcept.cpp',
]

system = host_machine.system()
sanitize = get_option('sanitize').enabled()

if system in ['windows', 'darwin', 'linux']
  # Desktop
  sources += [
    'debug.cpp',
  ]
endif

if system in ['windows', 'xboxone', 'scarlett']
  # Windows-like
  sources += [
    'cpuFreq.cpp',
  ]
endif

if system in ['linux', 'android']
  # Linux-like
  sources += [
    'linux/linuxCpuFreq.cpp',
  ]
endif

if system in ['darwin', 'ios', 'tvos']
  # Apple-like
  sources += [
    'macosx/macCpuFreq.cpp',
  ]
  if system != 'tvos'
    # Not for tvOS
    sources += [
      'macosx/macGlobVars.cpp',
    ]
  endif
endif

if system == 'windows'
  sources += ['dagorMinidumpCallback.cpp']
endif

cpp_args = ['-D__B_NO_MEM_BASE_INCLUDE']

if sanitize and system in ['linux', 'darwin']
  cpp_args += '-DDAGOR_CAPTURE_STDERR=1'
endif

# Android-specific settings
if system == 'android'
  sources += [
    'android/native_app.c',
    'android/debug.cpp',
    'android/native_activity.cpp',
  ]
  android_opts = get_option('android_options')
  if android_opts.get('use_signal_handler', false) and not android_opts.get('upload_crashlytics_symbols', false)
    cpp_args += '-DANDROID_ENABLE_SIGNAL_LOG=1'
  endif
  includes += include_directories(get_option('android_ndk_path') / 'sources/android/cpufeatures')
endif

engine_kernel = static_library(
  'kernel',
  sources: sources,
  cpp_args: cpp_args,
  dependencies: [
    # base
    engine_library_dep,
    # includes
    dagorInclude,
    engineSharedInclude,
    # packages
    stl_pkg,
  ],
)