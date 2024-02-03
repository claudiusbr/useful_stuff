#!/bin/bash
# this command will display a random fact from the Wikipedia Did You Know? page
# TODO: add a check to see if jq, curl and sed are installed
# TODO: add logic in case it doesn't return anything
printf '\nDid You Know? ...\n' && \
  curl -s https://en.wikipedia.org/w/api.php\?action\=query\&prop\=extracts\&titles\=Template%3aDid_you_know\&format\=json\&explaintext | \
  jq '.query.pages | to_entries[] | .value.extract' | \
  sed 's/"\\n== Next update ==\\n\\n\\n== Hooks ==\\n\\n//g' | \
  sed 's/\\n/\
/g' && echo
