FROM nodesource/node:4.0

MAINTAINER Sergio Gordillo "sgordillogallardo@gmail.com"

# Update aptitude with new repo
#RUN apt-get update

# Clone our private GitHub Repository
RUN git clone -b docker https://github.com/archelogos/sg.git
RUN cd sg

RUN npm install

RUN grunt build

RUN export NODE_ENV=production

EXPOSE 9000

CMD ["grunt", "serve:dist”]
