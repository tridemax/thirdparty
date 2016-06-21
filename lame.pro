
CONFIG(debug, debug|release) {
	message("lame_debug")

	TARGET = lame_debug

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/lame_debug

} else {
	message("lame_release")

	TARGET = lame

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/lame_release
}

TEMPLATE = lib
CONFIG += staticlib
CONFIG -= qt
MAKEFILE = $$_PRO_FILE_PWD_/lame.makefile

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
	-I$$_PRO_FILE_PWD_/lame \
	-I$$_PRO_FILE_PWD_/lame/include \
	-I$$_PRO_FILE_PWD_/lame/libmp3lame \
	-I$$_PRO_FILE_PWD_/lame_config/linux

CONFIG(debug, debug|release) {
	DEFINES += _DEBUG DEBUG HAVE_CONFIG_H

} else {
	DEFINES += NDEBUG HAVE_CONFIG_H

	QMAKE_CFLAGS_RELEASE -= -O0 -O1 -O2
	QMAKE_CFLAGS_RELEASE *= -O3

	QMAKE_CXXFLAGS_RELEASE -= -O0 -O1 -O2
	QMAKE_CXXFLAGS_RELEASE *= -O3
}

#-------------------------------------------------------------------------------------------------
# files
#-------------------------------------------------------------------------------------------------
SOURCES += \
	lame/libmp3lame/vector/xmm_quantize_sub.c \
	lame/libmp3lame/bitstream.c \
	lame/libmp3lame/encoder.c \
	lame/libmp3lame/fft.c \
	lame/libmp3lame/gain_analysis.c \
	lame/libmp3lame/id3tag.c \
	lame/libmp3lame/lame.c \
	lame/libmp3lame/newmdct.c \
	lame/libmp3lame/presets.c \
	lame/libmp3lame/psymodel.c \
	lame/libmp3lame/quantize.c \
	lame/libmp3lame/quantize_pvt.c \
	lame/libmp3lame/reservoir.c \
	lame/libmp3lame/set_get.c \
	lame/libmp3lame/tables.c \
	lame/libmp3lame/takehiro.c \
	lame/libmp3lame/util.c \
	lame/libmp3lame/vbrquantize.c \
	lame/libmp3lame/VbrTag.c \
	lame/libmp3lame/version.c
