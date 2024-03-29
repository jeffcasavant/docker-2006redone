This project holds a Dockerized version of the 2006Redone server found [on this blog post](https://www.rune-server.ee/runescape-development/rs2-server/downloads/655403-2006redone-release-highly-accurate-runescape-2006-remake.html).  It's not my code, but I jammed it into Docker.

# Usage

* `docker-compose up`
* Fetch client.zip from localhost:8000
* Unzip & run
* Log in as an Existing User with any username and password.  Those will become your permanent credentials.

# Notes

* The docker-compose.yaml should serve as documentation of what ports you need to make this work.
* The `clientdl` container provides a web interface to download the client from.
* These images are published at `jeffcasavant/2006redone-<component>:<latest,YYYYMMDDTHHMMSS>` weekly.

# Hosting

Building all the images yourself is required if you want to host it somewhere other than `localhost`.  Images auto-built by this repo all use the same keys and the client needs the server's address hardcoded at build time.

* New keys will be auto-generated when you run `make build`.
* When you build the `clientdl` image, set the [args](https://github.com/jeffcasavant/docker-2006redone/blob/027d0d1661fc86aafd73d1502df8848ee8879506/clientdl/Dockerfile#L4) to what they will be in your deployment.
