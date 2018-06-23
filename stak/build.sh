NOTEBOOKS=docs/source/notebooks
DOCDIR="$PREFIX/share/doc/$PKG_NAME-$PKG_VERSION"

# The find+delete below can be dangerous if not handled correctly. Trust no one.
if [[ ! -d $PREFIX ]]; then
    echo 'Continuum broke $PREFIX, cannot continue.'
    exit 1
fi

# copy notebook data into /share/docs
mkdir -p "$DOCDIR"
cp -a $NOTEBOOKS "$DOCDIR"
find $DOCDIR -name "*.rst" -delete

# install stak
$PYTHON setup.py install

# install notebook installer
cp -a $RECIPE_DIR/stak_notebooks_install $PREFIX/bin
chmod +x $PREFIX/bin/stak_notebooks_install
