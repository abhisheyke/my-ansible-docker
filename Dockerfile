# Version: 0.0.1
FROM centos:6.6
MAINTAINER Abhishek Tripathi "abhisheyke@gmail.com"
RUN yum -y update
RUN yum -y install openssh-server openssh-clients
RUN service sshd start
RUN chkconfig sshd on
RUN yum -y install wget
RUN yum -y install java-1.8.0-openjdk.x86_64
RUN yum -y install curl
RUN yum -y install tar
RUN yum -y install nc.x86_64
RUN wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.2.tar.gz
RUN tar -zxf elasticsearch-1.5.2.tar.gz
RUN mv elasticsearch-1.5.2 /usr/local/elasticsearch
RUN chkconfig iptables off
RUN ln -s /usr/bin/*java* /bin
RUN /usr/local/elasticsearch/bin/plugin --install mobz/elasticsearch-head
ENTRYPOINT ['/bin/bash']
