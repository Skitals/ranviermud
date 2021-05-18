# syntax=docker/dockerfile:1

FROM node:latest

RUN mkdir -p /usr/src/ranvier

WORKDIR /usr/src/ranvier

COPY package.json /usr/src/ranvier/

COPY package-lock.json /usr/src/ranvier/

COPY . /usr/src/ranvier

RUN npm ci

RUN yes | npm run init

EXPOSE 4000

CMD exec node ranvier >> log/ranvier.log
