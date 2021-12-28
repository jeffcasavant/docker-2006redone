FROM openjdk:8-jdk-bullseye AS build

MAINTAINER jeff@casavant.org

RUN mkdir /fileserver
COPY files /fileserver/
WORKDIR /fileserver

# Build
RUN mkdir -p bin
RUN find . -name "*.java" > sources
RUN javac -cp "bin:assets/*" -d bin/ @sources

##

FROM openjdk:8-jre-slim-bullseye AS final

COPY --from=build /fileserver /fileserver
WORKDIR /fileserver

EXPOSE 80 43595 43596

ENTRYPOINT ["java","-cp","bin:assets/*","org.apollo.jagcached.FileServer"]
