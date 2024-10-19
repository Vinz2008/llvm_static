#/bin/bash

cd dependencies_src

if [ ! -d zstd ]; then
  wget https://github.com/facebook/zstd/releases/download/v1.5.6/zstd-1.5.6.tar.gz -O zstd.tar.gz
  mkdir zstd
  cd zstd
  tar -xvf ../zstd.tar.gz --strip-components=1
  cd ..
fi

if [ ! -d ncurses ]; then
  wget https://invisible-mirror.net/archives/ncurses/ncurses-6.5.tar.gz -O ncurses.tar.gz
  mkdir -p ncurses
  cd ncurses
  tar -xvf ../ncurses.tar.gz --strip-components=1
  cd ..
fi

if [ ! -d libxml2 ]; then
#  wget https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.5.tar.xz -O libxml2.tar.xz
  wget https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.12.5/libxml2-v2.12.5.tar.bz2 -O libxml2.tar.xz
  mkdir -p libxml2
  cd libxml2
  tar -xvf ../libxml2.tar.xz --strip-components=1
  cd ..
fi

if [ ! -d xz ]; then
  wget https://github.com/tukaani-project/xz/releases/download/v5.6.2/xz-5.6.2.tar.gz -O xz.tar.gz
  mkdir xz
  cd xz
  tar -xvf ../xz.tar.gz --strip-components=1
  cd ..
fi

rm -f *.tar.xz *.tar.gz
