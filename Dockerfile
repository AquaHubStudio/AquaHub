FROM node:18.12-alpine3.15

COPY package.json yarn.lock ./
RUN rm -rf node_modules && yarn install --frozen-lockfile

COPY . /app
WORKDIR /app
RUN yarn run build

USER root

# RUN ["mv wait-for-server.sh ./"] \
#   && chmod +x /usr/bin/wait-for-server.sh
RUN mv wait-for-server.sh /usr/bin/wait-for-server.sh \
  && chmod +x /usr/bin/wait-for-server.sh

ENTRYPOINT ["/usr/bin/wait-for-server.sh"]
CMD ["node", "./build"]
