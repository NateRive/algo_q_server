FROM golang:1.12-alpine AS build

#Install git
RUN apk add --no-cache git

#Get the echo package from a GitHub repository
RUN go get github.com/labstack/echo

COPY main.go main_test.go /algo_q_server/
WORKDIR /algo_q_server

#Test
RUN go test

#Build the project
RUN go build main.go


FROM golang:1.12-alpine

#Copy the echo package from the previous build container
COPY --from=build /go/src/github.com/labstack/echo /go/src/github.com/labstack/echo

#Copy the build's output binary from the previous build container
COPY --from=build /algo_q_server/main /algo_q_server/main

ENTRYPOINT ["/algo_q_server"]
