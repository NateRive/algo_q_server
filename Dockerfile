FROM golang:1.12-alpine AS build

#Install git
#RUN apk add --no-cache git

#Get the package from a GitHub repository
#RUN go get github.com/golang/example/hello
#WORKDIR /go/src/github.com/golang/example/hello

# Build the project and send the output to /bin/HelloWorld
RUN go build hello.go
#-o /bin/algo_q_server

#FROM golang:1.12-alpine
#Copy the build's output binary from the previous build container
#COPY --from=build /bin/algo_q_server /bin/algo_q_server
#ENTRYPOINT ["/bin/algo_q_server"]
