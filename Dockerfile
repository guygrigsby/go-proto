FROM golang:1.12.9

RUN apt-get update && apt-get install -y git protobuf-compiler build-essential autoconf automake libtool curl make g++ unzip wget

RUN go get github.com/golang/protobuf/protoc-gen-go &&\
        go install github.com/golang/protobuf/protoc-gen-go &&\
        wget https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protobuf-all-3.6.1.zip &&\
        unzip protobuf-all-3.6.1.zip &&\
        cd protobuf-3.6.1 && \
        ./configure && make && make check && make install && ldconfig
