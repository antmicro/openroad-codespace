FROM debian:12

COPY ./scripts/build-openroad.sh /opt/build-openroad.sh
RUN apt-get update && bash /opt/build-openroad.sh

COPY ./scripts/build-klayout.sh /opt/build-klayout.sh
RUN apt update && bash /opt/build-klayout.sh

RUN apt install -y firefox-esr
