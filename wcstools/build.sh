make -j${CPU_COUNT}
mkdir -p $PREFIX/bin \
    $PREFIX/lib \
    $PREFIX/include \
    $PREFIX/share/doc/wcstools

rm -rf bin/*.dSYM
cp -a bin/* $PREFIX/bin
cp -a libwcs/libwcs.a $PREFIX/lib
cp -a libwcs/*.h $PREFIX/include
cp -a COPYING $PREFIX/share/doc/wcstools

