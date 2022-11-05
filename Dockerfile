FROM golang:latest AS Build

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server

FROM scratch

COPY --from=Build /app/server /server

ENTRYPOINT [ "/server" ]