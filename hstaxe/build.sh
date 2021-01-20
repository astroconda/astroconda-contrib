set -x
export PKG_CONFIG_PATH="$CONDA_PREFIX/lib/pkgconfig"
$PYTHON setup.py install --single-version-externally-managed --record=root.txt
