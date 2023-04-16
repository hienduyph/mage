ARG VERSION=latest
FROM docker.io/mageai/mageai:${VERSION}

RUN groupadd -g 1001 mageai \
  && useradd mageai -u 1001 -g 1001 -m -s /bin/bash

RUN mkdir -p /home/mageai/.ssh && chown -R 1001:1001 /home/src  /home/mageai/.ssh

WORKDIR /home/src

USER mageai
