#if _TARGET_STATIC_LIB == 0
#define KRNLIMP
#elif _TARGET_PC_WIN
#ifdef __B_KERNEL_LIB
#define KRNLIMP __declspec(dllexport)
#else
#define KRNLIMP __declspec(dllimport)
#endif
#elif _TARGET_PC_LINUX
#ifdef __B_KERNEL_LIB
#define KRNLIMP __attribute__((visibility("default")))
#else
#define KRNLIMP
#endif
#else
#define KRNLIMP
#endif
