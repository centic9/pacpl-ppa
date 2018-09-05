#!/bin/bash
#
# Confiure script for ffmpeg

./configure --prefix=/usr \
		--enable-nonfree \
		--enable-pthread \
		--mandir=/usr/man \
		--disable-debug \
		--enable-shared \
		--enable-postproc \
		--enable-libschroedinger \
		--enable-slib \				
		--enable-gpl \
		--enable-version3 \
		--enable-pic \
		--enable-avisynth \
		--enable-libvo-aacenc \
		--enable-libvo-amrwbenc \
		--enable-fontconfig \
		--enable-gnutls \
		--enable-libfaac \
		--enable-libmp3lame \
		--enable-libfreetype \
		--enable-libspeex \
		--enable-libtheora \
		--enable-libtwolame \
		--enable-libvorbis \
		--enable-libx264 \
		--enable-libxvid \
		--enable-openssl \
		--enable-libfdk-aac \
		--enable-libopencore-amrnb \
		--enable-libopencore-amrwb \
		--enable-x11grab \
		
		
		 