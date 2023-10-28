FROM ubuntu:16.04

WORKDIR /home/choreouser

COPY files/* /home/choreouser/

RUN apt-get update &&\
    apt install --only-upgrade linux-libc-dev &&\
    apt-get install -y iproute2 vim netcat-openbsd wget curl &&\
    chmod 777 /home/choreouser/*  &&\
    addgroup --gid 10008 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10008 --ingroup choreo choreouser  &&\
    usermod -aG sudo choreouser
    
ENTRYPOINT [ "/home/choreouser/deploy.sh" ]

USER 10008
