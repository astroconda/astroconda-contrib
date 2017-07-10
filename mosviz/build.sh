# Remove reference to glueviz from setup script, since this breaks the build
# as there is no file containing 'glueviz' produced for that package since
# glueviz has become a metapackage.
sed -i -e "/'glueviz.*',$/d" setup.py
$PYTHON setup.py install
