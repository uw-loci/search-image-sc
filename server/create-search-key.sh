#!/bin/sh

# Creates a search-only key for the given collection.
#
# https://typesense.org/docs/0.23.1/api/api-keys.html#create-an-api-key

. "${0%/*}/common.include"

collection=$1

test "$collection" || {
  echo "Please specify the collection name."
  exit 1
}

echo "$collection" | grep -q "[^a-zA-Z0-9\._-]" && {
  echo "Collection name must contain only letters, numbers, dots, dashes, and/or underscores."
  exit 2
}

ts_post keys '{"description":"Search-only '"$collection"' key.","actions": ["documents:search"], "collections": ['"$collection"'"]}'
