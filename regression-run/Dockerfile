ARG NODEJS_VERSION
FROM node:${NODEJS_VERSION}


#ENV YARN_CACHE_FOLDER=/usr/local/yarn-cache
#VOLUME /usr/local/yarn-cache
WORKDIR /usr/local/app
COPY package.json .
RUN npm install

COPY . .

CMD ["npm", "run", "test"]
