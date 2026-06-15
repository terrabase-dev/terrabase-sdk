.PHONY: generate
generate:
	buf generate
	buf build -o docs/descriptor.bin
