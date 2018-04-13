# Replace malformed pytest requirement with something sane
pytest_pattern='s/pytest==/pytest>=/'
glue_pattern='s/glueviz//'
numpy_pattern='s|numpy>=1.13|numpy>=1.12|'

for f in setup.*
do
    sed -e ${pytest_pattern} -e ${glue_pattern} -e ${numpy_pattern} "${f}" > "${f}.new"
    mv "${f}.new" "${f}"
done

$PYTHON setup.py install
