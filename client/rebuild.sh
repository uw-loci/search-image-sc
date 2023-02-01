#!/bin/sh

# Builds assets/js/search.js app from client/src.
# Requires node.js to be installed.

root=$(cd "$(dirname "$0")/.." && pwd)

cd "$root/client"
rm -rf "$root/target"
cat "$root/clients" | while read client
do
  test "$client" || continue
  indexName=${client%%|*}
  apiKey=${client#*|}

  git checkout src/app.js &&
  sed -i -e "s/%TYPESENSE_SEARCH_ONLY_API_KEY%/$apiKey/" -e "s/%TYPESENSE_INDEX_NAME%/$indexName/" src/app.js &&
  rm -rf dist &&
  npm run-script build &&
  mkdir -p "$root/target/$indexName"
  cat dist/app*.js | sed 's;sourceMappingURL=/.*\.map;sourceMappingURL=/assets/js/search.js.map;' > "$root/target/$indexName/search.js" &&
  cat dist/app*.js.map | sed 's;"app\.[0-9a-f]\+\.js";"search.js";' > "$root/target/$indexName/search.js.map"
done
