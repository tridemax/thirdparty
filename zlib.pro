
QT       -= core gui

CONFIG(debug, debug|release) {
	TARGET = zlib_debug
} else {
	TARGET = zlib_release
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
	-msse -msse2 -msse3 -mssse3 -msse4 -msse4.1 -msse4.2 -mavx -mf16c

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
    zlib/adler32.c \
    zlib/compress.c \
    zlib/crc32.c \
    zlib/deflate.c \
    zlib/gzclose.c \
    zlib/gzlib.c \
    zlib/gzread.c \
    zlib/gzwrite.c \
    zlib/infback.c \
    zlib/inffast.c \
    zlib/inflate.c \
    zlib/inftrees.c \
    zlib/trees.c \
    zlib/uncompr.c \
    zlib/zutil.c

HEADERS += \
    zlib/crc32.h \
    zlib/deflate.h \
    zlib/gzguts.h \
    zlib/inffast.h \
    zlib/inffixed.h \
    zlib/inflate.h \
    zlib/inftrees.h \
    zlib/trees.h \
    zlib/zconf.h \
    zlib/zlib.h \
    zlib/zutil.h
