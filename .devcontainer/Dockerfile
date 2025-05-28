FROM ubuntu:14.04

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y \
    curl \
    git \
    ruby \
    ruby-dev \
    libmagickcore-dev \
    libmagickwand-dev \
    libsqlite3-dev \
    build-essential && \
    rm -rf /var/lib/apt/lists/*

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
RUN export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \
    \. "$NVM_DIR/nvm.sh" && \
    nvm install 4 && \
    nvm alias default 4

RUN gem install bundler -v 1.6.2
