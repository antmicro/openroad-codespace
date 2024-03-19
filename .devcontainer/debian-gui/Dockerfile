FROM debian:12

# COPY ./scripts/build-openroad.sh /tmp/scripts/build-openroad.sh
# RUN apt-get update && bash /tmp/scripts/build-openroad.sh

# COPY ./scripts/build-klayout.sh /tmp/scripts/build-klayout.sh
# RUN apt update && bash /tmp/scripts/build-klayout.sh

SHELL [ "/bin/bash", "-c" ]

# Firefox
RUN apt-get update && apt -qy install --no-install-recommends firefox-esr


# Google Chrome
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && curl -sSL https://dl.google.com/linux/direct/google-chrome-stable_current_$(dpkg --print-architecture).deb -o /tmp/chrome.deb \
#     && apt-get -y install /tmp/chrome.deb
