
CONFIG(debug, debug|release) {
	message("cld2_debug")

	TARGET = cld2_debug

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/cld2_debug

} else {
	message("cld2_release")

	TARGET = cld2

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/cld2_release
}

TEMPLATE = lib
CONFIG += staticlib c++14
CONFIG -= qt
QT -= core gui
MAKEFILE = $$_PRO_FILE_PWD_/cld2.makefile

#-------------------------------------------------------------------------------------------------
# warnings
#-------------------------------------------------------------------------------------------------
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

#-------------------------------------------------------------------------------------------------
# compiler flags
#-------------------------------------------------------------------------------------------------
QMAKE_CXXFLAGS += \
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
    cld2/internal/cld2_dynamic_compat.h \
    cld2/internal/cld2_dynamic_data.h \
    cld2/internal/cld2_dynamic_data_extractor.h \
    cld2/internal/cld2_dynamic_data_loader.h \
    cld2/internal/cld2tablesummary.h \
    cld2/internal/cldutil.h \
    cld2/internal/cldutil_offline.h \
    cld2/internal/cldutil_shared.h \
    cld2/internal/compact_lang_det_hint_code.h \
    cld2/internal/compact_lang_det_impl.h \
    cld2/internal/debug.h \
    cld2/internal/fixunicodevalue.h \
    cld2/internal/generated_language.h \
    cld2/internal/generated_ulscript.h \
    cld2/internal/getonescriptspan.h \
    cld2/internal/integral_types.h \
    cld2/internal/lang_script.h \
    cld2/internal/langspan.h \
    cld2/internal/offsetmap.h \
    cld2/internal/port.h \
    cld2/internal/scoreonescriptspan.h \
    cld2/internal/stringpiece.h \
    cld2/internal/tote.h \
    cld2/internal/unittest_data.h \
    cld2/internal/utf8acceptinterchange.h \
    cld2/internal/utf8prop_lettermarkscriptnum.h \
    cld2/internal/utf8repl_lettermarklower.h \
    cld2/internal/utf8scannot_lettermarkspecial.h \
    cld2/internal/utf8statetable.h \
    cld2/public/compact_lang_det.h \
    cld2/public/encodings.h

SOURCES += \
    cld2/internal/cld2_do_score.cc \
    cld2/internal/cld2_dynamic_data.cc \
    cld2/internal/cld2_dynamic_data_extractor.cc \
    cld2/internal/cld2_dynamic_data_loader.cc \
    cld2/internal/cld2_dynamic_data_tool.cc \
    cld2/internal/cld2_generated_cjk_compatible.cc \
    cld2/internal/cld2_generated_deltaocta0122.cc \
    cld2/internal/cld2_generated_deltaocta0527.cc \
    cld2/internal/cld2_generated_deltaoctachrome.cc \
    cld2/internal/cld2_generated_distinctocta0122.cc \
    cld2/internal/cld2_generated_distinctocta0527.cc \
    cld2/internal/cld2_generated_distinctoctachrome.cc \
    cld2/internal/cld2_generated_octa2_dummy.cc \
    cld2/internal/cld2_generated_quad0122.cc \
    cld2/internal/cld2_generated_quad0720.cc \
    cld2/internal/cld2_generated_quadchrome_16.cc \
    cld2/internal/cld2_generated_quadchrome_2.cc \
    cld2/internal/cld2_unittest.cc \
    cld2/internal/cld2_unittest_full.cc \
    cld2/internal/cld_generated_cjk_delta_bi_32.cc \
    cld2/internal/cld_generated_cjk_delta_bi_4.cc \
    cld2/internal/cld_generated_cjk_uni_prop_80.cc \
    cld2/internal/cld_generated_score_quad_octa_0122.cc \
    cld2/internal/cld_generated_score_quad_octa_0122_2.cc \
    cld2/internal/cld_generated_score_quad_octa_1024_256.cc \
    cld2/internal/cld_generated_score_quad_octa_2.cc \
    cld2/internal/cldutil.cc \
    cld2/internal/cldutil_offline.cc \
    cld2/internal/cldutil_shared.cc \
    cld2/internal/compact_lang_det.cc \
    cld2/internal/compact_lang_det_hint_code.cc \
    cld2/internal/compact_lang_det_impl.cc \
    cld2/internal/compact_lang_det_test.cc \
    cld2/internal/debug.cc \
    cld2/internal/debug_empty.cc \
    cld2/internal/fixunicodevalue.cc \
    cld2/internal/generated_distinct_bi_0.cc \
    cld2/internal/generated_entities.cc \
    cld2/internal/generated_language.cc \
    cld2/internal/generated_ulscript.cc \
    cld2/internal/getonescriptspan.cc \
    cld2/internal/lang_script.cc \
    cld2/internal/offsetmap.cc \
    cld2/internal/scoreonescriptspan.cc \
    cld2/internal/scoreutf8text.cc \
    cld2/internal/tote.cc \
    cld2/internal/utf8statetable.cc
