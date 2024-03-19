FROM debian:12

COPY ./scripts/build-openroad.sh /tmp/scripts/build-openroad.sh
RUN apt-get update && bash /tmp/scripts/build-openroad.sh

COPY ./scripts/build-klayout.sh /tmp/scripts/build-klayout.sh
RUN apt update && bash /tmp/scripts/build-klayout.sh

RUN apt install -y firefox-esr
