FROM ubuntu:latest

RUN apt-get update -y && apt-get install -y \
    python3.10 \
    python3-pip \
    git

RUN python3 -m venv .venv --without-pip --system-site-packages
RUN source .venv/bin/activate
RUN python3 -m pip install PyYAML
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

