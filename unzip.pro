
QT       -= core gui

CONFIG(debug, debug|release) {
	TARGET = unzip_debug
} else {
	TARGET = unzip_release
}

TEMPLATE = lib
CONFIG += staticlib

OBJECTS_DIR = ./
DESTDIR = $$_PRO_FILE_PWD_/../_dist/lib

QMAKE_CFLAGS_WARN_ON += \
	-Wno-parentheses \
	-Wno-unused-variable \
	-Wno-unused-parameter \
	-Wno-unused-local-typedefs \
	-Wno-unused-but-set-variable \
	-Wno-pointer-sign \
	-Wno-sign-compare \
	-Wno-unused-function

QMAKE_CFLAGS += \
	-m64 \
	-msse -msse2 -msse3 -mssse3 -msse4 -msse4.1 -msse4.2 -mavx -mf16c \
	-I$$_PRO_FILE_PWD_/zlib

CONFIG(debug, debug|release) {
	message("This is debug.")

	DEFINES += _DEBUG DEBUG

} else {
	message("This is release.")

	DEFINES += NDEBUG

	QMAKE_CFLAGS += -include $$_PRO_FILE_PWD_/_alloc_redefine.h

	QMAKE_CFLAGS_RELEASE -= -O0 -O1 -O2
	QMAKE_CFLAGS_RELEASE *= -O3

	QMAKE_CXXFLAGS_RELEASE -= -O0 -O1 -O2
	QMAKE_CXXFLAGS_RELEASE *= -O3
}

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
