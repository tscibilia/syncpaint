FROM lsiobase/ubuntu:bionic

LABEL maintainer.name="Thomas Scibilia"
LABEL description="A web app for synchronized group drawing"

RUN \
 apt-get update && \
 apt-get install -y \
	git \
	nodejs \
    build-essential \
    npm && \
 echo "**** install syncpaint ****" && \
 mkdir -p \
	/opt/syncpaint && \
 git clone https://github.com/pkrasicki/SyncPaint.git /opt/syncpaint && \
 cd /opt/syncpaint && \
 node app.js && \
 echo "**** clean up ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000
