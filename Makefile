VERSION := $(shell grep '^version:' pubspec.yaml | sed 's/version: //' | tr -d ' ')

build-web:
	git pull origin main --rebase
	/home/noc/flutter/bin/flutter build web --release --wasm --dart-define=API_BASE=https://smartlink.neotelecom.kg/api
	sudo rm -rf /var/www/smartlink
	sudo cp -a build/web /var/www/smartlink

build:
	ssh noc@192.168.2.112 'jq --arg v "$(VERSION)" ".smartlink_compatible_versions |= (. + [\$$v] | unique)" ~/smartlinkapi/platform.json > /tmp/platform.json && mv /tmp/platform.json ~/smartlinkapi/platform.json'
	ssh noc@192.168.2.112 'cd ~/smartlink && make build-web'

run:
	flutter run --dart-define=API_BASE=http://localhost:1100

.PHONY: build-web build run
