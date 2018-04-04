FROM openjdk:8-jdk

MAINTAINER jeff@casavant.org

RUN mkdir /server
COPY files /server/
COPY keys /keys
WORKDIR /server

# Install keys
RUN sed -i "s/RSA_MODULUS_PLACEHOLDER/$(cat /keys/modulus)/" src/redone/net/RS2LoginProtocolDecoder.java
RUN sed -i "s/RSA_EXPONENT_PLACEHOLDER/$(cat /keys/exponent)/" src/redone/net/RS2LoginProtocolDecoder.java

# Build against OpenJDK
RUN mkdir -p bin
RUN find . -name "*.java" > sources
RUN javac -cp "libs/*" -d bin/ @sources

VOLUME Data

# Expose ports
EXPOSE 43594

ENTRYPOINT ["java","-cp","bin:libs/*","redone.Server"]
