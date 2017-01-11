
case "$(uname)" in
Linux)
LDFLAGS='-m64'
;;
Darwin)
LDFLAGS='-arch x86_64 -m64'

sed -i -e '/codesign/d' ds9/unix/Makefile.in
;;
*)
echo "Unsupported"
exit 1
;;
esac

unix/configure TKFLAGS="--disable-xss"  # not all machines have libXss
make
mkdir -p $PREFIX/bin
cp -a bin/ds9* bin/x* $PREFIX/bin
