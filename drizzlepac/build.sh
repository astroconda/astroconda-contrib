#pip install --no-deps --upgrade sphinx-automodapi

#$PYTHON setup.py build build_ext --inplace -- build_sphinx
$PYTHON -m pip install . --no-deps --ignore-installed --no-cache-dir -vvv
