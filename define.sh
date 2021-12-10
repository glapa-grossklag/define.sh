#!/usr/bin/env bash
# Define words without leaving your terminal.
set -euo pipefail

source config.sh

define() {
	word="$1"
	curl \
		--silent \
		--show-error \
		"https://dictionaryapi.com/api/v3/references/collegiate/json/${1}?key=${API_KEY}" \
	| jq \
		--raw-output \
		'.[0].shortdef | join("\n")'
}

for word in "$@"; do
	define "$word"
done
