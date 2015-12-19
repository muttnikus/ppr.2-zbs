# Try to find the GMP librairies
# GMP_FOUND - system has GMP lib
# GMP_INCLUDE_DIR - the GMP include directory
# GMP_LIBRARIES - Libraries needed to use GMP

if (GMP_INCLUDE_DIR AND GMP_LIBRARIES)
    # Already in cache, be silent
    set(GMP_FIND_QUIETLY TRUE)
endif (GMP_INCLUDE_DIR AND GMP_LIBRARIES)

find_path(GMP_INCLUDE_DIR NAMES gmp.h PATHS ~/lib/gmp/include NO_DEFAULT_PATH)
find_library(GMP_LIBRARIES NAMES gmp libgmp PATHS ~/lib/gmp/lib NO_DEFAULT_PATH)
find_library(GMPXX_LIBRARIES NAMES gmpxx libgmpxx PATHS ~/lib/gmp/lib NO_DEFAULT_PATH)

if (NOT GMP_FOUND)
    find_path(GMP_INCLUDE_DIR NAMES gmp.h)
    find_library(GMP_LIBRARIES NAMES gmp libgmp)
    find_library(GMPXX_LIBRARIES NAMES gmpxx libgmpxx)
endif (NOT GMP_FOUND)

MESSAGE(STATUS "GMP libs: " ${GMP_LIBRARIES} " " ${GMPXX_LIBRARIES} )

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GMP DEFAULT_MSG GMP_INCLUDE_DIR GMP_LIBRARIES)

mark_as_advanced(GMP_INCLUDE_DIR GMP_LIBRARIES)