cmake_minimum_required (VERSION 3.1)
project (libtasn1 C)
set (MAJOR_VERSION 4)
set (MINOR_VERSION 13)
set (VERSION_PATCH 0)
set (VERSION 4.13)

OPTION(ENABLE_UNIT_TESTS "enable test ..." ON)

include(cmake/conanos.cmake)
include(cmake/config.cmake)

if(NOT LIBTASN1_PROJECT_DIR)
  set(LIBTASN1_PROJECT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libtasn1-${MAJOR_VERSION}.${MINOR_VERSION})
endif()

CONFIGURE_FILE( ${CMAKE_CURRENT_SOURCE_DIR}/cmake/config.h.cmakein ${CMAKE_CURRENT_BINARY_DIR}/config.h )


include_directories(${LIBTASN1_PROJECT_DIR}/lib
                    ${CMAKE_CURRENT_SOURCE_DIR}/cmake/msvc
					${CMAKE_CURRENT_BINARY_DIR}
					${LIBTASN1_PROJECT_DIR}/lib/gllib)
					
add_definitions(-DHAVE_CONFIG_H
    -DMAX=max
	-DMIN=min
	-D_GL_ATTRIBUTE_PURE=
    )

FILE(GLOB LIBTANSN1_SOURCES "${LIBTASN1_PROJECT_DIR}/lib/*.[hc]") 
add_library(libtasn1  STATIC ${LIBTANSN1_SOURCES})
assign_source_group(${LIBTANSN1_SOURCES})

install(FILES ${LIBTASN1_PROJECT_DIR}/lib/libtasn1.h DESTINATION include)
INSTALL(TARGETS libtasn1
       RUNTIME DESTINATION bin
       LIBRARY DESTINATION lib
	   ARCHIVE DESTINATION lib )

if(ENABLE_UNIT_TESTS )
  enable_testing()
endif()