FROM accelbyte/golang-builder:1.12-alpine3.9
RUN apk add --no-cache go curl jq && \
  go get -u github.com/golang/dep/cmd/dep && \
  go get -u github.com/mailru/easyjson/... && \
  go get -u github.com/tsenart/vegeta && \  
  cp /opt/go/bin/dep /usr/bin/dep && \
  cd $GOPATH/src/github.com/tsenart/vegeta && \
  make vegeta && \
  ls -lah $GOPATH/src/github.com/tsenart/vegeta && \
  cp $GOPATH/src/github.com/tsenart/vegeta/vegeta /usr/bin/vegeta && \
  curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin/kubectl

