FROM alpine:latest
ARG VENDURE_SERVER_HOST
RUN apk add --no-cache nodejs npm
RUN apk add --no-cache git
RUN git clone https://github.com/vendure-ecommerce/storefront-angular-starter.git vendure-storefront-angular
COPY environment.ts vendure-storefront-angular/src/environments/environment.ts
COPY .graphqlconfig vendure-storefront-angular/.graphqlconfig
WORKDIR vendure-storefront-angular
ENV API_HOST=http://$VENDURE_SERVER_HOST
ENV API_URL="http:\/\/$VENDURE_SERVER_HOST:3010\/shop-api"
RUN sed -i 's/API_URL/'"$API_URL"'/g' .graphqlconfig
RUN npm install --legacy-peer-deps
EXPOSE 4201
ENTRYPOINT [ "npm", "start" ]