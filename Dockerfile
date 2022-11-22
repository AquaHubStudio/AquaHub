FROM node:18.12-alpine3.15

WORKDIR /app

COPY package.json yarn.lock ./
RUN rm -rf node_modules && yarn install --frozen-lockfile
COPY . .
RUN yarn run build

# Change line endings to LF
# RUN ["sed -i 's/\r$//' wait-for-backend.sh && chmod +x wait-for-backend.sh"]

# ENTRYPOINT wait-for-backend.sh
CMD ["node", "./build"]
