#!/bin/bash
#
# This script installs the required perl modules
# some necessary libraries and other useful encoders
# & decoders which you will find useful while
# utilizing the application
#
# run this script using: sudo sh ./mod-install-kubuntu.sh

echo ""
echo ""
echo "Installing required libs and perl modules..."
echo ""
sleep 4

sudo apt-get install libvorbis-dev \
		     libcddb-perl \
		     libinline-perl \
                     libcddb-get-perl \
                     libmp3-tag-perl \
                     libaudio-scan-perl \
                     libaudio-flac-header-perl \
                     libparallel-forkmanager-perl 
                     
# install some default encoders / decoders

echo ""
echo ""
echo "Installing some basic encoding/decoding tools to get you started.."
echo ""
sleep 4

sudo apt-get install vorbis-tools \
		     lame \
		     twolame \
		     sox \
		     musepack-tools \
		     ffmpeg \
		     mplayer \
		     cdparanoia \
		     flac \
		     faac \
		     faad \
		     opus-tools \
		     sndfile-programs \
		     speex \
		     wavpack \
		     aften \
		     perl-doc

echo ""
echo ""
echo "Settign up your repository to be able to install the restricted-extras package..."
echo ""
sleep 4

sudo apt-get clean
cd /var/lib/apt
sudo mv lists lists.old
sudo mkdir -p lists/partial
sudo apt-get clean
sudo apt-get update

echo ""
echo ""
echo "Now install via apt-get ubuntu-restricted-extras or kubuntu-restricted-extras depending on your flavor"
echo ""
sleep 5
