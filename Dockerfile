FROM ubuntu:14.04

RUN apt-get update \
    && apt-get install -y wget \
    && apt-get clean \
    && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" -O /tmp/jdk-8u92-linux-x64.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-linux-x64.tar.gz \
    && mkdir /opt/java && tar -zxf /tmp/jdk-8u92-linux-x64.tar.gz -C /opt/java/
    
ENV JAVA_HOME /opt/java/jdk1.8.0_92
ENV PATH $JAVA_HOME/bin:$PATH

RUN update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 1000 \
    && update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 1000
