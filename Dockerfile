FROM debian:stretch-slim

ENV JAVA_VERSION=9
ENV JAVA_UPDATE=181
ENV JAVA_HOME="/usr/lib/jvm/default-jvm"

RUN apt-get update && apt-get install -y wget ca-certificates unzip
WORKDIR /tmp

RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}+${JAVA_UPDATE}/jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz"

RUN tar -xzf "jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz"
RUN mkdir -p "/usr/lib/jvm"
RUN mv "/tmp/jdk-${JAVA_VERSION}" "/usr/lib/jvm/java-${JAVA_VERSION}-oracle"
RUN ln -s "java-${JAVA_VERSION}-oracle" "$JAVA_HOME"
RUN ln -s "$JAVA_HOME/bin/"* "/usr/bin/"
RUN rm "/tmp/jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz"

## Clean unneeded files

# RUN apk del build-dependencies
WORKDIR /
