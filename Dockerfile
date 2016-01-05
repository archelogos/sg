FROM nodesource/node:4.0

MAINTAINER Sergio Gordillo "sgordillogallardo@gmail.com"

#copy code
COPY package.json package.json
COPY ./server /server
COPY ./public /public

RUN export NODE_ENV=production

EXPOSE 8080

CMD ["node", "server/app.js"]
