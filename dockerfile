FROM golang:1.14 AS Builder
WORKDIR /go/src/app
COPY . /app
RUN CGO_ENABLED=0 GOOS=linux echo "hello" -o app .

FROM alpine:latest
WORKDIR /app
COPY --from=Builder /go/src/app /app
CMD ["/app","base"]
