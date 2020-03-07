FROM ubuntu:18.04



RUN apt-get update

RUN apt-get install openssh-server -y

RUN apt-get install python -y

RUN mkdir /root/.ssh

ADD authorized_keys /root/.ssh

RUN chmod 600 /root/.ssh/authorized_keys

RUN chmod 700 /root/.ssh

