FROM node:18

WORKDIR /app

COPY ./package.json ./
RUN yarn install
COPY . .
RUN yarn run build
RUN yarn run preview

EXPOSE 4173

ENTRYPOINT [ "wait-for-server.sh" ]
