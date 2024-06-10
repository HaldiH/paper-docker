FROM amazoncorretto:21-alpine

ARG MC_BASE=/opt/minecraft

RUN apk add --no-cache envsubst
ADD --chmod=755 https://api.papermc.io/v2/projects/paper/versions/1.20.6/builds/54/downloads/paper-1.20.6-54.jar ${MC_BASE}/server.jar
COPY --chmod=644 server.properties ${MC_BASE}/
COPY --chmod=755 entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
VOLUME [ "/data" ]
EXPOSE 25565
WORKDIR /data
RUN [ "chmod", "777", "/data" ]
USER 1000:1000
