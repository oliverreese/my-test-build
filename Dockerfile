FROM node:12

ARG NPM_TOKEN

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

COPY .npmrc ./.npmrc

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

#RUN rm -f .npmrc

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]
