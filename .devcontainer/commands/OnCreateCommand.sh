if [[ ! -f 'composer.json' ]]
then
    docker run --rm --interactive --tty --volume /tmp:/app --user $(id -u):$(id -g) composer create-project laravel/laravel ${RepositoryName}
    cp -r /tmp/${RepositoryName}/*  ${CODESPACE_VSCODE_FOLDER}
    cp -r /tmp/${RepositoryName}/.*  ${CODESPACE_VSCODE_FOLDER}
    rm -rf /tmp/${RepositoryName}
fi
