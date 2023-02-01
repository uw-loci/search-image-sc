#!/bin/sh

# Retrieve metadata about one or more keys, given their names.
# Or, if no arguments given, retrieves metadata about all keys.
#
# https://typesense.org/docs/0.23.1/api/api-keys.html#retrieve-an-api-key
# https://typesense.org/docs/0.23.1/api/api-keys.html#list-all-keys

. "${0%/*}/common.include"

if [ $# -eq 0 ]
then
  ts_get keys
fi

while [ $# -gt 0 ]
do
  ts_get "keys/$1"
  shift
done
