
CONFIG(debug, debug|release) {
	message("unzip_debug")

	TARGET = unzip_debug

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/unzip_debug

} else {
	message("unzip_release")

	TARGET = unzip

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/unzip_release
}

TEMPLATE = lib
CONFIG += staticlib
CONFIG -= qt
QT -= core gui
MAKEFILE = $$_PRO_FILE_PWD_/unzip.makefile

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
SOURCES += \
    unzip/ioapi.c \
    unzip/mztools.c \
    unzip/unzip.c \
    unzip/zip.c

HEADERS += \
    unzip/crypt.h \
    unzip/ioapi.h \
    unzip/iowin32.h \
    unzip/mztools.h \
    unzip/unzip.h \
    unzip/zip.h
