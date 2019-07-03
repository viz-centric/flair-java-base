FROM openjdk:12

LABEL maintainer="admin@vizcentric.com"
LABEL name="Vizcentric"
LABEL product="Flair"

RUN groupadd -g 999 flairuser && \
    useradd --shell /bin/bash --create-home --home /home/flairuser -r -u 999 -g flairuser flairuser

ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JAVA_OPTS="" \
    JHIPSTER_SLEEP=0


RUN chown -R flairuser:flairuser /app
RUN chmod -R 755 /app

USER flairuser

# Add entrypoint script
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]


