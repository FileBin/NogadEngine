project('NogadEngine', 'cpp',
        version : '1.0',
        meson_version: '>1.1',
        default_options : ['cpp_std=c++17'])

subprojects = [
  'prog/config',
  'prog/dagorInclude',
  'prog/engine/sharedInclude',
  'prog/engine/osApiWrappers',
]

foreach sp : subprojects
  subdir(sp)
endforeach 