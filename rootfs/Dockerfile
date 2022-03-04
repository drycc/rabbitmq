FROM docker.io/drycc/base:bullseye

ARG DRYCC_UID=1001
ARG DRYCC_GID=1001
ARG DRYCC_HOME_DIR=/var/lib/rabbitmq

RUN groupadd drycc --gid ${DRYCC_GID} \
  && useradd drycc -u ${DRYCC_UID} -g ${DRYCC_GID} -s /bin/bash -m -d ${DRYCC_HOME_DIR}

ENV ERLANG_VERSION="24.2.2" \
  RABBITMQ_VERSION="3.9.13" \
  RABBITMQ_DATA_DIR=${DRYCC_HOME_DIR}

RUN install-stack erlang ${ERLANG_VERSION} \
  && install-stack rabbitmq ${RABBITMQ_VERSION} \
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
