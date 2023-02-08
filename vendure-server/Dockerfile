FROM alpine:latest
COPY run-create.sh .
RUN apk add --no-cache nodejs npm yarn
RUN apk add --no-cache bash
RUN chmod +x run-create.sh
EXPOSE 3000
CMD [ "./run-create.sh" ]