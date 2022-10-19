FROM golang:1.19

RUN apt-get update \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work

RUN adduser myuser && chown -R myuser /work
USER myuser

ENTRYPOINT ["go"]
