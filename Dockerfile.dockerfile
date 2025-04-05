FROM golang:latest AS builder
WORKDIR /go_app
COPY main.go .
RUN go build -o adham main.go


FROM alpine
WORKDIR /alpine
COPY --from=builder /go_app/adham .
CMD ["./adham"]

