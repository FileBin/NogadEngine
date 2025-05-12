sources = files(
  'animBlendCtrl.cpp',
  'animPostBlendCtrl.cpp',
  'animIKCtrl.cpp',
  'animFABRIKCtrl.cpp',
  'animChannels.cpp',
  'animGraph.cpp',
  'animGraphDbg.cpp',
  'animStateHolder.cpp',
  'footLockerIKCtrl.cpp',
  'simpleNodeAnim.cpp',
)


suf = ''
if get_option('dagoranim_measure_perf').enabled()
  suf = '~pm-' + get_option('dagoranim_measure_perf_frames').to_string()
endif

engine_anim = static_library(
  'anim' + suf,
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
    wyhash_pkg,
    rtm_pkg,
    regexp_util,
  ],
)