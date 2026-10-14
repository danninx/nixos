HOST?=$(shell hostname)
HOSTPATH := '.\#$(HOST)'
NH := nh

.PHONY: rebuild build format

rebuild:
	$(NH) os switch --ask . -H $(HOST)

build:
	$(NH) os build . -H $(HOST)

format:
	nix fmt .
