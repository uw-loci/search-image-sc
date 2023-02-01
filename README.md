# search.image.sc

This repository houses supporting code for the Image.sc search service at:

  https://search.image.sc:8081/

The server is built on [Typesense](https://typesense.org/).

Clients may vary, but the code in this repository uses
[InstantSearch.js](https://github.com/algolia/instantsearch.js) with the
[Typesense Instantsearch Adapter](https://github.com/typesense/typesense-instantsearch-adapter).

The `sources` file enumerates the different collections being indexed.

The `clients` file lists the search-only key for each collection.
