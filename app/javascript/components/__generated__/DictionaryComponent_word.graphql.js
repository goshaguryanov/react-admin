/**
 * @generated SignedSource<<ab13f2da52923b9b91140be339a8c4a4>>
 * @lightSyntaxTransform
 * @nogrep
 */

/* eslint-disable */

'use strict';

var node = {
  "argumentDefinitions": [],
  "kind": "Fragment",
  "metadata": null,
  "name": "DictionaryComponent_word",
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
          "args": null,
          "kind": "FragmentSpread",
          "name": "DictionaryComponent_definition"
        }
      ],
      "storageKey": null
    }
  ],
  "type": "Word",
  "abstractKey": null
};

node.hash = "9a87b51a5e8477da87b9f830fbae4bf6";

module.exports = node;
