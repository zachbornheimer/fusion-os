#!/usr/bin/perl

=pod

This file is part of the Zysys Fusion OS.

The Zysys Fusion OS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

The Zysys Fusion OS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with the Zysys Fusion OS.  If not, see <http://www.gnu.org/licenses/>.

=cut

use warnings;
use strict;
use Carp;
use v5;

if ($#ARGV < 0) {
    croak "Usage: script-name x infinity\nThis script only works on programs that have a shebang line.\n";
}

foreach (@ARGV) {
    if (-e $_) {
        add_copyright_disclaimer($_);
    }
}

sub add_copyright_disclaimer {
    my $file = $_;
    my $GPL = <<END;
This file is part of the Zysys Fusion OS.

The Zysys Fusion OS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

The Zysys Fusion OS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with the Zysys Fusion OS.  If not, see <http://www.gnu.org/licenses/>.
END

    local @ARGV = ($file);
    local $^I = '';
    while (<>) {
        if (/\/sh$/ || /\/bash$/) {
            print $_ . "\n".'##############'."\n".'<<COPYRIGHT_INFO' . "\n" . $GPL . "COPYRIGHT_INFO\n##############\n"
        } elsif (/\/perl$/) {
            print $_ . "\n\n=pod\n$GPL\n=cut\n\n";
        } else {
            print;
        }
    }
}
