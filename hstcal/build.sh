
export FCFLAGS="$FCFLAGS -fPIC"

if [[ `uname` == Darwin ]]; then
    export FC=/usr/local/bin/gfortran
    if [[ `uname -m` == x86_64 ]]; then
        export CFLAGS="$CFLAGS -m64"
        export LDFLAGS="$LDFLAGS -m64"
    fi
else
    # Use the compilers provided by conda. The activation of the build
    # environment defines the GCC and GFORTRAN env vars.
    export CC=$CC
fi

./waf configure --prefix=$PREFIX --release-with-symbols
./waf build
./waf install
