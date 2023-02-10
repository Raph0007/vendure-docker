FROM alpine:latest
ARG VENDURE_SERVER_HOST
RUN apk add --no-cache nodejs npm
RUN apk add --no-cache git
RUN git clone https://github.com/vendure-ecommerce/storefront-remix-starter.git vendure-storefront-remix
RUN cd vendure-storefront-remix && npm install
ENV VENDURE_API_URL=http://$VENDURE_SERVER_HOST:3001/shop-api
COPY .env vendure-storefront-remix/.env
WORKDIR vendure-storefront-remix
EXPOSE 3000 8002
ENTRYPOINT [ "npm", "run", "dev" ]