ARG NODEJS_VERSION

FROM node:${NODEJS_VERSION}

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
WORKDIR /usr/local/src/s3fs

COPY package.json .
RUN npm install
COPY . .

CMD ["npm", "run", "test"]
