FROM mcr.microsoft.com/vscode/devcontainers/base:alpine-3.16

# Labels section
LABEL org.opencontainers.image.source https://github.com/jorgecar/codespace

# Build options
ARG DIND_COMMIT=42b1175eda071c0e9121e1d64345928384a93df1

# Forced environement values
ENV DOCKER_BUILDKIT 1
ENV TZ "Europe/Madrid"

# Packages installation
RUN apk add --no-cache \
    docker \
    make

# User & groups settings
RUN set -x \
    && addgroup -S dockremap \
    && adduser -S -G dockremap dockremap \
    && echo 'dockremap:165536:65536' >> /etc/subuid \
    && echo 'dockremap:165536:65536' >> /etc/subgid

# Docker-in-Docker setup
RUN wget "https://raw.githubusercontent.com/docker/docker/${DIND_COMMIT}/hack/dind" -O /usr/local/bin/dind \
    && chmod +x /usr/local/bin/dind
COPY library-scripts/dockerd-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/dockerd-entrypoint.sh

VOLUME /var/lib/docker
ENTRYPOINT ["/usr/local/bin/dockerd-entrypoint.sh"]
CMD []
