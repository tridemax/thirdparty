
QT       -= core gui

CONFIG(debug, debug|release) {
	TARGET = bzip2_debug
} else {
	TARGET = bzip2_release
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
