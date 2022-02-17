
export CFLAGS="`pkg-config --cflags fftw3`"
export LDFLAGS="`pkg-config --libs fftw3`"
$PYTHON -m pip install . --no-deps --ignore-installed --no-cache-dir -vvv
