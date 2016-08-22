
function get_py_version() {
python --version 2>&1| awk '{sub(/-.*/,"",$2);print $2}'
}
export -f get_py_version

function set_py3k() {
    version=`get_py_version`
    major=`echo $version | cut -d '.' -f 1`
    minor=`echo $version | cut -d '.' -f 2`
    hotfix=`echo $version | cut -d '.' -f 3`
    if (( major > 2 )); then
        export PY3K=1
    else
        export PY3K=0
    fi
}
export -f set_py3k

set_py3k

pip install --no-deps --upgrade --force d2to1 || exit 1

echo "This doesn't work. Why conda why? --python 2.7 is useless here"
if [ $PY3K -ne 0 ] ; then
sed -i -e "s|stsci.distutils.hooks.tag_svn_revision|#removed|" setup.cfg
fi

python setup.py install || exit 1
