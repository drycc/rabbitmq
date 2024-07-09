ARG CODENAME
FROM registry.drycc.cc/drycc/base:${CODENAME}

ENV DRYCC_UID=1001 \
  DRYCC_GID=1001 \
  DRYCC_HOME_DIR=/data \
  JQ_VERSION="1.7.1" \
  ERLANG_VERSION="26.2.5" \
  RABBITMQ_LOGS=- \
  RABBITMQ_VERSION="3.13.4"

RUN groupadd drycc --gid ${DRYCC_GID} \
  && useradd drycc -u ${DRYCC_UID} -g ${DRYCC_GID} -s /bin/bash -m -d ${DRYCC_HOME_DIR}

RUN install-stack jq ${JQ_VERSION} \
  && install-stack erlang ${ERLANG_VERSION} \
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
  && mkdir -p /usr/share/man/man{1..8} \
  && chown -R ${DRYCC_UID}:${DRYCC_GID} /opt/drycc/rabbitmq ${DRYCC_HOME_DIR}

WORKDIR ${DRYCC_HOME_DIR}

USER ${DRYCC_UID}
CMD ["rabbitmq-server"]
EXPOSE 4369 5671 5672 15691 15692 25672
