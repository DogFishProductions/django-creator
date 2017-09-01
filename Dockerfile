# Version: 0.0.1

FROM python:3.6.2-alpine3.6

MAINTAINER Paul Nebel "paul@nebel.io"
ENV REFRESHED_AT 2017_08_30
LABEL name="Base dev image for django"
LABEL version="1.0"

# Add the relevant packages
RUN apk update -q &&\
    apk add --no-cache make gcc g++ postgresql-dev libpq &&\
    apk upgrade

# Create "dogfish" user
RUN addgroup appuser &&\
    adduser -G appuser -g "App User" -h /home/dogfish -s /bin/ash -D dogfish &&\
    chown -R dogfish:appuser /usr/local

# Set up some semblance of an environment
WORKDIR /home/dogfish
ENV HOME /home/dogfish
RUN chown -R dogfish:appuser /home/dogfish

USER dogfish

WORKDIR /home/dogfish
VOLUME /home/dogfish

ADD requirements.txt /home/dogfish/
RUN pip install -r requirements.txt