FROM nodesource/node:4.0

MAINTAINER Sergio Gordillo "sgordillogallardo@gmail.com"

RUN apt-get update
RUN apt-get install -y libkrb5-dev

#copy code form distribution
COPY package.json package.json
COPY ./server /usr/src/app/server
COPY ./public /usr/src/app/public

RUN export NODE_ENV=production
RUN npm install
EXPOSE 8080

CMD ["node", "server/app.js"]
