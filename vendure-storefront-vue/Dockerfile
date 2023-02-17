FROM alpine:latest
ARG VENDURE_SERVER_HOST
COPY run-create.exp .
RUN apk add --no-cache nodejs npm yarn expect
RUN chmod +x run-create.exp
RUN ./run-create.exp
WORKDIR vendure-storefront-vue
RUN yarn install
ENV GRAPHQL_API=http://$VENDURE_SERVER_HOST:3010/shop-api NODE_OPTIONS=--openssl-legacy-provider
EXPOSE 3001
ENTRYPOINT [ "yarn", "dev" ]