mkdir -p $PREFIX/share
mkdir -p $PREFIX/etc/conda/activate.d
mkdir -p $PREFIX/etc/conda/deactivate.d

# Different conda-build releases do different things
# SRC_DIR is "usedir" for all intents and purposes
usedir="$(pwd)"
if [[ -d ${usedir}/work ]]; then
    usedir=${usedir}/work
fi

rsync -a ${usedir}/* $PREFIX/share/webbpsf-data

echo "
export WEBBPSF_PATH=$PREFIX/share/webbpsf-data
" > $PREFIX/etc/conda/activate.d/webbpsf-data.sh

echo "
unset WEBBPSF_PATH
" > $PREFIX/etc/conda/deactivate.d/webbpsf-data.sh