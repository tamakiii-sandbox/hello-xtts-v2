.PHONY: help check-dependency setup activate teardown

SHELL = bash --noprofile --norc -eo pipefail

help:
	@cat $(firstword $(MAKEFILE_LIST))

check-dependency:
	which uv

setup: \
	.venv

activate:
	source .venv/bin/activate && exec $$SHELL --login

teardown:
	rm -rf .venv

.venv:
	uv venv
