sources = files(
  'regExp.cpp',
)

regexp_lib = static_library(
  'regExp',
  include_directories: [ 'include' ],
  sources: sources,
  dependencies: [
    # base
    static_library_dep,
    # includes
    dagorInclude,
  ],
)

regexp_util = declare_dependency(
  link_with: [ regexp_lib ],
  include_directories: [ 'include' ],
)