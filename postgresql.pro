
CONFIG(debug, debug|release) {
	message("postgresql_debug")

	TARGET = postgresql_debug

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/postgresql_debug

} else {
	message("postgresql_release")

	TARGET = postgresql

	DESTDIR = $$_PRO_FILE_PWD_/../.dist
	OBJECTS_DIR = $$_PRO_FILE_PWD_/../.int/postgresql_release
}

TEMPLATE = lib
CONFIG += staticlib
CONFIG -= qt
MAKEFILE = $$_PRO_FILE_PWD_/postgresql_makefile

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
	-I$$_PRO_FILE_PWD_/postgresql/src/include \
	-I$$_PRO_FILE_PWD_/postgresql/src/port \
	-I$$_PRO_FILE_PWD_/postgresql/src/backend \
	-I$$_PRO_FILE_PWD_/postgresql/src/interfaces/libpq \
	-I$$_PRO_FILE_PWD_/postgresql_config/linux

CONFIG(debug, debug|release) {
	DEFINES += _DEBUG DEBUG FRONTEND HAVE_CONFIG_H _GNU_SOURCE

} else {
	DEFINES += NDEBUG FRONTEND HAVE_CONFIG_H _GNU_SOURCE

	QMAKE_CFLAGS_RELEASE -= -O0 -O1 -O2
	QMAKE_CFLAGS_RELEASE *= -O3

	QMAKE_CXXFLAGS_RELEASE -= -O0 -O1 -O2
	QMAKE_CXXFLAGS_RELEASE *= -O3
}

#-------------------------------------------------------------------------------------------------
# files
#-------------------------------------------------------------------------------------------------
SOURCES += \
	postgresql/src/backend/libpq/ip.c \
	postgresql/src/backend/libpq/md5.c \
	postgresql/src/backend/utils/mb/encnames.c \
	postgresql/src/backend/utils/mb/wchar.c \
	postgresql/src/interfaces/libpq/fe-auth.c \
	postgresql/src/interfaces/libpq/fe-connect.c \
	postgresql/src/interfaces/libpq/fe-exec.c \
	postgresql/src/interfaces/libpq/fe-lobj.c \
	postgresql/src/interfaces/libpq/fe-misc.c \
	postgresql/src/interfaces/libpq/fe-print.c \
	postgresql/src/interfaces/libpq/fe-protocol2.c \
	postgresql/src/interfaces/libpq/fe-protocol3.c \
	postgresql/src/interfaces/libpq/fe-secure.c \
	postgresql/src/interfaces/libpq/libpq-events.c \
	postgresql/src/interfaces/libpq/pqexpbuffer.c \
	postgresql/src/port/strlcpy.c \
	postgresql/src/port/chklocale.c \
	postgresql/src/port/inet_net_ntop.c \
	postgresql/src/port/thread.c \
	postgresql/src/port/pgstrcasecmp.c \
	postgresql/src/port/noblock.c \
	postgresql/src/port/getpeereid.c
