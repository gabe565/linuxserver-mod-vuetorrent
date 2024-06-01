FROM --platform=$BUILDPLATFORM alpine:3.20 as src
WORKDIR /app

ARG VUETORRENT_REPO=WDaan/VueTorrent
ARG VUETORRENT_REF=v2.9.0

RUN <<EOT
  set -eux
  wget "https://github.com/$VUETORRENT_REPO/releases/download/$VUETORRENT_REF/vuetorrent.zip"
  unzip vuetorrent.zip
  rm vuetorrent.zip
EOT

WORKDIR /rootfs
RUN mv /app/vuetorrent .


FROM scratch
COPY --from=src /rootfs /
