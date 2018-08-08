#!/bin/bash

echo
echo -e "\e[31m## ZeroAgri feeds package install\e[m"
echo

## feedsのpackageのURLが変わることがあるので、これで対応
echo "src-git packages git://git.archive.openwrt.org/10.03/packages.git" > feeds.conf

./scripts/feeds update

./scripts/feeds install uucp
./scripts/feeds install libwrap
./scripts/feeds install libeventlog
./scripts/feeds install ffmpeg
./scripts/feeds install openvpn
./scripts/feeds install php5-cgi
./scripts/feeds install php5-cli
./scripts/feeds install picocom
./scripts/feeds install pyserial
./scripts/feeds install python-curl
./scripts/feeds install python-expat
./scripts/feeds install python-mini
./scripts/feeds install python-sqlite3
./scripts/feeds install python
./scripts/feeds install pyserial
./scripts/feeds install unzip
./scripts/feeds install zip
./scripts/feeds install nginx
./scripts/feeds install spawn-fcgi
./scripts/feeds install syslog-ng3


chown -R vagrant: . -R

echo
echo -e "\e[31m## build\e[m"
echo

make && echo || exit 1;
#make V=99 && echo || exit 1;

echo
echo -e "\e[31m## build end\e[m"
echo

ls -la bin/imx28/*.zip

exit 0;
