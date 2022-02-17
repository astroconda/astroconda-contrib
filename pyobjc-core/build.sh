cd pyobjc-core
export CFLAGS="$CFLAGS -headerpad_max_install_names"
$PYTHON -m pip install . --no-deps --ignore-installed --no-cache-dir -vvv
