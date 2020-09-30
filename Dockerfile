FROM alpine:latest
LABEL maintainer="wenupix@gmail.com"
# basic system tools
RUN apk add coreutils procps bash vim curl git wget links
# dev tools
RUN apk add python3 py3-pip && \
    ln -sf /usr/bin/python3 /usr/bin/python
# config
RUN pip install Flask
RUN mkdir /app
COPY service.py /app/service.py
COPY start.sh /start.sh

CMD bash /start.sh