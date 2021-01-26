import estimator

def train_tree_dp(X, y, budget):
  X = X.todense()
  num_idx = []
  cat_idx = list(range(X.shape[1]))
  model = estimator.DPGBDT(
      privacy_budget=budget,
      nb_trees=1,
      nb_trees_per_ensemble=1,
      max_depth=15,
      learning_rate=0.5,
      gradient_filtering=True,
      leaf_clipping=True,
      num_idx=num_idx,
      cat_idx=cat_idx,
      verbosity=0)  # type: ignore
  model.fit(X, y)
  return model