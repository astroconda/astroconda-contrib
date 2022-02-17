set -x
export PKG_CONFIG_PATH="$CONDA_PREFIX/lib/pkgconfig"
$PYTHON -m pip install . --no-deps --ignore-installed --no-cache-dir -vvv
