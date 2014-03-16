# Process this file with autoconf to produce a configure script.
#
# Copyright (C) 2007-2014 Philip Lyons (vorzox@gmail.com)

AC_PACKAGE_NAME(Perl Audio Converter)
AC_PACKAGE_TARNAME(pacpl-5.0.1.tar.bz2)
AC_PACKAGE_VERSION(5.0.1)
AC_PACKAGE_BUGREPORT(vorzox@gmail.com)

m4_include([aclocal/ax_prog_perl_modules.m4])

AC_PROG_PERL_VERSION(5.18.1)
AC_PREREQ([2.69])

AC_INIT([pacpl],[5.0.1])

AM_INIT_AUTOMAKE

AC_SUBST(INSTALL_KONQ)
AC_SUBST(INSTALL_DOLP)
AC_SUBST(KDEDIR)

AC_PREFIX_DEFAULT(/usr)
AC_PREFIX_PROGRAM(pacpl)
AC_CONFIG_SRCDIR(pacpl)

AC_PROG_INSTALL

AC_PATH_PROG(RM, rm, rm)
AC_PATH_PROG(PERL, perl, perl)
AC_PATH_PROG(POD2MAN, pod2man, pod2man)
AC_PATH_PROG(POD2HTML, pod2html, pod2man)
AC_PATH_PROG(GZIP, gzip, gzip)

########################################
# check for supported encoder/decoders #
########################################
AC_MSG_NOTICE()
AC_CHECK_PROG(LAME, lame, yes)
AC_CHECK_PROG(TOOLAME, toolame, yes)
AC_CHECK_PROG(TWOLAME, twolame, yes)
AC_CHECK_PROG(BLADEENC, bladeenc, yes)
AC_CHECK_PROG(OGGENC, oggenc, yes)
AC_CHECK_PROG(OGGDEC, oggdec, yes)
AC_CHECK_PROG(OPUSENC, opusenc, yes)
AC_CHECK_PROG(OPUSDEC, opusdec, yes)
AC_CHECK_PROG(AFTEN, aften, yes)
AC_CHECK_PROG(SPEEXENC, speexenc, yes)
AC_CHECK_PROG(SPEEXDEC, speexdec, yes)
AC_CHECK_PROG(FLAC, flac, yes)
AC_CHECK_PROG(MAC, mac, yes)
AC_CHECK_PROG(SHORTEN, shorten, yes)
AC_CHECK_PROG(SOX, sox, yes)
AC_CHECK_PROG(FAAC, faac, yes)
AC_CHECK_PROG(FAAD, faad, yes)
AC_CHECK_PROG(FFMPEG, ffmpeg, yes)
AC_CHECK_PROG(AVCONV, avconv, yes)
AC_CHECK_PROG(MPLAYER, mplayer, yes)
AC_CHECK_PROG(LA, la, yes)
AC_CHECK_PROG(BONK, bonk, yes)
AC_CHECK_PROG(MPCENC, mpcenc, yes)
AC_CHECK_PROG(MPCDEC, mpcdec, yes)
AC_CHECK_PROG(OFF, off, yes)
AC_CHECK_PROG(OFR, ofr, yes)
AC_CHECK_PROG(OFS, ofs, yes)
AC_CHECK_PROG(TTAENC, ttaenc, yes)
AC_CHECK_PROG(WAVPACK, wavpack, yes)
AC_CHECK_PROG(WVUNPACK, wvunpack, yes)
AC_CHECK_PROG(SNDFILE, sndfile-convert, yes)


###################################
# Check for required perl modules #
###################################

AC_MSG_NOTICE()
AC_MSG_NOTICE([checking for required perl modules...])
AC_MSG_NOTICE()

AX_PROG_PERL_MODULES(    Getopt::Long
			 File::Basename
			 File::Find
			 Parallel::ForkManager
			 File::Spec::Functions
			 CDDB
			 CDDB_get
			 MP3::Tag 
			 Audio::Scan
			 Audio::FLAC::Header , [], AC_MSG_ERROR([ERROR: One or more of the required modules could not be found. See extra/mod-install.sh or extra/mod-install-ubuntu.sh]))

AC_MSG_NOTICE()
AC_MSG_NOTICE([checking for required plugin applications...])
AC_MSG_NOTICE()

AC_ARG_ENABLE([kde],
	[AS_HELP_STRING([--enable-kde],[Install KDE Service Menu (Dolphin/Konqueror)])],
	[],
	[enable_kde=no])

AC_ARG_ENABLE([nemo],
	[AS_HELP_STRING([--enable-nemo],[Install GNOME Nemo Action Script])],
	[],
	[enable_nemo=no])		

AC_ARG_ENABLE([nautilus],
	[AS_HELP_STRING([--enable-nautilus],[Install GNOME Nautilus Script])],
	[],
	[enable_nautilus=no])

AC_CHECK_PROG([KDIALOG],[kdialog],[yes])
AC_CHECK_PROG([ZENITY],[zenity],[yes])
AC_CHECK_PROG([NAUTILUS],[nautilus],[yes])
AC_CHECK_PROG([NEMO],[nemo],[yes])

AM_CONDITIONAL([INSTALL_NAUTILUS], [test x$enable_nautilus = xyes])
AM_CONDITIONAL([INSTALL_NEMO], [test x$enable_nemo = xyes])
AM_CONDITIONAL([INSTALL_KDE], [test x$enable_kde = xyes])
AM_CONDITIONAL([ENABLE_GNOME_NAUTILUS], [test x$enable_nautilus = xyes])
AM_CONDITIONAL([ENABLE_GNOME_NEMO], [test x$enable_nemo = xyes])

if test "x$enable_nautilus" = "xyes" -o "x$enable_nemo" = "xyes"; then
	ENABLE_GNOME=true
fi

if test "x$KDIALOG" = "xyes" -a "x$enable_kde" != "xno"; then
	INSTALL_KDE=true
else
	INSTALL_KDE=false
fi
                
if test "x$NAUTILUS" = "xyes" -a "x$enable_nautilus" != "xno"; then
	INSTALL_NAUTILUS=true
else
	INSTALL_NAUTILUS=false	
fi

if test "x$NEMO" = "xyes" -a "x$enable_nemo" != "xno"; then
	INSTALL_NEMO=true
else
	INSTALL_NEMO=false
fi

if test "x$INSTALL_KDE" = "xtrue" -a "x$INSTALL_NAUTILUS" = "xtrue"; then
	AC_MSG_FAILURE([nautilus and kde cannot be enabled at the same time. exiting..])
fi
  
if test "x$INSTALL_KDE" = "xtrue" -a "x$INSTALL_NEMO" = "xtrue"; then
	AC_MSG_FAILURE([nemo and kde cannot be enabled at the same time. exiting..])
fi      

if test "x$NAUTILUS" != "xyes" -a "x$enable_nautilus" = "xyes"; then
	AC_MSG_NOTICE()
	AC_MSG_FAILURE([could not find applicaiton 'nautilus': exiting..."])
	AC_MSG_NOTICE()
fi

if test "x$NEMO" != "xyes" -a "x$enable_nemo" = "xyes"; then
	AC_MSG_NOTICE()
	AC_MSG_FAILURE([could not find application 'nemo': exiting..."])
	AC_MSG_NOTICE()
fi

if test "x$enable_kde" != "xno"; then
plugins=1
elif test "x$enable_nautilus" != "xno"; then
plugins=1
elif test "x$enable_nemo" != "xno"; then
plugins=1
else
plugins=0
fi

AC_MSG_NOTICE()

AC_ARG_VAR([KDEDIR], [root directory of your KDE installation (default /usr)])
AC_ARG_VAR([GNOMEDIR], [root directory of your GNOME installation (default /usr)])
AC_ARG_VAR([DESTDIR], [root installation directory (default /)])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT()

if test x$plugins = x1; then

AC_MSG_NOTICE()
AC_MSG_NOTICE([The following plugins will be installed:])
AC_MSG_NOTICE()

	if test x$INSTALL_KDE = xtrue; then
	AC_MSG_NOTICE([KDE Service Menu])
	fi
	
	if test x$INSTALL_NAUTILUS = xtrue; then
	AC_MSG_NOTICE([Nautilus Script])
	fi
	
	if test x$INSTALL_NEMO = xtrue; then
	AC_MSG_NOTICE([NEMO Action Script])
	fi
fi

if test x$plugins = x0; then

	AC_MSG_NOTICE()
	AC_MSG_NOTICE()
	AC_MSG_NOTICE([no plugins have been enabled...])
	AC_MSG_NOTICE()
fi

AC_MSG_NOTICE()
AC_MSG_NOTICE([Configure finished successfully...])
AC_MSG_NOTICE()
AC_MSG_NOTICE([make && make install])

exit 1