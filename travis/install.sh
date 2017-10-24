#!/bin/bash
set -euC
set -o xtrace

glide install

function generate {
    go get -u github.com/jteeuwen/go-bindata/...
    go generate $(go list ./... | grep -v /vendor/)
}


case "$1" in
    "standard")
        generate
    ;;
    "linter")
        go get -u gopkg.in/alecthomas/gometalinter.v1 && gometalinter.v1 --install
    ;;
    "coverage")
        generate
    ;;
esac