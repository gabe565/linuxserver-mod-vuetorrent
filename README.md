# LinuxServer.io VueTorrent Mod

<!--renovate repo=WDaan/VueTorrent -->
[![Version](https://img.shields.io/badge/Version-v2.27.0-informational?style=flat)](https://github.com/gabe565/linuxserver-mod-vuetorrent/pkgs/container/linuxserver-mod-vuetorrent)
[![Build](https://github.com/gabe565/linuxserver-mod-vuetorrent/actions/workflows/build.yml/badge.svg)](https://github.com/gabe565/linuxserver-mod-vuetorrent/actions/workflows/build.yml)

> [!IMPORTANT]
> VueTorrent now provides an [official LinuxServer.io Docker mod](https://github.com/VueTorrent/VueTorrent/wiki/Installation#using-lsio-docker-mod)! I will keep auto-updates enabled for this repo, but I'd suggest using the official mod for any new installations.
>
> The official mod is backwards-compatible with mine, so you can safely change `DOCKER_MODS=ghcr.io/gabe565/linuxserver-mod-vuetorrent` to `DOCKER_MODS=ghcr.io/vuetorrent/vuetorrent-lsio-mod`.

Docker mod that installs [VueTorrent](https://github.com/WDaan/VueTorrent) to the [LinuxServer.io qBittorrent images](https://github.com/linuxserver/docker-qbittorrent).

This mod was inspired by [arafatamim/linuxserver-io-mod-vuetorrent](https://github.com/arafatamim/linuxserver-io-mod-vuetorrent), but it takes a different approach. While arafatamim's mod relies on an installation script, my mod streamlines the process by packaging VueTorrent directly into the container image. As a result, the VueTorrent files are automatically downloaded alongside the mod, eliminating the need for an installation script. Additionally, this approach allows you to optionally pin a specific VueTorrent version.

# Installation

1. Add the following environment variable to your qBittorrent deployment (see [examples](#examples))
    ```dotenv
    DOCKER_MODS=ghcr.io/gabe565/linuxserver-mod-vuetorrent
    ```
2. Recreate the container
3. Go to `Options` > `Web UI`
4. Check `Use alternative Web UI`
5. Set `Files location` to `/vuetorrent`
6. Scroll down and click `Save`.
7. Refresh

## Examples

### docker-compose

```yaml
---
version: "2.1"
services:
  qbittorrent:
    image: lscr.io/linuxserver/qbittorrent:latest
    container_name: qbittorrent
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
      - WEBUI_PORT=8080
      - DOCKER_MODS=ghcr.io/gabe565/linuxserver-mod-vuetorrent
    volumes:
      - /path/to/appdata/config:/config
      - /path/to/downloads:/downloads
    ports:
      - 8080:8080
      - 6881:6881
      - 6881:6881/udp
    restart: unless-stopped
```

### Kubernetes Helm Chart

If you use my qBittorrent Helm chart, see [Custom configuration](https://github.com/gabe565/charts/tree/main/charts/qbittorrent#vuetorrent) in my chart docs.
