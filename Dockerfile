FROM golang:1.12-alpine AS build

#Get the echo package from a GitHub repository
RUN go get github.com/labstack/echo

COPY main.go main_test.go /algo_q_server/
WORKDIR /algo_q_server

#Build the project
RUN go build main.go main_test.go　
RUN ./main_test
RUN rm main_test

ENTRYPOINT ["/algo_q_server"]
