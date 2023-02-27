FROM alpine:latest
ARG VENDURE_SERVER_HOST
COPY run-build-dev.sh .
RUN apk add --no-cache nodejs npm
RUN apk add --no-cache git
RUN npm install -g pnpm
RUN git clone https://github.com/vercel/commerce vendure-storefront-nextjs
COPY .env.local vendure-storefront-nextjs/site/.env.local
COPY next.config.js vendure-storefront-nextjs/site/next.config.js
WORKDIR vendure-storefront-nextjs
RUN pnpm install
ENV VENDURE_SERVER_HOST=$VENDURE_SERVER_HOST
ENV SHOP_API_URL=http://$VENDURE_SERVER_HOST:3010/shop-api
EXPOSE 3000
ENTRYPOINT [ "../run-build-dev.sh" ]