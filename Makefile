MKFILE_DIR := $(dir $(realpath $lastword $(MAKEFILE_LIST)))
SRC_DIR    := $(MKFILE_DIR)/src
SRC        := $(shell find $(SRC_DIR) -name *.go)
RELEASE    := ievctl

.PHONY: all
all: cross-build

build:
	@go build -o $(RELEASE) $(SRC)

cross-build:
	@go install github.com/mitchellh/gox@latest
	@cd $(SRC_DIR); gox -osarch "linux/amd64 linux/386 linux/arm" -output="$(MKFILE_DIR)/dist/$(RELEASE)_{{.OS}}_{{.Arch}}"

clean:
	@rm -f $(MKFILE_DIR)/$(RELEASE)
	@rm -fr $(MKFILE_DIR)/dist

format:
	@cd $(SRC_DIR); go fmt ./...
