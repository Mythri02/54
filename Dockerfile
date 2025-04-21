FROM node:14-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

WORKDIR /home/app

COPY ./app /home/app

RUN npm install

EXPOSE 3000

CMD ["node", "server.js"]
