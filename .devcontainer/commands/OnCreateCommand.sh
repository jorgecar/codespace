if [[ ! -f "./composer.json" ]]
then
    mv .git /tmp
    mv .github /tmp
    mv .devcontainer /tmp
    
    docker run --rm --interactive --tty --volume ${PWD}:/app --user $(id -u):$(id -g) composer create-project laravel/laravel .

    mv /tmp/.git .
    mv /tmp/.github .
    mv /tmp/.devcontainer .
fi
