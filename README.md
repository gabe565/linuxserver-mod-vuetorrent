# LinuxServer.io VueTorrent Mod

Docker mod that installs [VueTorrent](https://github.com/WDaan/VueTorrent) to the [LinuxServer.io qBittorrent images](https://github.com/linuxserver/docker-qbittorrent).

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
