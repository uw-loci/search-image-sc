#!/bin/env python

import logging, os, sys
import jekyll, ijsite, tsutil


logger = logging.getLogger('indexer')


def load_site(siteroot):
    logger.info('Loading documents...')
    documents = []
    if jekyll.is_jekyll_site(siteroot):
        documents = jekyll.load_jekyll_site(siteroot)
    # TODO: Generalize to any website with HTML documents.
    elif ijsite.is_imagej_website(siteroot):
        documents = ijsite.load_site(siteroot)
    logger.info(f'{len(documents)} documents loaded.')
    return documents


def index_documents(collection, documents):
    client = tsutil.connect()
    if client is None:
        logger.info('No typesense credentials available.')
        return
    logger.info('Connected to typesense.')
    created = tsutil.create(client, collection, documents, force=True)
    logger.info('Created new collection.' if created else 'Updating existing collection.')
    logger.info(f'Indexing {len(documents)} documents...')
    tsutil.update_index(client, collection, documents)
    logger.info('Done!')


def main(args):
    logging.basicConfig(level=logging.INFO, format='[%(levelname)s] %(message)s')
    logging.root.setLevel(logging.INFO)

    if len(args) != 2:
        print('Usage: index-site.py <collection-name>')
        sys.exit(1)

    collection = args[1]
    documents = load_site(".")
    index_documents(collection, documents)


if __name__ == '__main__':
    main(sys.argv)
