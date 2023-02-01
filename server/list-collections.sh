#!/bin/sh

# Retrieve the details of one or more collections, given their names.
# Or, if no arguments given, returns a summary of all your collections.
#
# https://typesense.org/docs/0.23.1/api/collections.html#retrieve-a-collection
# https://typesense.org/docs/0.23.1/api/collections.html#list-all-collections

. "${0%/*}/common.include"

if [ $# -eq 0 ]
then
  ts_get collections
fi

while [ $# -gt 0 ]
do
  ts_get "collections/$1"
  shift
done
