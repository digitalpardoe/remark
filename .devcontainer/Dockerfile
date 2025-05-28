FROM ubuntu:20.04

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y \
    curl \
    git \
    gnupg \
    software-properties-common \
    libmagickcore-dev \
    libmagickwand-dev \
    libsqlite3-dev \
    build-essential && \
    rm -rf /var/lib/apt/lists/*

# Install RVM and Ruby
RUN gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB || \
    (curl -sSL https://rvm.io/mpapis.asc | gpg --import - && curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -)
RUN curl -sSL https://get.rvm.io | bash -s stable
SHELL ["/bin/bash", "-l", "-c"]
RUN source /etc/profile.d/rvm.sh && \
    rvm install 1.9.1-p431 --autolibs=4 && \
    rvm use 1.9.1-p431 --default

# NVM and Node installation
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
RUN export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \
    \. "$NVM_DIR/nvm.sh" && \
    nvm install 4 && \
    nvm alias default 4

RUN gem install bundler -v 1.6.2 --no-document
