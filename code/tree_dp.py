import estimator

def train_tree_dp(X, y, budget):
  X = X.todense()
  num_idx = [0, 9, 16]
  cat_idx = [1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15]
  model = estimator.DPGBDT(
      privacy_budget=budget,
      nb_trees=50,
      nb_trees_per_ensemble=50,
      max_depth=6,
      learning_rate=0.1,
      gradient_filtering=True,
      leaf_clipping=True,
      num_idx=num_idx,
      cat_idx=cat_idx,
      verbosity=0)  # type: ignore
  model.fit(X, y)
  return model