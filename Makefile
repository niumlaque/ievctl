MKFILE_DIR := $(dir $(realpath $lastword $(MAKEFILE_LIST)))
SRC_DIR    := $(MKFILE_DIR)/src
SRC        := $(shell find $(SRC_DIR) -name *.go)
RELEASE    := ievctl

.PHONY: all
all: cross-build

get: $(SRC)
	@cd $(SRC_DIR); go get -d -v ./...

release: get
	@go get github.com/pwaller/goupx
	@cd $(SRC_DIR); go build -ldflags "-s -w" -v -o $(MKFILE_DIR)/$(RELEASE) .
	@${GOBIN}/goupx $(RELEASE)

cross-build: get
	@go get github.com/mitchellh/gox
	@cd $(SRC_DIR); $(GOBIN)/gox -osarch "linux/amd64 linux/386 linux/arm" -output="$(MKFILE_DIR)/dist/$(RELEASE)_{{.OS}}_{{.Arch}}"

clean:
	@rm -f $(MKFILE_DIR)/$(RELEASE)
	@rm -fr $(MKFILE_DIR)/dist

check:
	@go get github.com/golang/lint/golint
	@cd $(SRC_DIR); ${GOBIN}/golint ./...

format:
	@cd $(SRC_DIR); go fmt ./...
