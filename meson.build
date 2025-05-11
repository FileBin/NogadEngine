project('NogadEngine', 
        ['cpp', 'c'],
        version : '1.0',
        meson_version: '>1.1',
        default_options : ['cpp_std=c++17'])

subprojects = [
  'packages',
  'prog/config',
  'prog/dagorInclude',
  'prog/engine/sharedInclude',
  'prog/1stPartyLibs/dag',
  'prog/engine/osApiWrappers',
  'prog/engine/math',
  'prog/engine/memory',
]

foreach sp : subprojects
  subdir(sp)
endforeach 