
CONFIG(debug, debug|release) {
	message("crfsuite_debug")

	TARGET = crfsuite_debug

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/crfsuite_debug

} else {
	message("crfsuite_release")

	TARGET = crfsuite

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/crfsuite_release
}

TEMPLATE = lib
CONFIG += staticlib
CONFIG -= qt
QT -= core gui
MAKEFILE = $$_PRO_FILE_PWD_/crfsuite.makefile

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
    crfsuite/Src/cqdb/cqdb.h \
    crfsuite/Src/crf/crf1d.h \
    crfsuite/Src/crf/crfsuite_internal.h \
    crfsuite/Src/crf/logging.h \
    crfsuite/Src/crf/params.h \
    crfsuite/Src/crf/quark.h \
    crfsuite/Src/crf/rumavl.h \
    crfsuite/Src/crf/vecmath.h \
    crfsuite/Src/lbfgs/arithmetic_ansi.h \
    crfsuite/Src/lbfgs/lbfgs.h \
    crfsuite/Src/lbfgs/arithmetic_ansi.h \
    crfsuite/Src/lbfgs/arithmetic_sse_double.h \
    crfsuite/Src/lbfgs/arithmetic_sse_float.h

SOURCES += \
    crfsuite/Src/cqdb/cqdb.c \
    crfsuite/Src/cqdb/lookup3.c \
    crfsuite/Src/crf/crf1d_context.c \
    crfsuite/Src/crf/crf1d_encode.c \
    crfsuite/Src/crf/crf1d_feature.c \
    crfsuite/Src/crf/crf1d_model.c \
    crfsuite/Src/crf/crf1d_tag.c \
    crfsuite/Src/crf/crfsuite_train.c \
    crfsuite/Src/crf/crfsuite.c \
    crfsuite/Src/crf/dataset.c \
    crfsuite/Src/crf/dictionary.c \
    crfsuite/Src/crf/holdout.c \
    crfsuite/Src/crf/logging.c \
    crfsuite/Src/crf/params.c \
    crfsuite/Src/crf/quark.c \
    crfsuite/Src/crf/rumavl.c \
    crfsuite/Src/crf/train_arow.c \
    crfsuite/Src/crf/train_averaged_perceptron.c \
    crfsuite/Src/crf/train_l2sgd.c \
	crfsuite/Src/crf/train_lbfgs.c \
    crfsuite/Src/crf/train_passive_aggressive.c \
	crfsuite/Src/lbfgs/lbfgs.c
