export LIBTOOL=/usr/bin/libtool
export OPTIONS=

case "$(uname -s)" in
    Darwin)
        export CC=/opt/local/bin/gcc-mp-4.8
        export F77=/opt/local/bin/gfortran-mp-4.8
    ;;
    Linux)
        export CC=/usr/bin/gcc
        export F77=/usr/bin/gfortran
    ;;
    *)
    ;;
esac

export OPTIONS="-Fa alg -fPIC -C agc $CC -C if $F77 --shared -t 2 -b 64 -V 128 -A 12"
export LAPACK_VERSION=3.5.0
export LAPACK_TARBALL=lapack-${LAPACK_VERSION}.tgz
export LAPACK_URL="http://www.netlib.org/lapack/${LAPACK_TARBALL}"
wget ${LAPACK_URL}

mkdir -p build
pushd ./build
../configure --prefix=$PREFIX \
    --with-netlib-lapack-tarfile=../${LAPACK_TARBALL} \
    ${OPTIONS}

make LIBTOOL=$LIBTOOL CC=$CC F77=$F77
make install

popd
