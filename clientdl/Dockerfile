FROM openjdk:8-jdk-bullseye AS build

# Optional args for those who are rebuilding this
ARG name=localhost
ARG ip=127.0.0.1
ARG website=localhost:8000

MAINTAINER jeff@casavant.org

RUN apt-get update && \
    apt-get install -y zip

COPY files /client/
COPY keys /keys
WORKDIR /client

# Install key
RUN sed -i "s/RSA_MODULUS_PLACEHOLDER/\"$(cat /keys/modulus)\"/" src/ClientSettings.java
RUN sed -i "s/SERVER_IP_PLACEHOLDER/\"$ip\"/" src/ClientSettings.java
RUN sed -i "s/SERVER_NAME_PLACEHOLDER/\"$name\"/" src/ClientSettings.java
RUN sed -i "s/SERVER_WEBSITE_PLACEHOLDER/\"$website\"/" src/ClientSettings.java

# Build
RUN mkdir -p bin
RUN find . -name "*.java" > sources
RUN javac -cp "libs/*" -d bin/ @sources

# Package
RUN mkdir -p /http
WORKDIR /
RUN zip -r /http/client.zip /client/bin /client/run.bat /client/run.sh

##

FROM python:3-slim-bullseye AS final

EXPOSE 8000

COPY --from=build /http /http

WORKDIR /http

ENTRYPOINT ["python","-m","http.server","8000"]
