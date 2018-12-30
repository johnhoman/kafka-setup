FROM ubuntu:16.04

RUN apt-get update \
    && \
    apt-get install -y \
        curl \
        software-properties-common

RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
RUN export JAVA_HOME

# install zookeeper
ENV ZOOKEEPER_CONF /usr/local/zookeeper/conf/zoo.cfg
RUN curl -O https://apache.claz.org/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz \
    && \
    tar -zxf zookeeper-3.4.10.tar.gz \
    && \
    mv zookeeper-3.4.10 /usr/local/zookeeper \
    && \
    mkdir -p /var/lib/zookeeper \
    && \
    touch $ZOOKEEPER_CONF \
    && \
    echo "tickTime=2000" >>  $ZOOKEEPER_CONF \
    && \
    echo "dataDir=/var/lib/zookeeper" >> $ZOOKEEPER_CONF \
    && \
    echo "clientPort=2181" >> $ZOOKEEPER_CONF

RUN curl -O http://apache.mirrors.hoobly.com/kafka/2.1.0/kafka_2.12-2.1.0.tgz \
    && \
    tar -zxf kafka_2.12-2.1.0.tgz \
    && \
    mv kafka_2.12-2.1.0 /usr/local/kafka \
    && \
    mkdir /tmp/kafka-logs

EXPOSE 2181

ENTRYPOINT bash
