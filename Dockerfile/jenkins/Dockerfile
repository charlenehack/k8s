FROM jenkins/jenkins:2.150
USER root
RUN apt-get update -y && apt-get -y install --no-install-recommends ansible expect rsync
COPY ssh-keygen.sh ssh-copy-id.sh /
RUN apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
