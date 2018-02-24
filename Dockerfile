FROM alpine:latest
LABEL MAINTAINER="XTRadio Ops <contact@akos.me>" \
      version="0.1" \
      description="XTRadio Icecast docker image"

ENV ICECAST_VERSION 2.4.3-r4

ARG user=icecast
ARG group=icecast

RUN apk -q update \
    && apk -q --no-progress add icecast="$ICECAST_VERSION" \
    && rm -rf /var/cache/apk/*

#COPY icecast.xml /usr/share/icecast/icecast.xml

RUN mkdir -p /var/log/icecast \
    && chown -R ${user}:${group} /usr/share/icecast \
    && chown -R ${user}:${group} /var/log/icecast

EXPOSE 8080

USER ${user}
CMD ["icecast", "-c", "/usr/share/icecast/icecast.xml"]

