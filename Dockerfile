FROM golang:1.21-alpine as build

RUN mkdir -p go/src/hello
WORKDIR /go/src/hello

RUN go mod init hello
RUN echo 'package main; import "fmt"; func main() { fmt.Println("Full Cycle Rocks!!") }' > hello.go

RUN go build -o hello  

FROM scratch
COPY --from=build /go/src/hello/hello /hello

ENTRYPOINT [ "./hello" ]
