
INCLUDE (CheckIncludeFiles)
INCLUDE (CheckFunctionExists)
INCLUDE (CheckLibraryExists) 
INCLUDE (CheckTypeSize) 
INCLUDE (CheckSymbolExists)

# Define to the number of bits in type 'ptrdiff_t'.
CHECK_TYPE_SIZE("ptrdiff_t" SIZEOF_PTRDIFF_T)
IF (SIZEOF_PTRDIFF_T)
    SET(BITSIZEOF_PTRDIFF_T "(${SIZEOF_PTRDIFF_T}*8)")
ENDIF (SIZEOF_PTRDIFF_T)


# Define to the number of bits in type 'sig_atomic_t'. 
CHECK_TYPE_SIZE("sig_atomic_t" SIZEOF_SIG_ATOMIC_T)
IF (SIZEOF_SIG_ATOMIC_T)
    SET(BITSIZEOF_SIG_ATOMIC_T "(${SIZEOF_SIG_ATOMIC_T}*8)")
ENDIF (SIZEOF_SIG_ATOMIC_T)


# Define to the number of bits in type 'size_t'.
CHECK_TYPE_SIZE("size_t" SIZEOF_SIZE_T)
IF (SIZEOF_SIZE_T)
    SET(BITSIZEOF_SIZE_T "(${SIZEOF_SIZE_T}*8)")
ENDIF (SIZEOF_SIZE_T)

# Define to the number of bits in type 'wchar_t'.
CHECK_TYPE_SIZE("wchar_t" SIZEOF_WCHAR_T)
IF (SIZEOF_WCHAR_T)
    SET(BITSIZEOF_WCHAR_T "(${SIZEOF_WCHAR_T}*8)")
ENDIF (SIZEOF_WCHAR_T)

# Define to the number of bits in type 'wint_t'.
CHECK_TYPE_SIZE("wint_t" SIZEOF_WINT_T)
IF (SIZEOF_WINT_T)
    SET(BITSIZEOF_WINT_T "(${SIZEOF_WINT_T}*8)")
ENDIF (SIZEOF_WINT_T)

# Define to 1 if you have the <dlfcn.h> header file. 
CHECK_INCLUDE_FILES(dlfcn.h HAVE_DLFCN_H)

# Define to 1 if you have the <inttypes.h> header file. 
CHECK_INCLUDE_FILES(inttypes.h HAVE_INTTYPES_H)

# Define to 1 if the system has the type `long long int'. 
CHECK_TYPE_SIZE("long long int" HAVE_LONG_LONG_INT)

# Define if the 'malloc' function is POSIX compliant. 
IF (WIN32)
  UNSET(HAVE_MALLOC_POSIX)
ELSE (WIN32)
  SET(HAVE_MALLOC_POSIX ON)
ENDIF (WIN32)

# Define to 1 if you have the <memory.h> header file. 
CHECK_INCLUDE_FILES(memory.h HAVE_MEMORY_H)

# Define to 1 if you have the <stdint.h> header file. 
CHECK_INCLUDE_FILES(stdint.h HAVE_STDINT_H)

# Define to 1 if you have the <stdlib.h> header file. 
CHECK_INCLUDE_FILES(stdlib.h HAVE_STDLIB_H)

# Define to 1 if you have the <strings.h> header file. 
CHECK_INCLUDE_FILES(strings.h HAVE_STRINGS_H)

# Define to 1 if you have the <string.h> header file. 
CHECK_INCLUDE_FILES(string.h HAVE_STRING_H)

# Define to 1 if you have the <sys/bitypes.h> header file. 
CHECK_INCLUDE_FILES(sys/bitypes.h HAVE_SYS_BITYPES_H)

# Define to 1 if you have the <sys/inttypes.h> header file. 
CHECK_INCLUDE_FILES(sys/inttypes.h HAVE_SYS_INTTYPES_H)

# Define to 1 if you have the <sys/socket.h> header file. 
CHECK_INCLUDE_FILES(sys/socket.h HAVE_SYS_SOCKET_H)

# Define to 1 if you have the <sys/stat.h> header file. 
CHECK_INCLUDE_FILES(sys/stat.h HAVE_SYS_STAT_H)

# Define to 1 if you have the <sys/types.h> header file. 
CHECK_INCLUDE_FILES(sys/types.h HAVE_SYS_TYPES_H)

# Define to 1 if you have the <unistd.h> header file. 
CHECK_INCLUDE_FILES(unistd.h HAVE_UNISTD_H)

# Define to 1 if the system has the type `unsigned long long int'. 
CHECK_TYPE_SIZE("unsigned long long int" HAVE_UNSIGNED_LONG_LONG_INT)

# Define to 1 if you have the <wchar.h> header file. 
CHECK_INCLUDE_FILES(wchar.h HAVE_WCHAR_H)

# Define if you have the 'wchar_t' type. 
CHECK_SYMBOL_EXISTS(wchar_t wchar.h HAVE_WCHAR_T)

# Define to 1 if you have the <winsock2.h> header file. 
IF (WIN32)
  SET(HAVE_WINSOCK2_H ON)
ELSE (WIN32)
  UNSET(HAVE_WINSOCK2_H)
ENDIF (WIN32)

# Define if you have the 'wint_t' type. 
CHECK_TYPE_SIZE("wint_t" HAVE_WINT_T)

# The size of `unsigned int', as computed by sizeof.
CHECK_TYPE_SIZE("unsigned int" SIZEOF_UNSIGNED_INT)

# The size of `unsigned long int', as computed by sizeof.
CHECK_TYPE_SIZE("unsigned long int" SIZEOF_UNSIGNED_LONG_INT)
