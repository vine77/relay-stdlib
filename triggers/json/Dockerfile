FROM relaysh/core:latest-python
COPY handler.py /relay/handler.py
CMD ["python3", "/relay/handler.py"]

LABEL "org.opencontainers.image.title"="Send JSON data from a webhook to Relay"
LABEL "org.opencontainers.image.description"="This trigger forwards a JSON object to Relay as an event"
LABEL "com.puppet.nebula.sdk.version"="v1"
