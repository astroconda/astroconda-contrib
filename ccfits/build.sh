./configure --prefix=$PREFIX --disable-static --with-cfitsio=$PREFIX
make -j $CPU_COUNT
make install
