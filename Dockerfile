FROM --platform=$BUILDPLATFORM alpine/git as src
WORKDIR /app

ARG VUETORRENT_REPO=WDaan/VueTorrent
ARG VUETORRENT_REF=v1.7.4

RUN git clone -q \
    --config=advice.detachedHead=false \
    --branch="$VUETORRENT_REF" \
    --depth=1 \
    "https://github.com/$VUETORRENT_REPO.git" .


FROM --platform=$BUILDPLATFORM node:18-alpine as builder
WORKDIR /app

COPY --from=src /app/package*.json .
RUN npm ci

COPY --from=src /app .
RUN npm run build

WORKDIR /rootfs
RUN mv /app/vuetorrent .


FROM scratch
COPY --from=builder /rootfs /
