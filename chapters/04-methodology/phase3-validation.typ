// Section: Phase 3 - Supervised Validation

== Phase 3: Supervised Validation

Supervised learning models were used solely to validate the discriminative capacity of the discovered resistance patterns. This phase implements leakage-safe train–test splitting, macro-averaged evaluation metrics, confusion matrix analysis, feature importance extraction, and cross-seed stability checks.

=== Classification Tasks

Two supervised classification tasks were designed to assess whether resistance patterns align with known biological categories:

#figure(
  table(
    columns: 3,
    table.header[*Task*][*Target Variable*][*Purpose*],
    [Species Discrimination], [Bacterial species], [Assess if resistance fingerprints distinguish species],
    [MDR Classification], [MDR status (0/1)], [Validate resistance-MDR relationship],
  ),
  caption: [Supervised Classification Tasks],
) <tab:supervised-classification-tasks>

=== Leakage-Safe Data Splitting

To prevent information leakage between training and evaluation phases, the dataset was first partitioned into *training (80%) and test (20%) subsets* using stratified sampling to preserve class distributions. *Train–test splitting was performed prior to any preprocessing operations*, including missing value imputation and feature scaling.

All preprocessing steps were fitted *exclusively on the training data*, and the learned parameters were subsequently applied unchanged to both the training and test sets. This ensured that statistical properties of the test data did not influence model training, thereby preventing optimistic bias in supervised evaluation metrics.

=== Model Selection

Three classifier families were selected to represent different learning paradigms:

#figure(
  table(
    columns: 3,
    table.header[*Model*][*Category*][*Rationale*],
    [Logistic Regression], [Linear], [Baseline; interpretable coefficients],
    [Random Forest], [Tree-based], [Nonlinear; feature importance via Gini impurity],
    [k-Nearest Neighbors], [Distance-based], [Instance-based; consistency check against clustering],
  ),
  caption: [Supervised Model Selection],
) <tab:supervised-model-selection>

*Hyperparameter Configuration:*

#figure(
  table(
    columns: 2,
    table.header[*Model*][*Parameters*],
    [Logistic Regression], [`max_iter=1000`, `solver='lbfgs'`],
    [Random Forest], [`n_estimators=100`, `random_state=42`],
    [k-Nearest Neighbors], [`n_neighbors=5`],
  ),
  caption: [Model Hyperparameters],
) <tab:model-hyperparameters>

=== Evaluation Metrics

Performance was quantified using macro-averaged metrics to prevent class imbalance bias:

==== Macro-Averaged Precision, Recall, F1

$
  "Precision"_"macro" = 1 / (|C|) sum_(c in C) ("TP"_c) / ("TP"_c + "FP"_c)
$

$
  "Recall"_"macro" = 1 / (|C|) sum_(c in C) ("TP"_c) / ("TP"_c + "FN"_c)
$

$
  F_1 = (2 times "Precision" times "Recall") / ("Precision" + "Recall")
$

where $C$ is the set of classes and $"TP"$, $"FP"$, $"FN"$ are true positives, false positives, and false negatives respectively.

==== Accuracy

Overall classification correctness was measured as:

$
  "Accuracy" = ("TP" + "TN") / ("TP" + "TN" + "FP" + "FN")
$

==== Confusion Matrix

Per-class classification performance was visualized using confusion matrices to identify species-specific misclassification patterns.

=== Feature Importance Extraction

For Random Forest models, feature importance was extracted using Gini impurity:

$
  "Importance"(f) = sum_(t in T) Delta G_t dot bb(1)[f_t = f]
$

where $Delta G_t$ is the decrease in Gini impurity at node $t$ when feature $f$ is used for splitting.

*Language Discipline:* Feature importance reflects _associative_ relationships within the dataset. High importance indicates statistical association, not causal influence on resistance phenotype.

=== Stability Across Random Seeds

Model stability was validated across multiple random states to ensure that model performance was not dependent on a specific random initialization:

*Cross-Seed Stability Check Algorithm*

*Input:* Dataset D, Model M, Seeds S = {42, 123, 456, 789, 1011}

*Output:* Stability metrics (mean, standard deviation)

For each seed s in S:

1. Set random state to s
2. Split D into train/test (80/20, stratified)
3. Train model M on training set
4. Evaluate on test set
5. Record performance metrics

Return: mean(metrics), std(metrics)

Low standard deviation across seeds indicates robust model performance.

=== Sensitivity Analysis: Split Ratio and Cross-Validation

To justify the train–test split configuration, a sensitivity analysis was conducted comparing different partitioning strategies. Three split ratios (70/30, 80/20, 90/10) and two cross-validation schemes (5-fold, 10-fold) were evaluated across all three classifier models.

==== Split Ratio Comparison

#figure(
  table(
    columns: 5,
    table.header[*Split*][*Model*][*F1 Score*][*Accuracy*][*Stability (std)*],
    [70/30], [Logistic Regression], [0.923 ± 0.026], [0.965], [0.026],
    [70/30], [Random Forest], [0.944 ± 0.016], [0.974], [0.016],
    [70/30], [KNN], [0.917 ± 0.034], [0.964], [0.034],
    [80/20], [Logistic Regression], [0.952 ± 0.031], [0.978], [0.031],
    [80/20], [Random Forest], [0.973 ± 0.022], [0.988], [0.022],
    [80/20], [KNN], [0.956 ± 0.028], [0.980], [0.028],
    [90/10], [Logistic Regression], [0.983 ± 0.020], [0.992], [0.021],
    [90/10], [Random Forest], [0.991 ± 0.018], [0.996], [0.018],
    [90/10], [KNN], [0.958 ± 0.026], [0.980], [0.026],
  ),
  caption: [F1 Scores Across Different Train–Test Split Ratios (MDR Classification)],
) <tab:split-ratio-comparison>

==== Cross-Validation Comparison

#figure(
  table(
    columns: 5,
    table.header[*CV Folds*][*Model*][*F1 Score*][*Accuracy*][*Stability (std)*],
    [5-fold], [Logistic Regression], [0.953 ± 0.009], [0.978], [0.009],
    [5-fold], [Random Forest], [0.947 ± 0.025], [0.976], [0.025],
    [5-fold], [KNN], [0.933 ± 0.038], [0.970], [0.038],
    [10-fold], [Logistic Regression], [0.932 ± 0.045], [0.970], [0.045],
    [10-fold], [Random Forest], [0.955 ± 0.035], [0.980], [0.035],
    [10-fold], [KNN], [0.952 ± 0.037], [0.978], [0.037],
  ),
  caption: [F1 Scores Across Different Cross-Validation Configurations],
) <tab:cv-comparison>

==== Sensitivity Analysis Interpretation

The sensitivity analysis revealed the following key insights:

1. *Consistent high performance*: All split configurations achieved F1 scores above 0.91, indicating that supervised validation results are robust to partitioning choices.

2. *Acceptable stability*: Standard deviations ranged from 0.009 to 0.045, all within acceptable bounds (< 0.05), confirming that results are not artifacts of random initialization.

3. *80/20 split justification*: While 90/10 achieved marginally higher scores, the smaller test set (≈49 samples) reduces statistical reliability of performance estimates. The 80/20 split balances training data adequacy with reliable test evaluation.

4. *5-fold CV preference*: 5-fold cross-validation produced more stable results (lower standard deviation) compared to 10-fold, particularly for Logistic Regression (0.009 vs 0.045).

These findings support the use of the *80/20 train–test split with 5-fold cross-validation* as the standard configuration for supervised validation in this study.

=== Phase 3 Output Summary

The output of this phase consists of:

- Classification performance metrics for each model and task
- Confusion matrices for per-class analysis
- Feature importance rankings from Random Forest
- Cross-seed stability statistics
- Sensitivity analysis results across split configurations

