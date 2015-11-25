FROM debian:wheezy

MAINTAINER Charlie Murray <charlie@bmore.co.uk>

RUN apt-get update && apt-get install -y apt-transport-https

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823

RUN apt-get update && \
    apt-get upgrade -q -y && \
    apt-get install -q -y --no-install-recommends openjdk-7-jre-headless openjdk-7-jdk maven2 ant sbt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN sbt update