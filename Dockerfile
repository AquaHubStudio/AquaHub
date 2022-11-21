FROM node:18.12-alpine3.15

WORKDIR /app

COPY ./package.json ./
RUN yarn install
COPY . .
RUN yarn run build

FROM node:18.12-alpine3.15 as app

WORKDIR /app

COPY --from=0 /app/node_modules ./node_modules
COPY --from=0 /app/build ./build
COPY --from=0 /app/svelte.config.js .
COPY --from=0 /app/vite.config.ts .
COPY --from=0 /app/package.json ./

ENTRYPOINT [ "sh ./wait-for-server.sh" ]
CMD ["node", "./build"]
