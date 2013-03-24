#!/bin/bash

##############
<<COPYRIGHT_INFO
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
COPYRIGHT_INFO
##############

# Requires sustained root access (probably best if run as root)
# Requires curl
# Requires git
# Requires tar

PWD=`pwd`
cd /root
git clone --recursive https://github.com/rakudo/rakudo
cd rakudo*
perl Configure.pl --gen-parrot --parrot-option=--optimize --gen-nqp --prefix=/usr/local
make
chown -R nobody .
make install
cd ../
rm -r rakudo/
logger "Installed Rakudo."
cd $PWD
