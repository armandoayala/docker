FROM jenkins/jenkins:lts
USER root

RUN mkdir -p /tmp/download && \
 curl -L https://download.docker.com/linux/static/stable/x86_64/docker-18.03.1-ce.tgz | tar -xz -C /tmp/download && \
 rm -rf /tmp/download/docker/dockerd && \
 mv /tmp/download/docker/docker* /usr/local/bin/ && \
 rm -rf /tmp/download && \
 groupadd -g 115 docker && \
 usermod -a -G docker jenkins

RUN apt-get update
RUN apt install python3-pip -y
RUN pip3 install awscli --upgrade

USER jenkins