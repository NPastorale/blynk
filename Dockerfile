FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk --progress --no-cache add openjdk8-jre curl && \
    mkdir /blynk && \
    mkdir /data && \
    mkdir /config && \
    touch /config/server.properties && \
    curl -L https://github.com/blynkkk/blynk-server/releases/download/v0.30.0/server-0.30.0-java8.jar > /blynk/server.jar

VOLUME ["/config", "/data/backup"]

EXPOSE 7443 8080 8081 8082 8441 8442 8443 9443

WORKDIR /data
ENTRYPOINT ["java", "-jar", "/blynk/server.jar", "-dataFolder", "/data", "-serverConfig", "/config/server.properties"]
