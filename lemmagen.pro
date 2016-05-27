
QT       -= core gui

CONFIG(debug, debug|release) {
	TARGET = lemmagen_debug
} else {
	TARGET = lemmagen_release
}

TEMPLATE = lib
CONFIG += staticlib

OBJECTS_DIR = ./
DESTDIR = $$_PRO_FILE_PWD_/../_dist/lib

QMAKE_CXXFLAGS_WARN_ON += \
	-Wno-parentheses \
	-Wno-unused-variable \
	-Wno-unused-parameter \
	-Wno-unused-local-typedefs \
	-Wno-unused-but-set-variable \
	-Wno-sign-compare \
	-Wno-unused-function \
	-Wno-narrowing \
	-Wno-ignored-qualifiers \
	-Wno-pointer-arith \
	-Wno-conversion-null \
	-Wno-write-strings

QMAKE_CXXFLAGS += \
	-m64 \
	-msse -msse2 -msse3 -mssse3 -msse4 -msse4.1 -msse4.2 -mavx -mf16c

CONFIG(debug, debug|release) {
	message("This is debug.")

	DEFINES += _DEBUG DEBUG

} else {
	message("This is release.")

	DEFINES += NDEBUG

	QMAKE_CFLAGS_RELEASE -= -O0 -O1 -O2
	QMAKE_CFLAGS_RELEASE *= -O3

	QMAKE_CXXFLAGS_RELEASE -= -O0 -O1 -O2
	QMAKE_CXXFLAGS_RELEASE *= -O3
}

HEADERS += \
    lemmagen/header/BaseAlg.h \
    lemmagen/header/BaseNode.h \
    lemmagen/header/CmdLineParser.h \
    lemmagen/header/CoverNodeAlg.h \
    lemmagen/header/JoelRdr.h \
    lemmagen/header/JoelTree.h \
    lemmagen/header/MiscLib.h \
    lemmagen/header/Node.h \
    lemmagen/header/RdrLemmatizer.h \
    lemmagen/header/RdrLexer.h \
    lemmagen/header/RdrParser.h \
    lemmagen/header/RdrRule.h \
    lemmagen/header/RdrScanner.h \
    lemmagen/header/RdrStatistic.h \
    lemmagen/header/RdrTree.h \
    lemmagen/header/RdrXval.h \
    lemmagen/header/Rule.h \
    lemmagen/header/Statistics.h \
    lemmagen/header/Word.h \
    lemmagen/header/WordList.h \
    lemmagen/header/Xval.h

SOURCES += \
    lemmagen/source/BaseAlg.cpp \
    lemmagen/source/BaseNode.cpp \
    lemmagen/source/CmdLineParser.cpp \
    lemmagen/source/CoverNodeAlg.cpp \
    lemmagen/source/JoelRdr.cpp \
    lemmagen/source/JoelTree.cpp \
    lemmagen/source/MiscLib.cpp \
    lemmagen/source/Node.cpp \
    lemmagen/source/RdrLemmatizer.cpp \
    lemmagen/source/RdrLexer.cpp \
    lemmagen/source/RdrParser.cpp \
    lemmagen/source/RdrRule.cpp \
    lemmagen/source/RdrScanner.cpp \
    lemmagen/source/RdrTree.cpp \
    lemmagen/source/Rule.cpp \
    lemmagen/source/Statistics.cpp \
    lemmagen/source/Word.cpp \
    lemmagen/source/WordList.cpp \
    lemmagen/source/Xval.cpp
