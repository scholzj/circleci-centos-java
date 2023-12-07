
FROM		centos:7
MAINTAINER 	JAkub Scholz "www@scholzj.com"

# Install needed software and users
USER root
RUN groupadd -r circleci && useradd -r -d /home/circleci -m -g circleci circleci
RUN yum install -y epel-release && \
    yum install -y git tar curl wget sudo make yum-utils device-mapper-persistent-data lvm2 java-17-openjdk-headless java-11-openjdk-devel maven openssl && \
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    yum install -y docker-ce && \
    yum clean all
RUN echo "%circleci        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

# Install CFSSL
RUN curl -o /usr/bin/cfssljson https://github.com/cloudflare/cfssl/releases/download/v1.5.0/cfssljson_1.5.0_linux_amd64
RUN curl -o /usr/bin/cfssl https://github.com/cloudflare/cfssl/releases/download/v1.5.0/cfssl_1.5.0_linux_amd64

ENV JAVA_HOME=/usr/lib/jvm/java-11

USER circleci
