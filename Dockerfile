FROM golang:1.12-alpine AS build

#Install git
RUN apk add --no-cache git
