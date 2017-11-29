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
