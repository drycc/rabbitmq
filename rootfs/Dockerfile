FROM docker.io/drycc/base:bullseye

RUN adduser --system \
   --shell /bin/bash \
   --disabled-password \
   --home /opt/drycc/rabbitmq \
   --group \
   drycc

ENV ERLANG_VERSION="24.2.2" \
  RABBITMQ_VERSION="3.9.13"

RUN install-stack erlang $ERLANG_VERSION \
  && install-stack rabbitmq $RABBITMQ_VERSION \
  && rm -rf \
      /usr/share/doc \
      /usr/share/man \
      /usr/share/info \
      /usr/share/locale \
      /var/lib/apt/lists/* \
      /var/log/* \
      /var/cache/debconf/* \
      /etc/systemd \
      /lib/lsb \
      /lib/udev \
      /usr/lib/`echo $(uname -m)`-linux-gnu/gconv/IBM* \
      /usr/lib/`echo $(uname -m)`-linux-gnu/gconv/EBC* \
  && bash -c "mkdir -p /usr/share/man/man{1..8}" \
  && mkdir -p /var/lib/rabbitmq \
  && chown -R drycc:drycc /opt/drycc/rabbitmq /var/lib/rabbitmq

USER drycc
CMD ["rabbitmq-server"]
EXPOSE 4369 5671 5672 15691 15692 25672
