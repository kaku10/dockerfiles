FROM debian:stable-slim AS dl-env

RUN apt-get update \
    && apt-get install -y curl unzip ca-certificates --no-install-recommends \
    && curl -OL https://github.com/noborus/trdsql/releases/download/v0.10.1/trdsql_v0.10.1_linux_arm64.zip \
    && unzip trdsql_v0.10.1_linux_arm64.zip \
    && cp trdsql_v0.10.1_linux_arm64/trdsql /usr/bin/trdsql

FROM gcr.io/distroless/base-debian11

COPY --chown=nonroot:nonroot --from=dl-env /usr/bin/trdsql /usr/local/bin/trdsql
USER nonroot
WORKDIR /work

ENTRYPOINT ["/usr/local/bin/trdsql"]
