if [[ `uname` == Darwin ]]; then
    export CC=`which gcc`
    if [[ `uname -m` == x86_64 ]]; then
        export CFLAGS="$CFLAGS -m64"
        export LDFLAGS="$LDFLAGS -m64"
    fi
fi

./waf configure --prefix=$PREFIX --release-with-symbols
./waf build
./waf install
