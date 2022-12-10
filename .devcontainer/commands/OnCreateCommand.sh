// Add Composer cache folder
[[ ! -d $COMPOSER_HOME ]] && mkdir -p $COMPOSER_HOME
[[ ! -d $COMPOSER_CACHE_DIR ]] && mkdir -p $COMPOSER_CACHE_DIR

// Install Laravel
if [[ ! -f "./composer.json" ]]
then
    mv .git /tmp
    mv .github /tmp
    mv .devcontainer /tmp

    docker run --rm --interactive --tty \
        --env COMPOSER_HOME \
        --env COMPOSER_CACHE_DIR \
        --volume ${PWD}:/app \
        --volume ${COMPOSER_HOME}:$COMPOSER_HOME \
        --volume ${COMPOSER_CACHE_DIR}:$COMPOSER_CACHE_DIR \
        --user $(id -u):$(id -g) \
        composer create-project laravel/laravel .

    mv /tmp/.git .
    mv /tmp/.github .
    mv /tmp/.devcontainer .
fi
