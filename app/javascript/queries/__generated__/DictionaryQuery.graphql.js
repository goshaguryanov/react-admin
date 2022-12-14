/**
 * @generated SignedSource<<a3fb94924cbad148f1fc921bf06a454c>>
 * @lightSyntaxTransform
 * @nogrep
 */

/* eslint-disable */

'use strict';

var node = {
  "fragment": {
    "argumentDefinitions": [],
    "kind": "Fragment",
    "metadata": null,
    "name": "DictionaryQuery",
    "selections": [
      {
        "alias": null,
        "args": null,
        "concreteType": "Word",
        "kind": "LinkedField",
        "name": "dictionary",
        "plural": true,
        "selections": [
          {
            "args": null,
            "kind": "FragmentSpread",
            "name": "DictionaryComponent_word"
          }
        ],
        "storageKey": null
      }
    ],
    "type": "Root",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": [],
    "kind": "Operation",
    "name": "DictionaryQuery",
    "selections": [
      {
        "alias": null,
        "args": null,
        "concreteType": "Word",
        "kind": "LinkedField",
        "name": "dictionary",
        "plural": true,
        "selections": [
          {
            "alias": null,
            "args": null,
            "kind": "ScalarField",
            "name": "id",
            "storageKey": null
          },
          {
            "alias": null,
            "args": null,
            "concreteType": "WordDefinition",
            "kind": "LinkedField",
            "name": "definition",
            "plural": false,
            "selections": [
              {
                "alias": null,
                "args": null,
                "kind": "ScalarField",
                "name": "text",
                "storageKey": null
              },
              {
                "alias": null,
                "args": null,
                "kind": "ScalarField",
                "name": "image",
                "storageKey": null
              }
            ],
            "storageKey": null
          }
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "a9023e3ff45dac2faf5619d945837e7d",
    "id": null,
    "metadata": {},
    "name": "DictionaryQuery",
    "operationKind": "query",
    "text": "query DictionaryQuery {\n  dictionary {\n    ...DictionaryComponent_word\n  }\n}\n\nfragment DictionaryComponent_definition on WordDefinition {\n  text\n  image\n}\n\nfragment DictionaryComponent_word on Word {\n  id\n  definition {\n    ...DictionaryComponent_definition\n  }\n}\n"
  }
};

node.hash = "d9beb74c6f0fbd1ec717e281fd464586";

module.exports = node;
