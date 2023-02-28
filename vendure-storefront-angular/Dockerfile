FROM alpine:latest
ARG VENDURE_SERVER_HOST
RUN apk add --no-cache nodejs npm
RUN apk add --no-cache git nano
RUN git clone https://github.com/vendure-ecommerce/storefront-angular-starter.git vendure-storefront-angular
WORKDIR vendure-storefront-angular
RUN npm install --legacy-peer-deps
EXPOSE 4201
ENTRYPOINT [ "npm", "start" ]