#/bin/bash

set -ex

DEPENDENCIES_SYSROOT=$(realpath ./dependencies_sysroot)
MAKE="make -j$(nproc)"

cd dependencies_src

cd zstd
$MAKE prefix=$DEPENDENCIES_SYSROOT/usr
$MAKE prefix=$DEPENDENCIES_SYSROOT/usr install
cd ..

cd ncurses
./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --without-debug         \
            --enable-pc-files       \
            --with-pkg-config-libdir=/usr/lib/pkgconfig \
	        --with-termlib=tinfo 
$MAKE
$MAKE DESTDIR=$DEPENDENCIES_SYSROOT install
cd ..


cd libxml2
# ./configure --prefix=$DEPENDENCIES_SYSROOT/usr           \
#             --sysconfdir=/etc       \
#             --with-history          \
#             --with-icu              \
#             PYTHON=/usr/bin/python3 \
#             --docdir=/usr/share/doc/libxml2-2.12.5
cmake -S . \
    -DCMAKE_INSTALL_PREFIX=$DEPENDENCIES_SYSROOT/usr \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIBXML2_WITH_ICONV=OFF \
    -DLIBXML2_WITH_LZMA=OFF \
    -DLIBXML2_WITH_PYTHON=OFF \
    -DLIBXML2_WITH_ZLIB=OFF
$MAKE
$MAKE install
cd ..

cd xz
./configure --prefix=$DEPENDENCIES_SYSROOT/usr 
$MAKE
$MAKE install
cd ..

#rm -f $DEPENDENCIES_SYSROOT/usr/lib/*.so $DEPENDENCIES_SYSROOT/usr/lib/*.so.* $DEPENDENCIES_SYSROOT/usr/lib/*.la
