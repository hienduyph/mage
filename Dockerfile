ARG VERSION=latest
FROM docker.io/mageai/mageai:${VERSION}
USER root

ENV VERSION=${VERSION}

# custom patch 
COPY ./telegram.patch /tmp
RUN cd /usr/local/lib/python3.10/site-packages && patch -p0 < /tmp/telegram.patch

RUN groupadd -g 1001 mageai \
  && useradd mageai -u 1001 -g 1001 -m -s /bin/bash \
  && mkdir -p /home/mageai/.ssh && chown -R 1001:1001 /home/src  /home/mageai/.ssh

USER mageai
