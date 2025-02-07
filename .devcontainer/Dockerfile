# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/vscode/devcontainers/base:0-debian11
ENV DOCKER_BUILDKIT=1
WORKDIR /
COPY . .
# # Must uncomment or add it yourself if you want to add pkg-config.
# RUN echo "deb http://deb.debian.org/debian bullseye main contrib non-free" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
    wget curl git build-essential \
    zlib1g-dev libncurses5-dev libgdbm-dev \
    libnss3-dev libssl-dev libreadline-dev \
    libffi-dev libsqlite3-dev libbz2-dev \
    cmake \
    && rm -rf /var/lib/apt/lists/*
# #  Uncomment to add pkg-config and mariadb-client.
# RUN pkg-config mariadb-client
RUN cmake --version
USER vscode
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
    && PATH="$HOME/.cargo/bin:$PATH"
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

EXPOSE 5001
CMD [ "sleep", "infinity" ]