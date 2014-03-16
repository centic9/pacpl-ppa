#  Perl Audio Converter
#
#  Copyright (C) 2005-2014 Philip Lyons (vorzox@gmail.com)
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

PACKAGE_NAME     = @PACKAGE_NAME@
PACKAGE_VERSION  = @PACKAGE_VERSION@

ACLOCAL_M4 = ./aclocal.m4

#
# Modules & Documentation
#

DOCS = INSTALL README AUTHORS TODO NEWS ChangeLog COPYING

LANG_MODS = po/*
EXTRAS    = extra/*

#
# Plugin directories
#

NAUTILUS_PLUGIN_DIR = plugins/gnome/nautilus
NEMO_PLUGIN_DIR     = plugins/gnome/nemo
KDE_PLUGIN_DIR      = plugins/kde

#
# Default KDE directory
#

DESTDIR = 
KDEDIR  = /usr
GNOMEDIR = /usr

#
# Target KDE directories
#

KDE_INSTALL_DIR      = $(DESTDIR)$(KDEDIR)/share/kde4/services
NAUTILUS_INSTALL_DIR = $(DESTDIR)$(HOME)/.local/share/nautilus/scripts
NEMO_INSTALL_DIR     = $(DESTDIR)$(GNOMEDIR)/share/nemo/actions
ICON_DIR             = $(DESTDIR)$(GNOMEDIR)/share/icons

#
# Compiler tools definitions...
#

POD2MAN = @POD2MAN@
POD2HTML = @POD2HTML@
GZIP = @GZIP@
RM = @RM@ -f
SHELL = /bin/sh

#
# Configured directories...
#

prefix      =  @prefix@
exec_prefix =  @exec_prefix@
bindir      =  @bindir@
datarootdir =  @datarootdir@
includedir  =  @includedir@
libdir      =  @libdir@
mandir      =  @mandir@
docdir      =  @docdir@

#
# Configuration files directories and other
#
CONF_DIR = $(DESTDIR)/etc/$(PACKAGE_NAME)
PO_DIR   = $(DESTDIR)/usr/share/pacpl/locale
MOD_DIR  = $(CONF_DIR)/modules
DOC_DIR  = $(DESTDIR)$(docdir)
MAN_DIR  = $(DESTDIR)$(mandir)/man1
EXTRA_DIR = $(CONF_DIR)/extra

all : pacpl.1.gz

pacpl.1.gz : pacpl
	$(POD2MAN) $< |	$(GZIP) -9 > $@
	touch $@

install: all main install-plugins

main:
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL) -d $(CONF_DIR)
	$(INSTALL) -d $(PO_DIR)
	$(INSTALL) -d $(MOD_DIR)
	$(INSTALL) -d $(MAN_DIR)
	$(INSTALL) -d $(DOC_DIR)
	$(INSTALL) -d $(EXTRA_DIR)

	$(INSTALL) pacpl $(DESTDIR)$(bindir)
	$(INSTALL_DATA) pacpl.conf codecs.conf pacpl.png $(CONF_DIR)
	$(INSTALL_DATA) $(LANG_MODS) $(PO_DIR)
	$(INSTALL_DATA) pacpl.1.gz $(MAN_DIR)
	$(INSTALL_DATA) $(DOCS) $(DOC_DIR)
	$(INSTALL_DATA) $(EXTRAS) $(EXTRA_DIR)

install-plugins:

if INSTALL_KDE
	$(INSTALL) -d $(KDE_INSTALL_DIR)
	$(INSTALL) $(KDE_PLUGIN_DIR)/PACPL-Konvert $(DESTDIR)$(bindir)
	$(INSTALL_DATA) $(KDE_PLUGIN_DIR)/pacpl.desktop $(KDE_INSTALL_DIR)
	sed -i 's/KDE_DIR = 0/KDE_DIR = 1/' $(CONF_DIR)/pacpl.conf
	sed -i 's/KDE_OPTS = 0/KDE_OPTS = 1/' $(CONF_DIR)/pacpl.conf
endif

if INSTALL_NAUTILUS
	$(INSTALL) -d $(NAUTILUS_INSTALL_DIR)
	$(INSTALL) $(NAUTILUS_PLUGIN_DIR)/PACPL-Convert $(NAUTILUS_INSTALL_DIR)
endif

if INSTALL_NEMO
	$(INSTALL) -d $(NEMO_INSTALL_DIR)
	$(INSTALL) $(NEMO_PLUGIN_DIR)/PACPL-Convert $(NEMO_INSTALL_DIR)
	$(INSTALL_DATA) $(NEMO_PLUGIN_DIR)/pacpl.nemo_action $(NEMO_INSTALL_DIR)
	$(INSTALL_DATA) $(NEMO_PLUGIN_DIR)/pacpl.png $(ICON_DIR)
endif

if ENABLE_GNOME_NAUTILUS
	sed -i 's/ZEN_DIR = 0/ZEN_DIR = 1/' $(CONF_DIR)/pacpl.conf
	sed -i 's/ZEN_OPTS = 0/ZEN_OPTS = 1/' $(CONF_DIR)/pacpl.conf                
endif

if ENABLE_GNOME_NEMO
	sed -i 's/ZEN_DIR = 0/ZEN_DIR = 1/' $(CONF_DIR)/pacpl.conf
	sed -i 's/ZEN_OPTS = 0/ZEN_OPTS = 1/' $(CONF_DIR)/pacpl.conf
endif

clean:
	$(RM) pacpl.1.gz

distclean: clean
	$(RM) config.log
	$(RM) config.status
	$(RM) Makefile
	find . -name '*~' -exec $(RM) '{}' \;

uninstall: uninstall-plugins
	$(RM) $(DESTDIR)$(bindir)/pacpl
	$(RM) $(MAN_DIR)/pacpl.1.gz
	$(RM) -r $(CONF_DIR)
	$(RM) -r $(DOC_DIR)
	$(RM) -r $(DESTDIR)/usr/share/pacpl

uninstall-plugins:
if INSTALL_KDE
	$(RM) $(KDE_INSTALL_DIR)/pacpl.desktop
	$(RM) $(DESTDIR)$(bindir)/PACPL-Konvert
endif

if INSTALL_NAUTILUS
	$(RM) $(NAUTILUS_INSTALL_DIR)/PACPL-Convert
endif

if INSTALL_NEMO
	$(RM) $(NEMO_INSTALL_DIR)/PACPL-Convert
	$(RM) $(NEMO_INSTALL_DIR)/pacpl.nemo_action
	$(RM) $(ICON_DIR)/pacpl.png
endif	