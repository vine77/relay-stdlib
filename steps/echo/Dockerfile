FROM relaysh/core:latest
RUN apk --no-cache add bash ca-certificates jq
COPY step.sh /relay/step.sh
CMD ["/relay/step.sh"]

LABEL "org.opencontainers.image.title"="echo"
LABEL "org.opencontainers.image.description"="Echo a message provided as a parameter"
LABEL "com.puppet.nebula.sdk.version"="v1"
