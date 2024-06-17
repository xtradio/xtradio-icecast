FROM alpine:3.20.0
LABEL org.xtradio.maintainer="XTRadio Ops <contact@xtradio.org>" \
    org.xtradio.icecast.version="v2.2.4" \
    org.xtradio.description="XTRadio IceCast docker image"

ENV ICECAST_VERSION 2.4.4-r10

ARG user=icecast
ARG group=icecast

RUN apk -q update \
    && apk -q --no-progress add icecast="$ICECAST_VERSION" \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /var/log/icecast \
    && chown -R ${user}:${group} /usr/share/icecast \
    && chown -R ${user}:${group} /var/log/icecast

EXPOSE 8080

USER ${user}
CMD ["icecast", "-c", "/usr/share/icecast/icecast.xml"]

