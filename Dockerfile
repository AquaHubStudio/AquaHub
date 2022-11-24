FROM node:18.12-alpine3.15

WORKDIR /

COPY package.json yarn.lock ./
RUN rm -rf node_modules && yarn install --frozen-lockfile

COPY . .
RUN yarn run build

USER root

RUN mv wait-for-server.sh /wait-for-server.sh \
  && chmod +x /wait-for-server.sh
RUN mv db_schema.json /db_schema.json

ENTRYPOINT ["/wait-for-server.sh"]
CMD ["node", "./build"]
