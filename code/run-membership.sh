#!/usr/bin/env bash
cat ../results-sklearn/iwpc/tree_dp-errors.txt | while read line; do
  set $line
  echo "---------------------------------------------------------------    budget = $1"
  time python3 main.py iwpc tree_dp $1 --inc $2 $3 --one-error
  time python3 main.py iwpc tree_dp $1 --inc $2 $3
done
python3 summarize.py ../results-sklearn/iwpc/membership/unknown-test-error tree_dp
python3 summarize.py ../results-sklearn/iwpc/membership/known-test-error tree_dp