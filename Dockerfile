FROM node:18.12-alpine3.15

WORKDIR /app

COPY ./package.json ./
RUN rm -rf node_modules && yarn install --frozen-lockfile
COPY . .
RUN echo "Build started"
RUN yarn run build
RUN echo "Build finished, next steps following.."

FROM node:18.12-alpine3.15 as app

WORKDIR /app

COPY --from=0 /app/node_modules ./node_modules
COPY --from=0 /app/.svelte-kit/build ./build
COPY --from=0 /app/svelte.config.js .
COPY --from=0 /app/vite.config.ts .
COPY --from=0 /app/package.json ./

# Change line endings to LF
RUN sed -i 's/\r$//' ./wait-for-server.sh \
    && chmod +x ./wait-for-server.sh

ENTRYPOINT ./wait-for-server.sh
CMD ["node", "./build"]
