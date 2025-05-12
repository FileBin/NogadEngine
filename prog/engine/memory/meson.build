memory_debug_level = get_option('memory_debug_level')
memory_suffix = ''

target_arguments = []

if memory_debug_level == 'off'
  target_arguments += [ '-DMEM_DEBUGALLOC=-1' ]
  memory_suffix = '-nd'
elif memory_debug_level == 'min'
  target_arguments += [ '-DMEM_DEBUGALLOC=0' ]
  memory_suffix = '-d0'
elif memory_debug_level == 'dbg'
  target_arguments += [ '-DMEM_DEBUGALLOC=1' ]
  memory_suffix = '-d1'
elif memory_debug_level == 'dbg2'
  target_arguments += [ '-DMEM_DEBUGALLOC=2' ]
  memory_suffix = '-d2'
elif memory_debug_level == 'dbg3'
  target_arguments += [ '-DMEM_DEBUGALLOC=3' ]
  memory_suffix = '-d3'
elif memory_debug_level == 'dbg4'
  target_arguments += [ '-DMEM_DEBUGALLOC=4' ]
  memory_suffix = '-d4'
elif memory_debug_level == 'dbg5'
  target_arguments += [ '-DMEM_DEBUGALLOC=5' ]
  memory_suffix = '-d5'
elif memory_debug_level == 'mtrk'
  target_arguments += [ '-DMEMORY_TRACKER=1' ]
  memory_suffix = '-mtrk'
endif

sources = files(
  'dlmalloc-2.8.4.c',
  'dagmem.cpp',
  'allocStep.cpp',
  'maxCrtPoolSz.cpp',
  'mspaceAlloc.cpp',
  'framemem.cpp',
  'physMem.cpp',
)

system = host_machine.system()
if system in ['darwin']
  sources += 'macMemInit.m'
elif system in ['windows', 'xboxone']
  sources += ['win32MoreCore.cpp', 'dagmem_start.c']
endif

engine_memory = static_library(
  'memory' + memory_suffix,
  sources: sources,
  cpp_args: target_arguments,
  c_args: target_arguments,
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