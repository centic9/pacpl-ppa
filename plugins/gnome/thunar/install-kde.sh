#!/bin/bash
#
# Thunar Perl Audio Converter Context Menu Script

CONFIG=${HOME}/.config/Thunar/uca.xml

cp -v PACPL-Konvert /usr/bin/

# Insert lines at end of Thunars $CONFIG
sed -i 's/<\/actions>//' $CONFIG
sed -i '/^$/d' $CONFIG
echo "
<action>
 	<icon>/etc/pacpl/pacpl.png</icon>
	<name>Perl Audio Converter</name>
 	<command>/usr/bin/PACPL-Konvert %F</command>
 	<description>Linux Audio Converter / Tagger/ Ripper</description>
 	<patterns>*</patterns>
 	<directories/>
 	<audio-files/>
 	<video-files/>
</action>
</actions>
" >> $CONFIG
sed -i '/^$/d' $CONFIG
