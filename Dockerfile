FROM golang:1.13-alpine

RUN apk update && apk add git protobuf build-base autoconf automake libtool curl make g++ unzip wget

RUN go get github.com/golang/protobuf/protoc-gen-go &&\
        go install github.com/golang/protobuf/protoc-gen-go && \
        wget https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protobuf-all-3.6.1.zip &&\
        unzip protobuf-all-3.6.1.zip &&\
        cd protobuf-3.6.1 && \
        ./configure && make && make check && make install

ENTRYPOINT ["protoc"]

