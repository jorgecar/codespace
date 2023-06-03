FROM mcr.microsoft.com/vscode/devcontainers/php:8.1

ARG USERNAME=vscode
ARG DIND_COMMIT=42b1175eda071c0e9121e1d64345928384a93df1

ENV DOCKER_BUILDKIT 1
ENV TZ "Europe/Madrid"

RUN apk add --no-cache \
    docker \
    docker-cli-compose \
    github-cli \
    make \
    openssl \
    util-linux

RUN set -x \
    && addgroup -S dockremap \
    && adduser -S -G dockremap dockremap \
    && echo 'dockremap:165536:65536' >> /etc/subuid \
    && echo 'dockremap:165536:65536' >> /etc/subgid \
    && addgroup $USERNAME docker \
    && usermod --shell /bin/zsh $USERNAME

RUN wget "https://raw.githubusercontent.com/docker/docker/${DIND_COMMIT}/hack/dind" -O /usr/local/bin/dind \
    && chmod +x /usr/local/bin/dind
COPY library-scripts/dockerd-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/dockerd-entrypoint.sh

ENV COMPOSER_HOME="/workspaces/.codespaces/.persistedshare/.config/composer"
ENV COMPOSER_CACHE_DIR="/workspaces/.codespaces/.persistedshare/.cache/composer"

VOLUME ["/var/lib/docker"]
ENTRYPOINT ["/usr/local/bin/dockerd-entrypoint.sh"]
CMD []
