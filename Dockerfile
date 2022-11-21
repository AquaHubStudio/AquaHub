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
COPY --from=0 /app/wait-for-backend.sh ./

# Change line endings to LF
RUN ["sed -i 's/\r$//' $app/wait-for-backend.sh && chmod +x $app/wait-for-backend.sh"]

ENTRYPOINT ./wait-for-backend.sh
CMD ["node", "./build"]
