
rm -rf python

./configure --prefix=$PREFIX --enable-shared
make -j${CPU_COUNT}
make install
