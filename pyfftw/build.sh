export CFLAGS="`pkg-config --cflags fftw3`"
export LDFLAGS="`pkg-config --libs fftw3`"
$PYTHON setup.py install
