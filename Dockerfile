FROM debian:stretch-slim

ENV JAVA_VERSION=9
ENV JAVA_UPDATE=181
ENV JAVA_HOME="/usr/lib/jvm/default-jvm"

RUN apt-get update && apt-get install -y wget ca-certificates unzip && \
    cd /tmp && \
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}+${JAVA_UPDATE}/jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz" && \
    tar -xzf "jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz" && \
    mkdir -p "/usr/lib/jvm" && \
    mv "/tmp/jdk-${JAVA_VERSION}" "/usr/lib/jvm/java-${JAVA_VERSION}-oracle" && \
    ln -s "java-${JAVA_VERSION}-oracle" "$JAVA_HOME" && \
    ln -s "$JAVA_HOME/bin/"* "/usr/bin/" && \
    rm "/tmp/jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz" && \
    rm -f "$JAVA_HOME/lib/src.zip" && \
    rm -rf "$JAVA_HOME/lib/missioncontrol" && \
    rm -rf "$JAVA_HOME/lib/desktop" && \
    apt-get remove -y wget ca-certificates unzip

WORKDIR /
