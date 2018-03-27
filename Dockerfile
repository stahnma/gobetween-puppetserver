
from alpine:latest

LABEL maintainer="Michael Stahnke <stahnma@websages.com>" \
      org.label-schema.url="https://github.com/stahnma/gobetween-puppetserver" \
      org.label-schema.license="Apache-2.0" \
      org.label-schema.vcs-url="https://github.com/stahnma/gobetween-puppetserver"

RUN apk update && apk add curl docker && rm -rf /var/lib/apk
RUN mkdir -p /app/tmp
RUN cd /app/tmp; curl -O -L https://github.com/yyyar/gobetween/releases/download/0.5.0/gobetween_0.5.0_linux_amd64.tar.gz && tar zxf gobetween_0.5.0_linux_amd64.tar.gz && mv gobetween .. && cd .. && rm -rf tmp
ADD puppet.toml /app
ADD healthcheck.sh /app
ADD backend.sh /app
WORKDIR /app
ADD Dockerfile /
expose 8140
CMD ["./gobtween", "-c", "puppet.toml"]
