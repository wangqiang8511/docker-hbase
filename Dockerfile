FROM ubuntu:14.04
MAINTAINER Wang Qiang <wangqiang8511@gmail.com>

# Last Package Update & Install
RUN apt-get update && apt-get install -y curl wget net-tools iputils-ping vim

# JDK
ENV JDK_URL http://download.oracle.com/otn-pub/java/jdk
ENV JDK_VER 8u51-b16
ENV JDK_VER2 jdk-8u51
ENV JAVA_HOME /usr/local/jdk
ENV PATH $PATH:$JAVA_HOME/bin
RUN curl -LO "$JDK_URL/$JDK_VER/$JDK_VER2-linux-x64.tar.gz" -H 'Cookie: oraclelicense=accept-securebackup-cookie' \
 && tar xzf $JDK_VER2-linux-x64.tar.gz && mv jdk1* $JAVA_HOME && rm -f $JDK_VER2-linux-x64.tar.gz \
 && echo '' >> /etc/profile \
 && echo '# JDK' >> /etc/profile \
 && echo "export JAVA_HOME=$JAVA_HOME" >> /etc/profile \
 && echo 'export PATH="$PATH:$JAVA_HOME/bin"' >> /etc/profile \
 && echo '' >> /etc/profile

# Apache Hbase
ENV HBASE_URL http://archive.apache.org/dist/hbase
ENV HBASE_VERSION hbase-1.0.0
RUN  mkdir -p /var/log/hbase \
 && wget "$HBASE_URL/$HBASE_VERSION/$HBASE_VERSION-bin.tar.gz" \
 && tar xzf $HBASE_VERSION-bin.tar.gz \
 && ln -s /$HBASE_VERSION /hbase \
 && rm -f $HBASE_VERSION-bin.tar.gz

# Ports
# hbase.master.info.port
ENV MASTER_INFO_PORT=16010
# hbase.regionserver.port
ENV REGION_SERVER_PORT=16020
# hbase.regionserver.info.port
ENV REGION_SERVER_INFO_PORT=16030
