FROM golang:1.12-alpine AS build

#Install git
RUN apk add --no-cache git

#Get the echo and assert package from a GitHub repository
RUN go get github.com/labstack/echo
RUN go get github.com/stretchr/testify/assert

COPY main.go main_test.go /algo_q_server/
#RUN pwd
WORKDIR /algo_q_server
#RUN pwd
#RUN ls

#Test
RUN CGO_ENABLED=0 go test

#Build the project
RUN go build main.go



FROM golang:1.12-alpine

#Copy the build's output binary from the previous build container
COPY --from=build /algo_q_server/main /algo_q_server/main

WORKDIR /

EXPOSE 1323

ENTRYPOINT ./algo_q_server/main
