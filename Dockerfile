FROM golang:1.16-alpine as build
WORKDIR /go/src/github.com/edudiasg/go-mini/
COPY app.go .
RUN go mod init 
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o app .

FROM scratch
COPY --from=build /go/src/github.com/edudiasg/go-mini/app .

CMD ["./app"]  