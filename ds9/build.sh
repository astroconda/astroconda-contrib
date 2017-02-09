
os=`uname`
case $os in
    Linux)
        LDFLAGS='-m64'
    ;;
    Darwin)
        LDFLAGS='-arch x86_64 -m64'
        sed -i -e '/codesign/d' ds9/unix/Makefile.in
    ;;
*)
    echo "Unsupported operating system: $os"
    exit 1
;;
esac

unix/configure
make
mkdir -p $PREFIX/bin
cp -a bin/ds9* bin/x* $PREFIX/bin
