#!/usr/bin/env bash
if [ $# != 1 ]; then
  echo "This script requires exactly one argument as the target string"
  exit 1
fi

target=$1

cat ../results-sklearn/synthetic_B/tree_dp-errors.txt | while read line; do
  set $line
  echo "---------------------------------------------------------------    budget = $1"
  time python main.py synthetic_B tree_dp $1 --inv $2 $3 --target $target --one-error
done
python summarize.py ../results-sklearn/synthetic_B/attribute/$target/unknown-test-error tree_dp