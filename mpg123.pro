
CONFIG(debug, debug|release) {
	message("mpg123_debug")

	TARGET = mpg123_debug

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/mpg123_debug

} else {
	message("mpg123_release")

	TARGET = mpg123

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/mpg123_release
}

TEMPLATE = lib
CONFIG += staticlib
CONFIG -= qt
MAKEFILE = $$_PRO_FILE_PWD_/mpg123.makefile

#-------------------------------------------------------------------------------------------------
# warnings
#-------------------------------------------------------------------------------------------------
QMAKE_CFLAGS_WARN_ON += \
	-Wno-parentheses \
	-Wno-unused-variable \
	-Wno-unused-parameter \
	-Wno-unused-local-typedefs \
	-Wno-unused-but-set-variable \
	-Wno-sign-compare \
	-Wno-unused-function \
	-Wno-implicit-function-declaration \
	-Wno-empty-body

#-------------------------------------------------------------------------------------------------
# compiler flags
#-------------------------------------------------------------------------------------------------
QMAKE_CFLAGS += \
	-std=gnu11 \
	-m64 \
	-msse -msse2 -msse3 -mssse3 -msse4 -msse4.1 -msse4.2 -mavx -mf16c \
	-fpic \
	-fdata-sections \
	-ffunction-sections \
	-I$$_PRO_FILE_PWD_/mpg123/src \
	-I$$_PRO_FILE_PWD_/mpg123/src/compat \
	-I$$_PRO_FILE_PWD_/mpg123/src/libmpg123 \
	-I$$_PRO_FILE_PWD_/mpg123_config/linux

CONFIG(debug, debug|release) {
	DEFINES += _DEBUG DEBUG OPT_GENERIC HAVE_CONFIG_H

} else {
	DEFINES += NDEBUG OPT_GENERIC HAVE_CONFIG_H

	QMAKE_CFLAGS_RELEASE -= -O0 -O1 -O2
	QMAKE_CFLAGS_RELEASE *= -O3

	QMAKE_CXXFLAGS_RELEASE -= -O0 -O1 -O2
	QMAKE_CXXFLAGS_RELEASE *= -O3
}

#-------------------------------------------------------------------------------------------------
# files
#-------------------------------------------------------------------------------------------------
SOURCES += \
	mpg123/src/libmpg123/compat.c \
	mpg123/src/libmpg123/dct64.c \
	mpg123/src/libmpg123/dither.c \
	mpg123/src/libmpg123/equalizer.c \
	mpg123/src/libmpg123/feature.c \
	mpg123/src/libmpg123/format.c \
	mpg123/src/libmpg123/frame.c \
	mpg123/src/libmpg123/icy.c \
	mpg123/src/libmpg123/icy2utf8.c \
	mpg123/src/libmpg123/id3.c \
	mpg123/src/libmpg123/index.c \
	mpg123/src/libmpg123/layer1.c \
	mpg123/src/libmpg123/layer2.c \
	mpg123/src/libmpg123/layer3.c \
	mpg123/src/libmpg123/libmpg123.c \
	mpg123/src/libmpg123/ntom.c \
	mpg123/src/libmpg123/optimize.c \
	mpg123/src/libmpg123/parse.c \
	mpg123/src/libmpg123/readers.c \
	mpg123/src/libmpg123/stringbuf.c \
	mpg123/src/libmpg123/synth.c \
	mpg123/src/libmpg123/synth_real.c \
	mpg123/src/libmpg123/synth_s32.c \
	mpg123/src/libmpg123/tabinit.c \
	mpg123/src/libmpg123/synth_8bit.c
