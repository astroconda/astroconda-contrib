if [[ `uname` == Darwin ]]; then
    export CC=`which gcc`
fi

./waf configure --destdir=$PREFIX
./waf build
./waf install
