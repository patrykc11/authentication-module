FROM node:19-alpine as development

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --only=development

COPY . .

CMD ["npm", "start"]

FROM node:19-alpine as production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --only=production --ignore-scripts

COPY . .

CMD ["npm", "start"]
