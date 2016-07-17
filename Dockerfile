FROM ubuntu:14.04
MAINTAINER Thejas "thejas.p.murthy@gmail.com"
RUN DEBIAN_FRONTEND=noninteractive

# install octave 3.8.0
apt-get update && apt-get install -y octave less
apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
mkdir /data

VOLUME ["/data"]
WORKDIR /data
CMD ["octave"]
