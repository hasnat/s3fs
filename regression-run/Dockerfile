FROM node:16.3.0


ENV YARN_CACHE_FOLDER=/usr/local/yarn-cache
VOLUME /usr/local/yarn-cache
WORKDIR /usr/local/app
COPY package.json .
RUN yarn install

COPY . .

CMD ["npm", "run", "test"]
