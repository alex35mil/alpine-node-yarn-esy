################################################################################
# Dockerfile used for building linux/alpine binary
# taken from https://github.com/anmonteiro/gh-feed-reader/blob/master/Dockerfile
################################################################################

FROM node:16-alpine

ENV TERM=dumb LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/lib

WORKDIR /

RUN npm install --global --unsafe-perm esy@0.6.12

RUN apk add --no-cache ca-certificates wget bash curl perl-utils git patch gcc g++ musl-dev make m4 linux-headers coreutils file python3 py3-pip

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk
RUN apk add --no-cache --force-overwrite glibc-2.29-r0.apk

ENTRYPOINT ["/bin/bash", "-c"]
