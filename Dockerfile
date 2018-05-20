FROM openjdk:8u151-jre-alpine
MAINTAINER SrinivasaPrasadA

ENV KAFKA_VERSION 1.1.0
ENV SCALA_VERSION 2.11.11

WORKDIR /opt/
RUN pwd

RUN wget http://www-us.apache.org/dist/kafka/$KAFKA_VERSION/kafka_2.11-$KAFKA_VERSION.tgz && \
    tar zxf /opt/kafka_2.11-$KAFKA_VERSION.tgz && \
    mv /opt/kafka_2.11-$KAFKA_VERSION /opt/kafka && \
    rm /opt/kafka_2.11-$KAFKA_VERSION.tgz

RUN wget http://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz && \
    tar zxf /opt/scala-$SCALA_VERSION.tgz && \
    mv /opt/scala-$SCALA_VERSION /opt/scala && \
    rm /opt/scala-$SCALA_VERSION.tgz

ENV KAFKA_HOME /opt/kafka
ENV PATH=$PATH:$KAFKA_HOME/bin

ADD server.properties $KAFKA_HOME/conf/server.properties

RUN apk add --no-cache bash jq

COPY start-kafka.sh /tmp/
RUN chmod a+x /tmp/start-kafka.sh

RUN mv /tmp/start-kafka.sh /usr/bin

CMD ["start-kafka.sh"]

EXPOSE 9092

