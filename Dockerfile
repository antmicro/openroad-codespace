FROM ubuntu:22.04

SHELL [ "/bin/bash", "-c" ]

RUN apt -qqy update && apt -qqy upgrade

RUN apt -qqy install --no-install-recommends klayout
RUN apt -qqy install --no-install-recommends git


COPY ./scripts/build-orfs.sh /tmp/scripts/build-orfs.sh
RUN bash /tmp/scripts/build-orfs.sh

COPY ./scripts/build-klayout.sh /tmp/scripts/build-klayout.sh
RUN bash /tmp/scripts/build-klayout.sh
