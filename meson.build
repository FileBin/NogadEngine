project(
  'NogadEngine',
  ['cpp', 'c'],
  version: '1.0',
  meson_version: '>1.1',
  default_options: ['cpp_std=c++17'],
)

subprojects = [
  'packages',
  'prog/config',
  'prog/dagorInclude',
  'prog/engine/sharedInclude',
  'prog/dagorUtils/regExp',
  'prog/dagorUtils/binPack2D',
  'prog/1stPartyLibs/dag',
  'prog/engine/startup',
  'prog/engine/workCycle',
  'prog/engine/scene',
  'prog/engine/sceneRay',
  'prog/engine/kernel',
  'prog/engine/ioSys',
  'prog/engine/lib3d',
  'prog/engine/memory',
  'prog/engine/guiBase',
  'prog/engine/baseUtil',
  'prog/engine/coreUtil',
  'prog/engine/math',
  'prog/engine/anim',
  'prog/engine/osApiWrappers',
]

foreach sp : subprojects
  subdir(sp)
endforeach
