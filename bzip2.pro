
CONFIG(debug, debug|release) {
	message("bzip2_debug")

	TARGET = bzip2_debug

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/bzip2_debug

} else {
	message("bzip2_release")

	TARGET = bzip2

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/bzip2_release
}

TEMPLATE = lib
CONFIG += staticlib
CONFIG -= qt
QT -= core gui
MAKEFILE = $$_PRO_FILE_PWD_/bzip2.makefile

#-------------------------------------------------------------------------------------------------
# warnings
#-------------------------------------------------------------------------------------------------
QMAKE_CFLAGS_WARN_ON += \
	-Wno-parentheses \
	-Wno-unused-variable \
	-Wno-unused-parameter \
	-Wno-unused-local-typedefs \
	-Wno-unused-but-set-variable \
	-Wno-pointer-sign \
	-Wno-sign-compare \
	-Wno-unused-function \
	-Wno-maybe-uninitialized

#-------------------------------------------------------------------------------------------------
# compiler flags
#-------------------------------------------------------------------------------------------------
QMAKE_CFLAGS += \
	-m64 \
	-msse -msse2 -msse3 -mssse3 -msse4 -msse4.1 -msse4.2 -mavx -mf16c \
	-g \
	-fpic \
	-fdata-sections \
	-ffunction-sections \
	-fno-strict-aliasing

CONFIG(debug, debug|release) {
	DEFINES += _DEBUG DEBUG

} else {
	DEFINES += NDEBUG

	QMAKE_CFLAGS_RELEASE -= -O0 -O1 -O2
	QMAKE_CFLAGS_RELEASE *= -O3

	QMAKE_CXXFLAGS_RELEASE -= -O0 -O1 -O2
	QMAKE_CXXFLAGS_RELEASE *= -O3
}

#-------------------------------------------------------------------------------------------------
# files
#-------------------------------------------------------------------------------------------------
HEADERS += \
    bzip2/bzlib.h \
    bzip2/bzlib_private.h

SOURCES += \
    bzip2/blocksort.c \
    bzip2/bzlib.c \
    bzip2/compress.c \
    bzip2/crctable.c \
    bzip2/decompress.c \
    bzip2/huffman.c \
    bzip2/randtable.c
