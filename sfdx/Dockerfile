FROM salesforce/salesforcedx:latest-slim

RUN apt-get update \
    && apt-get install -y locales --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && sfdx plugins:install sfdmu # Plugin

RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja_JP
ENV LC_ALL ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8

WORKDIR /work

RUN adduser myuser && chown -R myuser /work
USER myuser

ENTRYPOINT ["/usr/local/sfdx/bin/sfdx"]
