HOST?=$(shell hostname)
HOSTPATH := '.\#$(HOST)'

rebuild:
	sudo nixos-rebuild switch --flake $(HOSTPATH)

format:
	nix fmt .
