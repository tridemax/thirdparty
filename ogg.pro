
CONFIG(debug, debug|release) {
	message("ogg_debug")

	TARGET = ogg_debug

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/ogg_debug

} else {
	message("ogg_release")

	TARGET = ogg

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/ogg_release
}

TEMPLATE = lib
CONFIG += staticlib
CONFIG -= qt
MAKEFILE = $$_PRO_FILE_PWD_/ogg_makefile

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
	-I$$_PRO_FILE_PWD_/libogg/include \
	-I$$_PRO_FILE_PWD_/libogg_config/linux

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
	libogg/src/bitwise.c \
	libogg/src/framing.c
