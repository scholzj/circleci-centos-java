
FROM		centos:7
MAINTAINER 	JAkub Scholz "www@scholzj.com"

# Install needed software and users
USER root
RUN groupadd -r circleci && useradd -r -d /home/circleci -m -g circleci circleci
RUN yum install -y git tar curl wget sudo make docker java-1.8.0-openjdk-headless java-1.8.0-openjdk-devel maven && yum clean all
RUN echo "%circleci        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

# Install CFSSL
RUN curl -o /usr/bin/cfssljson https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64
RUN curl -o /usr/bin/cfssl https://pkg.cfssl.org/R1.2/cfssl_linux-amd64

USER circleci
