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
response=$(curl --write-out %{http_code} --silent --output /dev/null "http://cloud.github.com/downloads/rakudo/star/rakudo-star-`date +%Y`.`date +%m`.tar.gz")
#response=$(curl -sL -w "%{http_code}" "http://cloud.github.com/downloads/rakudo/star/rakudo-star-`date +%Y`.`date +%m`.tar.gz" -o /dev/null)
if [ 403 -eq "$response" ]
then
    curl -L -z -.rakudo.tar.gz -o .rakudo.tar.gz http://cloud.github.com/downloads/rakudo/star/rakudo-star-`date --date="last month" +%Y`.`date --date="last month" +%m`.tar.gz
else
    curl -L -z -.rakudo.tar.gz -o .rakudo.tar.gz http://cloud.github.com/downloads/rakudo/star/rakudo-star-`date +%Y`.`date +%m`.tar.gz
fi

mkdir .rakudo
tar -xf .rakudo.tar.gz --directory=.rakudo
cd .rakudo
cd rakudo*
echo `pwd`
perl Configure.pl --gen-parrot
make
make install
mv perl6 /usr/local/bin
cd ../..
rm -r .rakudo
logger "Installed Rakudo."
cd $PWD
