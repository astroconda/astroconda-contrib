./configure --prefix=$PREFIX --disable-static --enable-reentrant
make -j $CPU_COUNT shared
make install
