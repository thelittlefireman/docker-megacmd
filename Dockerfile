FROM debian:latest
RUN apt-get update && apt-get install curl gnupg2 -y && \
curl https://mega.nz/linux/MEGAsync/Debian_10.0/amd64/megacmd_1.2.0-7.1_amd64.deb --output megacmd.deb && \
echo path-include /usr/share/doc/megacmd/* > /etc/dpkg/dpkg.cfg.d/docker && \
apt install ./megacmd.deb -y && \
apt-get remove -y curl && \
apt-get clean

COPY entrypoint.sh entrypoint.sh

ENV USERNAME NOBODY
ENV PASSWORD CHANGEME
ENV MEGACMD mega-put

ENTRYPOINT bash ./entrypoint.sh
CMD /bin/bash
