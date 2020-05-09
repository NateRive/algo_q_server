FROM golang:1.12-alpine AS build

#Install git
RUN apk add --no-cache git

#Get the echo and assert package from a GitHub repository
RUN go get github.com/labstack/echo
RUN go get github.com/stretchr/testify/assert

COPY main.go main_test.go /algo_q_server/
WORKDIR /algo_q_server

#Test
#RUN CGO_ENABLED=1 go test

#Build the project
RUN go build main.go
#RUN go run main.go


FROM golang:1.12-alpine

#Copy the echo and assert package from the previous build container
#COPY -r --from=build go/src/github.com/labstack/echo /go/src/github.com/labstack/echo
#COPY -r --from=build go/src/github.com/stretchr/testify/assert /go/src/github.com/stretchr/testify/assert

#Copy the build's output binary from the previous build container
COPY --from=build /algo_q_server/main /algo_q_server/main
WORKDIR /algo_q_server
RUN ./main

ENTRYPOINT ["/algo_q_server"]
