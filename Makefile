GO=go
GO_FILES=$(shell find . -name *.go)
BINARIES=rootlesskit rootlessctl

.PHONY: all
all: $(addprefix bin/, $(BINARIES))

.PHONY: clean
clean:
	$(RM) -r bin/

bin/rootlesskit: $(GO_FILES)
	$(GO) build -o $@ -v github.com/rootless-containers/rootlesskit/cmd/rootlesskit

bin/rootlessctl: $(GO_FILES)
	$(GO) build -o $@ -v github.com/rootless-containers/rootlesskit/cmd/rootlessctl

.PHONY: test
test:
	./hack/test.sh
