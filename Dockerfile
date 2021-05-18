# syntax=docker/dockerfile:1

FROM node:latest

RUN mkdir -p /usr/src/ranvier

WORKDIR /usr/src/ranvier

COPY package.json /usr/src/ranvier/

COPY package-lock.json /usr/src/ranvier/

RUN npm ci

RUN npm run init -y

COPY . /usr/src/ranvier

EXPOSE 4000

CMD exec node ranvier >> log/ranvier.log
