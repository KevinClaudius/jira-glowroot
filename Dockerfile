FROM busybox:1.31.0 as glowroot-stage

RUN wget -O /glowroot.zip https://github.com/glowroot/glowroot/releases/download/v0.13.5/glowroot-0.13.5-dist.zip
RUN unzip glowroot.zip

FROM cptactionhank/atlassian-jira:8.0.2

COPY --from=glowroot-stage --chown=daemon:daemon /glowroot /glowroot
COPY --chown=daemon:daemon admin.json /glowroot/
ENV JAVA_OPTS=-javaagent:/glowroot/glowroot.jar

RUN                          \
  mkdir -p /glowroot/tmp  && \
  mkdir -p /glowroot/logs && \
  mkdir -p /glowroot/data

VOLUME           \
  /glowroot/tmp  \
  /glowroot/logs \
  /glowroot/data