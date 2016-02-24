FROM alpine:latest

MAINTAINER Jakob Runge <sicarius@g4t3.de>

LABEL version="1.0.0" \
      source="https://github.com/runjak/dockerception"

RUN apk update \
 && apk upgrade \
 && apk add docker py-pip \
 && pip install --upgrade pip \
 && pip install docker-compose \
 && rm /var/cache/apk/APKINDEX*tar.gz \
 && mkdir /dockerception

# List of images to docker pull:
ENV IMAGES="alpine:latest"

# Sleep time in between cycles:
ENV SLEEPTIME="10s"

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
