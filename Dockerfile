ARG VERSION=latest
FROM docker.io/mageai/mageai:${VERSION}

RUN groupadd -g 1001 mageai \
  && useradd mageai -u 1001 -g 1001 -m -s /bin/bash

RUN mkdir -p /home/mageai/.ssh && chown -R 1001:1001 /home/src  /home/mageai/.ssh

COPY bigquery.py.patch /tmp

RUN patch  /usr/local/lib/python3.10/site-packages/mage_ai/io/bigquery.py /tmp/bigquery.py.patch

WORKDIR /home/src

USER mageai
