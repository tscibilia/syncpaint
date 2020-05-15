FROM node:lts-alpine3.11

LABEL description="A web app for synchronized group drawing"

RUN \
 apk update && apk upgrade && \
 apk add --no-cache bash git -y && \
 mkdir -p /app && \
 git clone https://github.com/pkrasicki/SyncPaint.git /app && \
 cd /app && \
 npm install && \
 npm run build-prod && \
 npm prune --production && \

# add local files
COPY . /app

WORKDIR /app

# ports and volumes
EXPOSE 3000

ENTRYPOINT ["node", "app.js"]
