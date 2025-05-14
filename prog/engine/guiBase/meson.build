sources = [
  'font.cpp',
  'imgui_drawlist.cpp',
  'stdGuiRender.cpp',
  'guiRenderCache.cpp',
  'cursorLite.cpp',
  'guiVars.cpp',
  'baseGuiStartup.cpp',
  'visConsole.cpp',
  'textMarks.cpp',
  'visualLog.cpp',
  'visualErr.cpp',
  'visMemReport.cpp',
]

engine_guiBase = static_library(
  'guiBase',
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
    freetype_pkg,
    harfbuzz_pkg,
    rectangleBinPack_pkg,
  ],
)