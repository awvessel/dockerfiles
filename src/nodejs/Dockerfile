FROM aweber/ubuntu
MAINTAINER gavinr@aweber.com

RUN add-apt-repository ppa:chris-lea/node.js && \
    apt-get update && \
    apt-get install -y -qq g++ make nodejs && \
    apt-get clean
