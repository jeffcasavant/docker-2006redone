This project holds a Dockerized version of the 2006Redone server found [on this blog post](https://www.rune-server.ee/runescape-development/rs2-server/downloads/655403-2006redone-release-highly-accurate-runescape-2006-remake.html).  It's not my code, but I jammed it into Docker.

The docker-compose.yaml should serve as documentation of what ports you need to make this work.

The `clientdl` container provides a web interface to download the client from.

These images are published at `jeffcasavant/2006redone-<component>`.