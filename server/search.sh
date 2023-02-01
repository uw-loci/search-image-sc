#!/bin/sh

# Search for a particular query string from the CLI. Useful for testing.
#
# https://typesense.org/docs/0.23.1/api/search.html#search-parameters

. "${0%/*}/common.include"

collection=$1
query=$2

test "$collection" -a "$query" || {
  echo "Usage: search.sh collection query"
  exit 1
}

ts_get "collections/$collection/documents/search?q=$query&query_by=title"
