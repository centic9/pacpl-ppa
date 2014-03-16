#!/bin/bash
#
# Run this script to install the required modules for 
# the Perl Audio Converter.

perl -MCPAN -e 'install Parse::RecDescent'
perl -MCPAN -e 'install Devel::Symdump'
perl -MCPAN -e 'install Pod::Coverage'
perl -MCPAN -e 'install Parallel::ForkManager'
perl -MCPAN -e 'install Test::Pod::Coverage'
perl -MCPAN -e 'install Audio::Scan'
perl -MCPAN -e 'install MP3::Info'
perl -MCPAN -e 'install Audio::FLAC::Header'
perl -MCPAN -e 'install MP3::Tag'
perl -MCPAN -e 'install IO::String'
perl -MCPAN -e 'install CDDB'
perl -MCPAN -e 'install CDDB_get'