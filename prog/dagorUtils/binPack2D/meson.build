RectangleBinPack = static_library(
    'RectangleBinPack',
    include_directories: include_directories('include'),
    sources : [
        'src/GuillotineBinPack.cpp',
        'src/MaxRectsBinPack.cpp',
        'src/PowerOfTwoBinPack.cpp',
        'src/SkylineBinPack.cpp'
    ],
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

rectangleBinPack_pkg = declare_dependency(
    link_with : RectangleBinPack,
    include_directories : include_directories('include'),
)
