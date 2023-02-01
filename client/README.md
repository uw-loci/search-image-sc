# image-sc-typesense-instantsearch

This folder houses code to provide a search-as-you-type UI for search.image.sc
on the client side, such as from a website text field. Sites using it include:

* https://imagej.net/
* https://micro-manager.org/
* &lt;your Image.sc community partner site&gt; &rarr; file an issue to discuss!

_This project was generated with
[create-instantsearch-app](https://github.com/algolia/create-instantsearch-app)
then modified according to the [typesense instantsearch
tutorial](https://typesense.org/docs/0.19.0/guide/search-ui-components.html)._

## Get started

To run this project locally, install the dependencies and run the local server:

```sh
npm install
npm start
```

Alternatively, you may use [Yarn](https://http://yarnpkg.com/):

```sh
yarn
yarn start
```

Open http://localhost:3000 to see the demo app.

## Deploying to production

If you make changes to this search app, and want to deploy them to client,
sites, run `rebuild.sh` to regenerate `search.js` and `search.js.map`, then
copy them from `target` to their respective client site locations; e.g.:

* https://github.com/imagej/imagej.github.io/tree/main/assets/js
* https://github.com/micro-manager/micro-manager.github.io/tree/main/assets/js
