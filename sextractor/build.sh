export ATLAS="$PREFIX"
OPTIONS=
case $(uname) in
    Linux)
        OPTIONS="--with-atlas-libdir=$ATLAS/lib --with-atlas-incdir=$ATLAS/include"
    ;;

    Darwin)
        curl https://gist.githubusercontent.com/mwcraig/ae66eadcd0f266e7138f/raw/f4625508784e75c7b3ce11d8a578589425533282/acx_accelerate.m4.diff | patch -p1 -i -
        curl https://gist.githubusercontent.com/mwcraig/4f61431f177b6cc0085a/raw/bf4d29a7a51ccec1ef224006fd10ac260a31c37c/configure.ac.diff | patch -p1 -i -
        curl https://gist.githubusercontent.com/mwcraig/b423656698987b6bc492/raw/f23c4b50d972de4e7902fe3d4fa1363400a98f8f/pattern.c.diff | patch -p1 -i -

        OPTIONS="--enable-accelerate"
        autoconf
        autoheader
    ;;

    *)
    ;;
esac

./configure --prefix=$PREFIX \
    --with-fftw-libdir=$PREFIX/lib \
    --with-fftw-incdir=$PREFIX/include \
    ${OPTIONS}

make -j ${CPU_COUNT}
make install
