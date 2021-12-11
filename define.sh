#!/usr/bin/env sh
# Define words without leaving your terminal.
set -u

# Find an API key here:
#     https://dictionaryapi.com
API_KEY='Put your API key here!'

red=$(tput setaf 1)
bold=$(tput bold)
reset=$(tput sgr0)

die() {
	printf "${red}error:${reset} $@\n" 1>&2
	exit 1
}

define() {
	# Encode the word so it can be used in a URL.
	word=$(printf %s "$1" | jq -sRr @uri)

	url="https://dictionaryapi.com/api/v3/references/collegiate/json/${word}?key=${API_KEY}"

	response=$(curl --silent "$url")

	if [ "$response" = "[]" ]; then
		die 'definition not found'
	elif [ -z "$response" ]; then
		die 'something went wrong'
	fi

	definition=$(echo "$response" | jq -r '.[0].shortdef | join("\n")' 2>/dev/null)

	if [ "$?" -eq 5 ]; then
		die 'definition not found'
	fi

	printf "${bold}${word}${reset}:\n"
	printf "${definition}\n"
}

for word in "$@"; do
	define "$word"
done
