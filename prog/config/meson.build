# Получаем компилятор
compiler = meson.get_compiler('cpp')

# Функция для определения максимальной поддержки SIMD
determine_sse_version = '''
#include <immintrin.h>
int main() {
  #if defined(__AVX512F__)
    return 6;
  #elif defined(__AVX2__)
    return 5;
  #elif defined(__AVX__)
    return 4;
  #elif defined(__SSE4_2__)
    return 3;
  #elif defined(__SSE3__)
    return 2;
  #elif defined(__SSE2__)
    return 1;
  #else
    return 0;
  #endif
}
'''

# Проверяем поддержку инструкций
sse_levels = [
  {'name': 'avx512', 'flag': '-mavx512f', 'def': '4'},
  {'name': 'avx2', 'flag': '-mavx2', 'def': '4'},
  {'name': 'avx', 'flag': '-mavx', 'def': '4'},
  {'name': 'sse4.2', 'flag': '-msse4.2', 'def': '4'},
  {'name': 'sse3', 'flag': '-msse3', 'def': '3'},
  {'name': 'sse2', 'flag': '-msse2', 'def': '2'}
]

# Автовыбор максимальной поддержки
foreach level : sse_levels
  if compiler.links(determine_sse_version, args: level['flag'], name: 'Check ' + level['name'])
    sse_flag = level['flag']
    sse_def = level['def']
    break
  endif
endforeach

# Фолбэк на базовый SSE2 если ничего не найдено
if not is_variable('sse_version')
  sse_flag = '-msse2'
  sse_def = '2'
endif

message('Auto-detected SSE flag:', sse_flag)

# Конфигурация компилятора
common_flags = [
  '-pipe',
  '-c',
  '@0@'.format(get_variable('sse_flag')),  # Динамический флаг (avx/sse4.2 и т.д.)
  '-m64',
  '-MMD',
  '-Wno-trigraphs',
  '-Wno-multichar',
  '-Wformat',
  '-Wno-format-extra-args',
  '-Wno-ignored-attributes',
  '-Wno-deprecated',
  '-Wno-format-truncation',
  '-Wno-nonnull',
  '-ffunction-sections',
  '-fdata-sections',
  '-fno-omit-frame-pointer',
  '-ffast-math',
  '-ffinite-math-only',

  '-minline-all-stringops',
  '-Wuninitialized',
  '-Werror=uninitialized',
  '-Wno-deprecated-declarations',
  '-Wno-maybe-uninitialized',
  '-Wno-stringop-overflow',
  '-Wno-stringop-overread',
  '-D__forceinline=inline __attribute__((always_inline))',
  '-D__cdecl=',
  '-D__stdcall=',
  '-D__fastcall=',
  '-D_POSIX_C_SOURCE=200809L',
  '-D_GNU_SOURCE',
  '-D_snprintf=snprintf',
  '-D_vsnprintf=vsnprintf',
  '-Dstricmp=strcasecmp',
  '-Dstrnicmp=strncasecmp',
  '-D_TARGET_PC=3',
  '-D_TARGET_PC_LINUX=3',
  '-D_TARGET_64BIT=1',
  '-D__LINUX__=64',
  '-D_TARGET_SIMD_SSE=@0@'.format(sse_def),
  '-Di_strlen=(int)strlen',
  '-D__STDC_CONSTANT_MACROS',
  '-DDAGOR_DBGLEVEL=@0@'.format(get_option('debug_level')),
]

cpp_flags = [
  '-fpermissive',
  '-Wno-invalid-offsetof',
  '-include', 'memory/dag_memBase.h'
]

if compiler.get_id() == 'gcc'
  common_flags += '-mno-recip'
  cpp_flags += '-fconserve-space'
endif

if host_machine.system() == 'linux'
  #TODO: move here linux options
endif

if get_option('use_exceptions')
    cpp_flags += [ '-fexceptions', '-DDAGOR_EXCEPTIONS_ENABLED=1']
else
    cpp_flags += '-fno-exceptions'
endif

if get_option('use_rtti')
  cpp_flags += '-fno-rtti'
else
  cpp_flags += '-frtti'
endif

if get_option('use_stack_protection')
    cpp_flags += '-fstack-protector'
else
    cpp_flags += '-fno-stack-protector'
endif

add_global_arguments(common_flags + cpp_flags, language: 'cpp')
add_global_arguments(common_flags, language: 'c')

static_library_flags = [
  '-D_TARGET_STATIC_LIB=1',
]

engine_library_flags = static_library_flags + [ '-D__B_KERNEL_LIB' ]

static_library_dep = declare_dependency(
  compile_args: static_library_flags,
)

engine_library_dep = declare_dependency(
  compile_args: engine_library_flags,
)