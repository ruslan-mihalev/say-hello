FROM node:20.9-alpine

WORKDIR /usr/src/app

ENV NODE_ENV=production

COPY package*.json ./

#RUN npm install

#RUN npm ci --only=production

RUN --mount=type=cache,target=/usr/src/app/.npm \
    npm set cache /usr/src/app/.npm && \
    npm ci --only=production

USER node

COPY --chown=node:node . .

#CMD ["npm", "run", "dev"]

EXPOSE 3000

CMD ["node", ".output/server/index.mjs"]