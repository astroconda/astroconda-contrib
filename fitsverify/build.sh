export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig
RESULT=fitsverify
SRCS="ftverify.c fvrf_data.c fvrf_file.c fvrf_head.c fvrf_key.c fvrf_misc.c"
CFITSIO_FLAGS=`pkg-config --cflags --libs cfitsio`
LDFLAGS="-lm"

gcc -o $RESULT \
    $SRCS \
    -DSTANDALONE \
    $CFITSIO_FLAGS \
    $LDFLAGS

mkdir -p $PREFIX/bin
cp -a $RESULT $PREFIX/bin

