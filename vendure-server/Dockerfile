FROM alpine:latest
COPY run-create.exp .
RUN apk add --no-cache nodejs npm yarn expect
RUN chmod +x run-create.exp
RUN ./run-create.exp
COPY vendure-config.ts vendure-server/src/
EXPOSE 3010
WORKDIR vendure-server
CMD [ "yarn", "dev" ]