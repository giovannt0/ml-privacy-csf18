#!/usr/bin/env bash
for budget in 0. 0.1 0.2 0.4 0.6 0.8 1.0 1.5 2.0 4.0 10.0; do
  time python3 main.py iwpc tree_dp $budget
done