FROM debian:wheezy

MAINTAINER Charlie Murray <charliemurray37@gmail.com>

RUN apt-get update && \
    apt-get install -q -y --no-install-recommends openjdk-7-jre-headless openjdk-7-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD sbt-launch-0.13.8.jar /var/sbt/

WORKDIR /var/sbt

RUN java -jar sbt-launch-0.13.8.jar 
