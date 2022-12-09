FROM mcr.microsoft.com/vscode/devcontainers/base:alpine-3.16

ENV TZ "Europe/Madrid"

RUN apk add --no-cache \
        docker \
        docker-cli-compose \
        github-cli \
        make \
        openssl \
        util-linux
