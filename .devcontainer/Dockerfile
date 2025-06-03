FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y \
    curl \
    git \
    libmagickwand-dev \
    imagemagick \
    libsqlite3-dev \
    zlib1g-dev \
    python2 \
    build-essential && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash

RUN /root/.rbenv/bin/rbenv install 2.1.0 && /root/.rbenv/bin/rbenv global 2.1.0

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
RUN export NVM_DIR="$HOME/.nvm" && \
    . "$NVM_DIR/nvm.sh" && \
    nvm install 4 && \
    nvm alias default 4

RUN /root/.rbenv/shims/gem install bundler -v 1.6.2
