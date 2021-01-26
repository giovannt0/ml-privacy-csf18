#!/usr/bin/env bash
if [ $# != 1 ]; then
  echo "This script requires exactly one argument as the target string"
  exit 1
fi

target=$1

cat ../results-sklearn/iwpc/tree_dp-errors.txt | while read line; do
  set $line
  echo "---------------------------------------------------------------    budget = $1"
  time python3 main.py iwpc tree_dp $1 --red $2 $3 --target $target --one-error
done
python summarize.py ../results-sklearn/iwpc/reduction/$target/unknown-test-error tree_dp