FROM alpine:3.6

ARG version

LABEL maintainer=oshalygin@gmail.com
LABEL version=$version
LABEL description="API Layer"

ENV PORT=8080
ENV CGO_ENABLED=0

COPY . /wwwroot
WORKDIR /wwwroot

RUN go build

ENTRYPOINT ["logan-api"]


# Test multi stage container
# https://docs.docker.com/engine/userguide/eng-image/multistage-build/#use-multi-stage-builds

# FROM golang:1.7.3
# WORKDIR /go/src/github.com/alexellis/href-counter/
# RUN go get -d -v golang.org/x/net/html  
# COPY app.go .
# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

# FROM alpine:latest  
# RUN apk --no-cache add ca-certificates
# WORKDIR /root/
# COPY --from=0 /go/src/github.com/alexellis/href-counter/app .
# CMD ["./app"]  