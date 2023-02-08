FROM alpine:latest
RUN apk add --no-cache nodejs npm
RUN apk add --no-cache bash
RUN apk add --no-cache git
RUN git clone https://github.com/vendure-ecommerce/storefront-remix-starter.git vendure-storefront-remix
RUN cd vendure-storefront-remix && npm install
COPY .env vendure-storefront-remix/.env
WORKDIR vendure-storefront-remix
EXPOSE 3000
ENTRYPOINT [ "npm", "run", "dev" ]