#!/usr/bin/env sh
# Define words without leaving your terminal.
set -euo pipefail

# Find an API key here:
#     https://dictionaryapi.com
API_KEY='Put your API key here!'

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
