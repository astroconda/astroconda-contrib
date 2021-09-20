if [[ -z ${PKG_NAME} ]]; then
    echo "Conda build has changed out from under you. PKG_NAME is undefined..."
    exit 1
fi

dest="${PREFIX}/share/jwebbinar_notebooks"
usedir="$(pwd)"

if [[ -d ${usedir}/work ]]; then
    usedir=${usedir}/work
fi

mkdir -p "${dest}"
rsync -av --exclude '.git*' --exclude 'README.md' --exclude '.DS_Store' "${usedir}" "${dest}"/
