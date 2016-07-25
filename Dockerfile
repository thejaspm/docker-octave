FROM ubuntu:14.04
MAINTAINER Thejas "thejas.p.murthy@gmail.com"
RUN DEBIAN_FRONTEND=noninteractive

# install octave 3.8.0
RUN apt-get update && apt-get install -y octave less
RUN apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get install -y x11vnc xvfb
RUN mkdir ~/.vnc
RUN x11vnc -storepasswd Xqs34jTp184 ~/.vnc/passwd
RUN x11vnc -forever -usepw -create

# prepare dir
RUN mkdir /data
EXPOSE 5900
VOLUME ["/data"]
WORKDIR /data

CMD ["x11vnc", "-forever", "-usepw", "-create"]
