DART_VERSION = $(shell dart --version 2>&1 | sed  's/\(Dart VM version: .\).*/\1/g')
FORMAT = --check

define HELP_MESSAGE
Run make followed by any number of the following targets.
------------------------------------------------------------
lint - Check code for formatting and analyze code.
pub-get-lib - Pulls all dependencies from pubspec.yaml
gen-built-only - Generates built value types without formatting the output
endef
export HELP_MESSAGE

help:
	@echo "$$HELP_MESSAGE"

lint:
	dart pub get
	dart run dart_dev format
	dart run dart_dev analyze
	dart run dependency_validator

pub-get-lib:
	dart pub get

gen-built-only:
	dart run build_runner build lib --delete-conflicting-outputs
