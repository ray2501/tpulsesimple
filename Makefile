# Makefile.in --
#
#	This file is a Makefile for Sample TEA Extension.  If it has the name
#	"Makefile.in" then it is a template for a Makefile;  to generate the
#	actual Makefile, run "./configure", which is a configuration script
#	generated by the "autoconf" program (constructs like "@foo@" will get
#	replaced in the actual Makefile.
#
# Copyright (c) 1999 Scriptics Corporation.
# Copyright (c) 2002-2005 ActiveState Corporation.
#
# See the file "license.terms" for information on usage and redistribution
# of this file, and for a DISCLAIMER OF ALL WARRANTIES.

#========================================================================
# Add additional lines to handle any additional AC_SUBST cases that
# have been added in a customized configure script.
#========================================================================

#SAMPLE_NEW_VAR	= @SAMPLE_NEW_VAR@

#========================================================================
# Nothing of the variables below this line should need to be changed.
# Please check the TARGETS section below to make sure the make targets
# are correct.
#========================================================================

#========================================================================
# The names of the source files is defined in the configure script.
# The object files are used for linking into the final library.
# This will be used when a dist target is added to the Makefile.
# It is not important to specify the directory, as long as it is the
# $(srcdir) or in the generic, win or unix subdirectory.
#========================================================================

PKG_SOURCES	=  tpulsesimple.c
PKG_OBJECTS	=  tpulsesimple.o

PKG_STUB_SOURCES = 
PKG_STUB_OBJECTS = 

#========================================================================
# PKG_TCL_SOURCES identifies Tcl runtime files that are associated with
# this package that need to be installed, if any.
#========================================================================

PKG_TCL_SOURCES = 

#========================================================================
# This is a list of public header files to be installed, if any.
#========================================================================

PKG_HEADERS	= 

#========================================================================
# "PKG_LIB_FILE" refers to the library (dynamic or static as per
# configuration options) composed of the named objects.
#========================================================================

PKG_LIB_FILE	= libtpulsesimple0.5.so
PKG_LIB_FILE8	= libtpulsesimple0.5.so
PKG_LIB_FILE9	= libtcl9tpulsesimple0.5.so
PKG_STUB_LIB_FILE = libtpulsesimplestub0.5.a

lib_BINARIES	= $(PKG_LIB_FILE)
BINARIES	= $(lib_BINARIES)

SHELL		= /bin/sh

srcdir		= .
prefix		= /usr
exec_prefix	= /usr

bindir		= ${exec_prefix}/bin
libdir		= ${exec_prefix}/lib64
includedir	= ${prefix}/include
datarootdir	= ${prefix}/share
runstatedir	= ${localstatedir}/run
datadir		= ${datarootdir}
mandir		= ${datarootdir}/man

DESTDIR		=

PKG_DIR		= $(PACKAGE_NAME)$(PACKAGE_VERSION)
pkgdatadir	= $(datadir)/$(PKG_DIR)
pkglibdir	= $(libdir)/$(PKG_DIR)
pkgincludedir	= $(includedir)/$(PKG_DIR)

top_builddir	= /home/danilo/Public/tpulsesimple

INSTALL_OPTIONS	=
INSTALL		= $(SHELL) $(srcdir)/tclconfig/install-sh -c $(INSTALL_OPTIONS)
INSTALL_DATA_DIR = ${INSTALL} -d -m 755
INSTALL_DATA	= ${INSTALL} -m 644
INSTALL_PROGRAM	= ${INSTALL} -m 755
INSTALL_SCRIPT	= ${INSTALL} -m 755
INSTALL_LIBRARY	= ${INSTALL} -m 644

PACKAGE_NAME	= tpulsesimple
PACKAGE_VERSION	= 0.5
CC		= gcc
CCLD		= @CCLD@
CFLAGS_DEFAULT	= -O2 -fomit-frame-pointer -DNDEBUG
CFLAGS_WARNING	= -Wall
EXEEXT		= 
LDFLAGS_DEFAULT	= 
MAKE_LIB	= ${SHLIB_LD} ${LDFLAGS} ${LDFLAGS_DEFAULT} -o $@ $(PKG_OBJECTS) ${SHLIB_LD_LIBS} 
MAKE_STUB_LIB	= ${STLIB_LD} $@ $(PKG_STUB_OBJECTS)
OBJEXT		= o
RANLIB		= :
RANLIB_STUB	= ranlib
SHLIB_CFLAGS	= -fPIC
SHLIB_LD	= ${CC} ${CFLAGS} ${LDFLAGS_DEFAULT} -shared
SHLIB_LD_LIBS	= ${LIBS} -L/usr/lib64 -ltclstub8.6
STLIB_LD	= ${AR} cr
#TCL_DEFS	= -DPACKAGE_NAME=\"tcl\" -DPACKAGE_TARNAME=\"tcl\" -DPACKAGE_VERSION=\"8.6\" -DPACKAGE_STRING=\"tcl\ 8.6\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -DHAVE_STDIO_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_STRINGS_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_UNISTD_H=1 -DHAVE_SYS_TIME_H=1 -DSTDC_HEADERS=1 -DHAVE_SYS_PARAM_H=1 -DUSE_THREAD_ALLOC=1 -D_REENTRANT=1 -D_THREAD_SAFE=1 -DHAVE_PTHREAD_ATTR_SETSTACKSIZE=1 -DHAVE_PTHREAD_ATFORK=1 -DTCL_THREADS=1 -DTCL_CFGVAL_ENCODING=\"iso8859-1\" -DHAVE_ZLIB=1 -DMODULE_SCOPE=extern\ __attribute__\(\(__visibility__\(\"hidden\"\)\)\) -DHAVE_HIDDEN=1 -DHAVE_CAST_TO_UNION=1 -DHAVE_VFORK=1 -DHAVE_POSIX_SPAWNP=1 -DHAVE_POSIX_SPAWN_FILE_ACTIONS_ADDDUP2=1 -DHAVE_POSIX_SPAWNATTR_SETFLAGS=1 -DTCL_SHLIB_EXT=\".so\" -DNDEBUG=1 -DTCL_CFG_OPTIMIZED=1 -DMP_PREC=4 -D_LARGEFILE64_SOURCE=1 -DTCL_WIDE_INT_IS_LONG=1 -DHAVE_GETCWD=1 -DHAVE_MKSTEMP=1 -DHAVE_OPENDIR=1 -DHAVE_STRTOL=1 -DHAVE_WAITPID=1 -DHAVE_GETNAMEINFO=1 -DHAVE_GETADDRINFO=1 -DHAVE_FREEADDRINFO=1 -DHAVE_GAI_STRERROR=1 -DHAVE_STRUCT_ADDRINFO=1 -DHAVE_STRUCT_IN6_ADDR=1 -DHAVE_STRUCT_SOCKADDR_IN6=1 -DHAVE_STRUCT_SOCKADDR_STORAGE=1 -DHAVE_GETPWUID_R_5=1 -DHAVE_GETPWUID_R=1 -DHAVE_GETPWNAM_R_5=1 -DHAVE_GETPWNAM_R=1 -DHAVE_GETGRGID_R_5=1 -DHAVE_GETGRGID_R=1 -DHAVE_GETGRNAM_R_5=1 -DHAVE_GETGRNAM_R=1 -DHAVE_DECL_GETHOSTBYNAME_R=1 -DHAVE_GETHOSTBYNAME_R_6=1 -DHAVE_GETHOSTBYNAME_R=1 -DHAVE_DECL_GETHOSTBYADDR_R=1 -DHAVE_GETHOSTBYADDR_R_8=1 -DHAVE_GETHOSTBYADDR_R=1 -DHAVE_TERMIOS_H=1 -DHAVE_SYS_IOCTL_H=1 -DHAVE_SYS_TIME_H=1 -DTIME_WITH_SYS_TIME=1 -DHAVE_GMTIME_R=1 -DHAVE_LOCALTIME_R=1 -DHAVE_MKTIME=1 -DHAVE_TM_GMTOFF=1 -DHAVE_TIMEZONE_VAR=1 -DHAVE_STRUCT_STAT_ST_BLOCKS=1 -DHAVE_STRUCT_STAT_ST_BLKSIZE=1 -DHAVE_BLKCNT_T=1 -DHAVE_INTPTR_T=1 -DHAVE_UINTPTR_T=1 -DNO_UNION_WAIT=1 -DHAVE_SIGNED_CHAR=1 -DHAVE_LANGINFO=1 -DHAVE_MKSTEMPS=1 -DHAVE_FTS=1 -DHAVE_SYS_IOCTL_H=1 -DTCL_UNLOAD_DLLS=1 -DHAVE_CPUID=1
TCL_BIN_DIR	= /usr/lib64
TCL_SRC_DIR	= /home/abuild/rpmbuild/BUILD/tcl8.6.15
#TK_BIN_DIR	= @TK_BIN_DIR@
#TK_SRC_DIR	= @TK_SRC_DIR@

# Not used, but retained for reference of what libs Tcl required
#TCL_LIBS	= 

#========================================================================
# TCLLIBPATH seeds the auto_path in Tcl's init.tcl so we can test our
# package without installing.  The other environment variables allow us
# to test against an uninstalled Tcl.  Add special env vars that you
# require for testing here (like TCLX_LIBRARY).
#========================================================================

EXTRA_PATH	= $(top_builddir):$(TCL_BIN_DIR)
#EXTRA_PATH	= $(top_builddir):$(TCL_BIN_DIR):$(TK_BIN_DIR)
TCLLIBPATH	= $(top_builddir)
TCLSH_ENV	= TCL_LIBRARY=`echo $(TCL_SRC_DIR)/library`
PKG_ENV		= LD_LIBRARY_PATH="$(EXTRA_PATH):$(LD_LIBRARY_PATH)" \
		  PATH="$(EXTRA_PATH):$(PATH)" \
		  TCLLIBPATH="$(TCLLIBPATH)"

TCLSH_PROG	= /usr/bin/tclsh8.6
TCLSH		= $(TCLSH_ENV) $(PKG_ENV) $(TCLSH_PROG)

#WISH_ENV	= TK_LIBRARY=`echo $(TK_SRC_DIR)/library`
#WISH_PROG	= @WISH_PROG@
#WISH		= $(TCLSH_ENV) $(WISH_ENV) $(PKG_ENV) $(WISH_PROG)

SHARED_BUILD	= 1

INCLUDES	=  -I"/usr/include" -I.
#INCLUDES	=  -I"/usr/include" @TK_INCLUDES@ @TK_XINCLUDES@

PKG_CFLAGS	=  

# TCL_DEFS is not strictly need here, but if you remove it, then you
# must make sure that configure.ac checks for the necessary components
# that your library may use.  TCL_DEFS can actually be a problem if
# you do not compile with a similar machine setup as the Tcl core was
# compiled with.
#DEFS		= $(TCL_DEFS) -DPACKAGE_NAME=\"tpulsesimple\" -DPACKAGE_TARNAME=\"tpulsesimple\" -DPACKAGE_VERSION=\"0.5\" -DPACKAGE_STRING=\"tpulsesimple\ 0.5\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -DBUILD_tpulsesimple=/\*\*/ -DHAVE_STDIO_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_STRINGS_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_UNISTD_H=1 -DSTDC_HEADERS=1 -DTcl_Size=int -DUSE_THREAD_ALLOC=1 -D_REENTRANT=1 -D_THREAD_SAFE=1 -DTCL_THREADS=1 -DUSE_TCL_STUBS=1 -DUSE_TCLOO_STUBS=1 -DMODULE_SCOPE=extern\ __attribute__\(\(__visibility__\(\"hidden\"\)\)\) -DHAVE_HIDDEN=1 -DHAVE_CAST_TO_UNION=1 -DHAVE_STDBOOL_H=1 -DTCL_WIDE_INT_IS_LONG=1 -DTCL_CFG_OPTIMIZED=1 -DTCL_MAJOR_VERSION=8 $(PKG_CFLAGS)
DEFS		= -DPACKAGE_NAME=\"tpulsesimple\" -DPACKAGE_TARNAME=\"tpulsesimple\" -DPACKAGE_VERSION=\"0.5\" -DPACKAGE_STRING=\"tpulsesimple\ 0.5\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -DBUILD_tpulsesimple=/\*\*/ -DHAVE_STDIO_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_STRINGS_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_UNISTD_H=1 -DSTDC_HEADERS=1 -DTcl_Size=int -DUSE_THREAD_ALLOC=1 -D_REENTRANT=1 -D_THREAD_SAFE=1 -DTCL_THREADS=1 -DUSE_TCL_STUBS=1 -DUSE_TCLOO_STUBS=1 -DMODULE_SCOPE=extern\ __attribute__\(\(__visibility__\(\"hidden\"\)\)\) -DHAVE_HIDDEN=1 -DHAVE_CAST_TO_UNION=1 -DHAVE_STDBOOL_H=1 -DTCL_WIDE_INT_IS_LONG=1 -DTCL_CFG_OPTIMIZED=1 -DTCL_MAJOR_VERSION=8 $(PKG_CFLAGS)

# Move pkgIndex.tcl to 'BINARIES' var if it is generated in the Makefile
CONFIG_CLEAN_FILES = Makefile pkgIndex.tcl
CLEANFILES	= 

CPPFLAGS	= 
LIBS		=  -lpulse-simple 
AR		= ar
CFLAGS		=  -pipe ${CFLAGS_DEFAULT} ${CFLAGS_WARNING} ${SHLIB_CFLAGS} 
LDFLAGS		=  -Wl,--export-dynamic 
LDFLAGS_DEFAULT			= 
COMPILE		= $(CC) $(DEFS) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) \
			  $(CFLAGS_DEFAULT) $(CFLAGS_WARNING) $(SHLIB_CFLAGS) $(CFLAGS)

GDB		= gdb
VALGRIND	= valgrind
VALGRINDARGS	= --tool=memcheck --num-callers=8 --leak-resolution=high \
		  --leak-check=yes --show-reachable=yes -v

.SUFFIXES: .c .$(OBJEXT)

#========================================================================
# Start of user-definable TARGETS section
#========================================================================

#========================================================================
# TEA TARGETS.  Please note that the "libraries:" target refers to platform
# independent files, and the "binaries:" target includes executable programs and
# platform-dependent libraries.  Modify these targets so that they install
# the various pieces of your package.  The make and install rules
# for the BINARIES that you specified above have already been done.
#========================================================================

all: binaries libraries

#========================================================================
# The binaries target builds executable programs, Windows .dll's, unix
# shared/static libraries, and any other platform-dependent files.
# The list of targets to build for "binaries:" is specified at the top
# of the Makefile, in the "BINARIES" variable.
#========================================================================

binaries: $(BINARIES)

libraries:

#========================================================================
# Your doc target should differentiate from doc builds (by the developer)
# and doc installs (see install-doc), which just install the docs on the
# end user machine when building from source.
#========================================================================

install: all install-binaries install-libraries

install-binaries: binaries install-lib-binaries install-bin-binaries

#========================================================================
# This rule installs platform-independent files, such as header files.
# The list=...; for p in $$list handles the empty list case x-platform.
#========================================================================

install-libraries: libraries
	@$(INSTALL_DATA_DIR) "$(DESTDIR)$(includedir)"
	@echo "Installing header files in $(DESTDIR)$(includedir)"
	@list='$(PKG_HEADERS)'; for i in $$list; do \
	    echo "Installing $(srcdir)/$$i" ; \
	    $(INSTALL_DATA) $(srcdir)/$$i "$(DESTDIR)$(includedir)" ; \
	done;

#========================================================================
# Install documentation.  Unix manpages should go in the $(mandir)
# directory.
#========================================================================

test: binaries libraries
	$(TCLSH) `echo $(srcdir)/tests/all.tcl` $(TESTFLAGS) \
	    -load "package ifneeded $(PACKAGE_NAME) $(PACKAGE_VERSION) \
		[list load `echo $(PKG_LIB_FILE)` [string totitle $(PACKAGE_NAME)]]"

shell: binaries libraries
	@$(TCLSH) $(SCRIPT)

gdb:
	$(TCLSH_ENV) $(PKG_ENV) $(GDB) $(TCLSH_PROG) $(SCRIPT)

gdb-test: binaries libraries
	$(TCLSH_ENV) $(PKG_ENV) $(GDB) \
	    --args $(TCLSH_PROG) `echo $(srcdir)/tests/all.tcl` \
	    $(TESTFLAGS) -singleproc 1 \
	    -load "package ifneeded $(PACKAGE_NAME) $(PACKAGE_VERSION) \
		[list load `echo $(PKG_LIB_FILE)` [string totitle $(PACKAGE_NAME)]]"

valgrind: binaries libraries
	$(TCLSH_ENV) $(PKG_ENV) $(VALGRIND) $(VALGRINDARGS) $(TCLSH_PROG) \
	    `echo $(srcdir)/tests/all.tcl` $(TESTFLAGS)

valgrindshell: binaries libraries
	$(TCLSH_ENV) $(PKG_ENV) $(VALGRIND) $(VALGRINDARGS) $(TCLSH_PROG) $(SCRIPT)

depend:

#========================================================================
# $(PKG_LIB_FILE) should be listed as part of the BINARIES variable
# mentioned above.  That will ensure that this target is built when you
# run "make binaries".
#
# The $(PKG_OBJECTS) objects are created and linked into the final
# library.  In most cases these object files will correspond to the
# source files above.
#========================================================================

$(PKG_LIB_FILE): $(PKG_OBJECTS)
	-rm -f $(PKG_LIB_FILE)
	${MAKE_LIB}
	$(RANLIB) $(PKG_LIB_FILE)

$(PKG_STUB_LIB_FILE): $(PKG_STUB_OBJECTS)
	-rm -f $(PKG_STUB_LIB_FILE)
	${MAKE_STUB_LIB}
	$(RANLIB_STUB) $(PKG_STUB_LIB_FILE)

#========================================================================
# We need to enumerate the list of .c to .o lines here.
#
# In the following lines, $(srcdir) refers to the toplevel directory
# containing your extension.  If your sources are in a subdirectory,
# you will have to modify the paths to reflect this:
#
# sample.$(OBJEXT): $(srcdir)/generic/sample.c
# 	$(COMPILE) -c `echo $(srcdir)/generic/sample.c` -o $@
#
# Setting the VPATH variable to a list of paths will cause the makefile
# to look into these paths when resolving .c to .obj dependencies.
# As necessary, add $(srcdir):$(srcdir)/compat:....
#========================================================================

VPATH = $(srcdir)/generic:$(srcdir)/unix:$(srcdir)/win:$(srcdir)/macosx

.c.o:
	$(COMPILE) -c `echo $<` -o $@

#========================================================================
# Distribution creation
# You may need to tweak this target to make it work correctly.
#========================================================================

#COMPRESS	= tar cvf $(PKG_DIR).tar $(PKG_DIR); compress $(PKG_DIR).tar
COMPRESS	= tar zcvf $(PKG_DIR).tar.gz $(PKG_DIR)
DIST_ROOT	= /tmp/dist
DIST_DIR	= $(DIST_ROOT)/$(PKG_DIR)

DIST_INSTALL_DATA	= CPPROG='cp -p' $(INSTALL) -m 644
DIST_INSTALL_SCRIPT	= CPPROG='cp -p' $(INSTALL) -m 755

dist-clean:
	rm -rf $(DIST_DIR) $(DIST_ROOT)/$(PKG_DIR).tar.*

dist: dist-clean $(srcdir)/manifest.uuid
	$(INSTALL_DATA_DIR) $(DIST_DIR)

	# TEA files
	$(DIST_INSTALL_DATA) $(srcdir)/Makefile.in \
	    $(srcdir)/aclocal.m4 $(srcdir)/configure.ac \
	    $(DIST_DIR)/
	$(DIST_INSTALL_SCRIPT) $(srcdir)/configure $(DIST_DIR)/

	$(INSTALL_DATA_DIR) $(DIST_DIR)/tclconfig
	$(DIST_INSTALL_DATA) $(srcdir)/tclconfig/README.txt \
	    $(srcdir)/manifest.uuid \
	    $(srcdir)/tclconfig/tcl.m4 $(srcdir)/tclconfig/install-sh \
	    $(DIST_DIR)/tclconfig/

	# Extension files
	$(DIST_INSTALL_DATA) \
	    $(srcdir)/ChangeLog \
	    $(srcdir)/README.sha \
	    $(srcdir)/license.terms \
	    $(srcdir)/README \
	    $(srcdir)/pkgIndex.tcl.in \
	    $(DIST_DIR)/

	list='demos doc generic library macosx tests unix win'; \
	for p in $$list; do \
	    if test -d $(srcdir)/$$p ; then \
		$(INSTALL_DATA_DIR) $(DIST_DIR)/$$p; \
		$(DIST_INSTALL_DATA) $(srcdir)/$$p/* $(DIST_DIR)/$$p/; \
	    fi; \
	done

	(cd $(DIST_ROOT); $(COMPRESS);)

#========================================================================
# End of user-definable section
#========================================================================

#========================================================================
# Don't modify the file to clean here.  Instead, set the "CLEANFILES"
# variable in configure.ac
#========================================================================

clean:
	-test -z "$(BINARIES)" || rm -f $(BINARIES)
	-rm -f *.$(OBJEXT) core *.core
	-test -z "$(CLEANFILES)" || rm -f $(CLEANFILES)

distclean: clean
	-rm -f *.tab.c
	-rm -f $(CONFIG_CLEAN_FILES)
	-rm -f config.cache config.log config.status

#========================================================================
# Install binary object libraries.  On Windows this includes both .dll and
# .lib files.  Because the .lib files are not explicitly listed anywhere,
# we need to deduce their existence from the .dll file of the same name.
# Library files go into the lib directory.
# In addition, this will generate the pkgIndex.tcl
# file in the install location (assuming it can find a usable tclsh shell)
#
# You should not have to modify this target.
#========================================================================

install-lib-binaries: binaries
	@$(INSTALL_DATA_DIR) "$(DESTDIR)$(pkglibdir)"
	@list='$(lib_BINARIES)'; for p in $$list; do \
	  if test -f $$p; then \
	    echo " $(INSTALL_LIBRARY) $$p $(DESTDIR)$(pkglibdir)/$$p"; \
	    $(INSTALL_LIBRARY) $$p "$(DESTDIR)$(pkglibdir)/$$p"; \
	    ext=`echo $$p|sed -e "s/.*\.//"`; \
	    if test "x$$ext" = "xdll"; then \
		lib=`basename $$p|sed -e 's/.[^.]*$$//'`.lib; \
		if test -f $$lib; then \
		    echo " $(INSTALL_DATA) $$lib $(DESTDIR)$(pkglibdir)/$$lib"; \
	            $(INSTALL_DATA) $$lib "$(DESTDIR)$(pkglibdir)/$$lib"; \
		fi; \
	    fi; \
	  fi; \
	done
	@list='$(PKG_TCL_SOURCES)'; for p in $$list; do \
	  if test -f $(srcdir)/$$p; then \
	    destp=`basename $$p`; \
	    echo " Install $$destp $(DESTDIR)$(pkglibdir)/$$destp"; \
	    $(INSTALL_DATA) $(srcdir)/$$p "$(DESTDIR)$(pkglibdir)/$$destp"; \
	  fi; \
	done
	@if test "x$(SHARED_BUILD)" = "x1"; then \
	    echo " Install pkgIndex.tcl $(DESTDIR)$(pkglibdir)"; \
	    $(INSTALL_DATA) pkgIndex.tcl "$(DESTDIR)$(pkglibdir)"; \
	fi

#========================================================================
# Install binary executables (e.g. .exe files and dependent .dll files)
# This is for files that must go in the bin directory (located next to
# wish and tclsh), like dependent .dll files on Windows.
#
# You should not have to modify this target, except to define bin_BINARIES
# above if necessary.
#========================================================================

install-bin-binaries: binaries
	@$(INSTALL_DATA_DIR) "$(DESTDIR)$(bindir)"
	@list='$(bin_BINARIES)'; for p in $$list; do \
	  if test -f $$p; then \
	    echo " $(INSTALL_PROGRAM) $$p $(DESTDIR)$(bindir)/$$p"; \
	    $(INSTALL_PROGRAM) $$p "$(DESTDIR)$(bindir)/$$p"; \
	  fi; \
	done

Makefile: $(srcdir)/Makefile.in  $(top_builddir)/config.status
	cd $(top_builddir) \
	  && CONFIG_FILES=$@ CONFIG_HEADERS= $(SHELL) ./config.status

uninstall-binaries:
	list='$(lib_BINARIES)'; for p in $$list; do \
	  rm -f "$(DESTDIR)$(pkglibdir)/$$p"; \
	done
	list='$(PKG_TCL_SOURCES)'; for p in $$list; do \
	  p=`basename $$p`; \
	  rm -f "$(DESTDIR)$(pkglibdir)/$$p"; \
	done
	list='$(bin_BINARIES)'; for p in $$list; do \
	  rm -f "$(DESTDIR)$(bindir)/$$p"; \
	done

.PHONY: all binaries clean depend distclean doc install libraries test
.PHONY: gdb gdb-test valgrind valgrindshell

# Tell versions [3.59,3.63) of GNU make to not export all variables.
# Otherwise a system limit (for SysV at least) may be exceeded.
.NOEXPORT:
