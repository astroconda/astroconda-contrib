if [[ `uname -s` == "Darwin" ]]; then
    export CFLAGS="-I/opt/X11/include"
    export LDFLAGS="-L/opt/X11/lib"
fi

$PYTHON -m pip install . --no-deps --ignore-installed --no-cache-dir -vvv
