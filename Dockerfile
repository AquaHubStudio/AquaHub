FROM node:18

WORKDIR /app

COPY ./package.json ./
RUN yarn install
COPY . .

EXPOSE 5173

ENTRYPOINT [ "wait-for-server.sh" ]
CMD yarn run build && yarn run preview
