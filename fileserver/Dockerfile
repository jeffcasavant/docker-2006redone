FROM openjdk:8-jdk

MAINTAINER jeff@casavant.org

RUN mkdir /fileserver
COPY files /fileserver/
WORKDIR /fileserver

# Build against OpenJDK
RUN mkdir -p bin
RUN find . -name "*.java" > sources
RUN javac -cp "bin:assets/*" -d bin/ @sources

# Expose ports
EXPOSE 80 43595 43596

ENTRYPOINT ["java","-cp","bin:assets/*","org.apollo.jagcached.FileServer"]
