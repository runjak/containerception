FROM alpine:latest

MAINTAINER Jakob Runge <sicarius@g4t3.de>

LABEL version="1.0.0" \
      source="https://github.com/runjak/dockerception"

RUN apk update \
 && apk upgrade \
 && apk add \
    zsh \
    tmux \
    docker \
    docker-zsh-completion \
    git \
    py-pip \
 && wget -O /etc/zsh/zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc \
 && pip install --upgrade pip \
 && pip install docker-compose \
 && rm /var/cache/apk/APKINDEX*tar.gz
