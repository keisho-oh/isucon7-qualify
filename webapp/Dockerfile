FROM golang:1.9

WORKDIR /home/isucon/isubata/webapp
COPY . .

RUN go get -u github.com/golang/dep/cmd/dep

WORKDIR /home/isucon/isubata/webapp/go/src/isubata
ENV GOPATH=/home/isucon/isubata/webapp/go/
RUN dep ensure

WORKDIR /home/isucon/isubata/webapp/go
RUN make

EXPOSE 5000

ENTRYPOINT ["/home/isucon/isubata/webapp/go/isubata"]
