#!/bin/sh

# Permanently drops a collection. 
#
# https://typesense.org/docs/0.23.1/api/collections.html#drop-a-collection

. "${0%/*}/common.include"

ts_get collections
