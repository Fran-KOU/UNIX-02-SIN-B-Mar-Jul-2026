#!/usr/bin/env bash

set -x

touch test && touch test123

(ls;ps)

ls; ps; whoami

lzl || echo "el comando lzl falló"

set +x