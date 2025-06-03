#!/bin/sh

# Updates the search indices served by search.image.sc via typesense.

TYPESENSE_API_KEY=$(cat /etc/typesense/typesense-server.ini | grep api-key | sed 's/.* = //')
TYPESENSE_CACHE_DIR="$HOME/.cache/typesense"

dir=$(cd "${0%/*}" && pwd)

pip install --break-system-packages --user -r "$dir/requirements.txt"

cat "$dir/../sources" | while read source
do
  test "$source" || continue
  collection=${source%%|*}
  rest=${source#*|}
  protocol=${rest%%|*}
  location=${rest#*|}

  # Pull latest documents from the source location.
  mkdir -p "$TYPESENSE_CACHE_DIR/$collection"
  cd "$TYPESENSE_CACHE_DIR/$collection"
  case "$protocol" in
    git)
      test -d .git || git clone "$location" .
      git pull
      ;;
    rsync)
      rsync -av "$location" .
      ;;
  esac

  # Reindex the documents.
  python3 "$dir/index-site.py" "$collection"
done
