nodep
===

nodep は、bash で Node.js の関数を
パイプ処理のように使用するためのコマンドです。

## dependency

Node.js
Bash

## Install

```bash
$ npm i -g @amanoese/nodep
```

## Usage

Node関数同士の接続は"|" ではなく "@"　になります。
例えば、下記のようにしてQueryStringをJSONに変換することができます。

```bash
$ echo -n 'a=b' | nodep "require('querystring').parse" @ JSON.stringify
{"a":"b"}
```

また、JSONのような文字列をパースすることに使用することができます。

```bash
$ echo -n '{a:1}' | sed 's/^/x=/' | nodep eval @ JSON.stringify
{"a":1}
```

## other

[パイプライン演算子](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Operators/Pipeline_operator)が実装された場合、
Node.jsのみでも下記のようにできるためこのコマンドは不要になるかもしれません。

```bash
$ echo -n 'a=b' | node -pe 'require("fs").readFileSync("/dev/stdin","UTF-8") |> require("querystring").parse" |> JSON.stringify'
```
