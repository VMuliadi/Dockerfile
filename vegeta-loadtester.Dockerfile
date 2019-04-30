FROM accelbyte/golang-builder:1.12-alpine3.9
RUN apk add --no-cache go && \
	go get -u github.com/golang/dep/cmd/dep && \
	go get -u github.com/tsenart/vegeta && \
	cp /opt/go/bin/dep /usr/bin/dep && \
	cd $GOPATH/src/github.com/tsenart/vegeta && \
	make vegeta && \
	ls -lah $GOPATH/src/github.com/tsenart/vegeta && \
	cp $GOPATH/src/github.com/tsenart/vegeta/vegeta /usr/bin/vegeta
