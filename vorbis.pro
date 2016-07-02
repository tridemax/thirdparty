
CONFIG(debug, debug|release) {
	message("vorbis_debug")

	TARGET = vorbis_debug

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/vorbis_debug

} else {
	message("vorbis_release")

	TARGET = vorbis

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/vorbis_release
}

TEMPLATE = lib
CONFIG += staticlib
CONFIG -= qt
MAKEFILE = $$_PRO_FILE_PWD_/vorbis.makefile

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
	-g \
	-fpic \
	-fdata-sections \
	-ffunction-sections \
	-fno-strict-aliasing \
	-I$$_PRO_FILE_PWD_/libvorbis/include \
	-I$$_PRO_FILE_PWD_/libvorbis/lib \
	-I$$_PRO_FILE_PWD_/libvorbis_config/linux \
	-I$$_PRO_FILE_PWD_/libogg/include

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
	libvorbis/lib/analysis.c \
	libvorbis/lib/bitrate.c \
	libvorbis/lib/block.c \
	libvorbis/lib/codebook.c \
	libvorbis/lib/envelope.c \
	libvorbis/lib/floor0.c \
	libvorbis/lib/floor1.c \
	libvorbis/lib/info.c \
	libvorbis/lib/lookup.c \
	libvorbis/lib/lpc.c \
	libvorbis/lib/lsp.c \
	libvorbis/lib/mapping0.c \
	libvorbis/lib/mdct.c \
	libvorbis/lib/psy.c \
	libvorbis/lib/registry.c \
	libvorbis/lib/res0.c \
	libvorbis/lib/sharedbook.c \
	libvorbis/lib/smallft.c \
	libvorbis/lib/synthesis.c \
	libvorbis/lib/tone.c \
	libvorbis/lib/vorbisenc.c \
	libvorbis/lib/vorbisfile.c \
	libvorbis/lib/window.c
