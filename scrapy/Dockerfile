FROM python:3.9

RUN apt-get update \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir scrapy==2.7.1 scrapy-splash==0.8.0

WORKDIR /work

RUN adduser myuser && chown -R myuser /work
USER myuser

ENTRYPOINT ["scrapy"]
