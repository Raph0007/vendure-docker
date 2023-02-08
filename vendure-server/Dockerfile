FROM alpine:latest
COPY run-create.sh .
COPY vendure-config.ts .
RUN apk add --no-cache nodejs npm yarn
RUN apk add --no-cache bash
RUN chmod +x run-create.sh
EXPOSE 3001
CMD [ "./run-create.sh" ]