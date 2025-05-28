FROM golang:1.23-alpine
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN apk add --no-cache gcc musl-dev
RUN go get wuzapi
RUN go build -o server .
VOLUME [ "/app/dbdata", "/app/files" ]
ENTRYPOINT [ "/app/server" ]
CMD [ "-logtype", "console" ]
