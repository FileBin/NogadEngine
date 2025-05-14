sources_avx = [
  'MaskedOcclusionCulling_avx.cpp',
]

cpp_args = [ '-mavx2', '-mfma' ]

engine_moc_avx = static_library(
  'moc_avx',
  sources: sources_avx,
  cpp_args: cpp_args,
)

engine_moc_avx_dep = declare_dependency(
  link_with: engine_moc_avx
)