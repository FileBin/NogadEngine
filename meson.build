project('NogadEngine', 'cpp',
        version : '1.0',
        default_options : ['cpp_std=c++17'])

# Добавляем подпроекты
# Указываем кастомный путь к подпроектам
subproject_dir = 'prog/engine'

# Или динамически:
subprojects = [
  'prog/dagorInclude',
  'prog/engine/sharedInclude',
  'prog/engine/osApiWrappers',
]

foreach sp : subprojects
  subdir(sp)
endforeach 