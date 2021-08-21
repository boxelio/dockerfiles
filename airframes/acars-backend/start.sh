#!/bin/sh

cp /acars-backend/.env.sample /acars-backend/.env
sed --in-place=.bak -e "s/NATS_HOST=NATS_HOST/NATS_HOST=${NATS_HOST}/" /acars-backend/.env
sed --in-place=.bak -e "s/NATS_PORT=NATS_PORT/NATS_PORT=${NATS_PORT}/" /acars-backend/.env
sed --in-place=.bak -e "s/DATABASE_HOST=DATABASE_HOST/DATABASE_HOST=${DATABASE_HOST}/" /acars-backend/.env
sed --in-place=.bak -e "s/DATABASE_PORT=DATABASE_PORT/DATABASE_PORT=${DATABASE_PORT}/" /acars-backend/.env
sed --in-place=.bak -e "s/DATABASE_USER=DATABASE_USER/DATABASE_USER=${DATABASE_USER}/" /acars-backend/.env
sed --in-place=.bak -e "s/DATABASE_PASS=DATABASE_PASS/DATABASE_PASS=${DATABASE_PASS}/" /acars-backend/.env
sed --in-place=.bak -e "s/DATABASE_NAME=DATABASE_NAME/DATABASE_NAME=${DATABASE_NAME}/" /acars-backend/.env
sed --in-place=.bak -e "s/NODE_ENV=NODE_ENV/NODE_ENV=${NODE_ENV}/" /acars-backend/.env

cd /acars-backend
npm install -g @nestjs/cli
yarn install
yarn prebuild
yarn build
yarn run start:prod
