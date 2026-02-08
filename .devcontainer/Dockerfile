FROM ubuntu:24.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y \
    curl \
    git \
    libmagickwand-dev \
    imagemagick \
    libsqlite3-dev \
    libssl-dev \
    libyaml-dev \
    libreadline-dev \
    zlib1g-dev \
    build-essential && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash

RUN /root/.rbenv/bin/rbenv install 3.4.8 && /root/.rbenv/bin/rbenv global 3.4.8

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
RUN export NVM_DIR="$HOME/.nvm" && \
    . "$NVM_DIR/nvm.sh" && \
    nvm install 14 && \
    nvm alias default 14

RUN /root/.rbenv/shims/gem install bundler -v 2.6.2
