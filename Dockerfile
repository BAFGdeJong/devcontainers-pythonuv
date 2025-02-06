# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/vscode/devcontainers/base:0-debian11
ENV DOCKER_BUILDKIT=1
WORKDIR /
COPY . .
RUN echo "deb http://deb.debian.org/debian bullseye main contrib non-free" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
    wget curl git build-essential \
    zlib1g-dev libncurses5-dev libgdbm-dev \
    libnss3-dev libssl-dev libreadline-dev \
    libffi-dev libsqlite3-dev libbz2-dev \
    cmake pkg-config \
    && rm -rf /var/lib/apt/lists/*
RUN cmake --version
USER vscode
WORKDIR $HOME
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
    && PATH="$HOME/.cargo/bin:$PATH"
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
EXPOSE 3000
CMD [ "sleep", "infinity" ]