FROM salesforce/salesforcedx:latest-slim

RUN apt-get update \
    && apt-get install -y locales

RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja_JP
ENV LC_ALL ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8

# Plugins
RUN sfdx plugins:install sfdmu

WORKDIR /work

RUN adduser myuser && chown -R myuser /work
USER myuser

ENTRYPOINT ["/usr/local/sfdx/bin/sfdx"]