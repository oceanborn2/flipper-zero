#!/usr/bin/perl

use strict;

sub pullOrClone {
 my $url = shift;
 my $dir = $url;
 $dir =~ s!https://github.com/flipperdevices/!!og;
 $dir =~ s/.git//og;
 print("dir: $dir\n");
 # my $mode = (-d $dir) ? 'pull' : 'clone';
 if (-d $dir) {
     qx(cd $dir && git pull $url);
 } else {
     qx(git clone $url);
 }
}

pullOrClone("https://github.com/flipperdevices/flipperzero-firmware.git");
pullOrClone("https://github.com/flipperdevices/blackmagic-esp32-s2.git");

