FROM debian:stable-slim

RUN apt-get update \
    && apt-get install -y curl unzip ca-certificates --no-install-recommends \
    && curl -OL https://github.com/noborus/trdsql/releases/download/v0.10.1/trdsql_v0.10.1_linux_arm64.zip \
    && unzip trdsql_v0.10.1_linux_arm64.zip \
    && cp trdsql_v0.10.1_linux_arm64/trdsql /usr/bin/trdsql \
    && rm -rf trdsql_v0.10.1_linux_arm64 trdsql_v0.10.1_linux_arm64.zip \
    && apt-get remove --purge -y curl unzip ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work

RUN adduser myuser && chown -R myuser /work
USER myuser

ENTRYPOINT ["/usr/bin/trdsql"]
