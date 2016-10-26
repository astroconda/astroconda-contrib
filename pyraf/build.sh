if [[ `uname -s` == "Darwin" ]]; then
    export CFLAGS="-I/opt/X11/include"
    export LDFLAGS="-L/opt/X11/lib"
fi

if [[ $PY3K > 0 ]]; then
set +e
    echo Running 2to3...
    2to3 -w . &>/dev/null
    if [[ $? != 0 ]]; then
        echo "ERROR: 2to3 technically failed!"
    fi
fi

python setup.py install || exit 1
