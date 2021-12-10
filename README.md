# define.sh

Define words without leaving your terminal.

A command-line dictionary, making use of the [Merriam-Webster Dictionary
API](https://dictionaryapi.com/) and [jq](https://stedolan.github.io/jq/).

# Usage

```
$ define.sh earth
the fragmental material composing part of the surface of the globe; especially : cultivable soil
the sphere of mortal life as distinguished from spheres of spirit life
areas of land as distinguished from sea and air
```

# Installation

1. Clone the repository.
   ```sh
   $ git clone 'https://github.com/glapa-grossklag/define.sh'
   $ cd ./define.sh
   ```
2. Register for an API key [here](https://dictionaryapi.com/) and set the `API_KEY` variable inside `define.sh`.
3. Install [jq](https://stedolan.github.io/jq/) using your package manager of choice.
4. Install `define.sh`:
   ```sh
   $ install ./define.sh /usr/bin/define.sh
   ```
