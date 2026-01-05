// Section: Phase 3 - Supervised Validation

== Phase 3: Supervised Validation

Supervised learning models were used solely to validate the discriminative capacity of the discovered resistance patterns. This phase implements leakage-safe train–test splitting, macro-averaged evaluation metrics, confusion matrix analysis, feature importance extraction, and cross-seed stability checks.

=== Classification Task

Supervised classification was designed to validate the unsupervised clustering results by assessing whether the discovered clusters represent discriminable resistance phenotypes:

#figure(
  table(
    columns: 3,
    table.header[*Task*][*Target Variable*][*Purpose*],
    [Cluster Discrimination], [Cluster assignment], [Validate that clusters represent discriminable phenotypes],
  ),
  caption: [Supervised Classification Task],
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
    [70/30], [Logistic Regression], [0.984 ± 0.006], [0.985], [0.006],
    [70/30], [Random Forest], [0.984 ± 0.014], [0.993], [0.014],
    [70/30], [KNN], [0.979 ± 0.010], [0.977], [0.010],
    [80/20], [Logistic Regression], [0.987 ± 0.005], [0.986], [0.005],
    [80/20], [Random Forest], [0.982 ± 0.022], [0.994], [0.022],
    [80/20], [KNN], [0.984 ± 0.012], [0.982], [0.012],
    [90/10], [Logistic Regression], [0.992 ± 0.010], [0.992], [0.010],
    [90/10], [Random Forest], [0.960 ± 0.050], [0.988], [0.050],
    [90/10], [KNN], [0.989 ± 0.010], [0.988], [0.010],
  ),
  caption: [F1 Scores Across Different Train–Test Split Ratios (Cluster Discrimination)],
) <tab:split-ratio-comparison>

==== Cross-Validation Comparison

#figure(
  table(
    columns: 5,
    table.header[*CV Folds*][*Model*][*F1 Score*][*Accuracy*][*Stability (std)*],
    [5-fold], [Logistic Regression], [0.989 ± 0.009], [0.990], [0.009],
    [5-fold], [Random Forest], [0.989 ± 0.011], [0.994], [0.011],
    [5-fold], [KNN], [0.979 ± 0.009], [0.978], [0.009],
    [10-fold], [Logistic Regression], [0.989 ± 0.015], [0.990], [0.015],
    [10-fold], [Random Forest], [0.986 ± 0.027], [0.994], [0.027],
    [10-fold], [KNN], [0.982 ± 0.015], [0.982], [0.015],
  ),
  caption: [F1 Scores Across Different Cross-Validation Configurations],
) <tab:cv-comparison>

==== Sensitivity Analysis Interpretation

The sensitivity analysis revealed the following key insights:

1. *Consistently high performance across all models*: All three classifiers achieved F1 scores above 0.96 and accuracy above 0.97 across all configurations. This indicates that the discovered clusters are highly discriminable and represent well-separated resistance phenotypes.

2. *High stability*: Standard deviations remained consistently low (0.005–0.027 for most configurations, with one outlier at 0.050 for 90/10 Random Forest), confirming that the high discriminative capacity is not an artifact of random initialization.

3. *80/20 split justification*: The 80/20 split achieved strong performance (F1 = 0.982–0.987) while providing a statistically reliable test set (≈98 samples), balancing training adequacy with evaluation reliability.

4. *Cross-validation equivalence*: 5-fold and 10-fold cross-validation produced nearly identical results (F1 ≈ 0.98–0.99). Given the computational efficiency of 5-fold CV, it was preferred.

5. *Random Forest as primary validator*: While all three classifiers achieved comparable performance (F1 = 0.98–0.99), Random Forest was selected as the primary validation model due to its interpretable feature importance through Gini impurity, which enables identification of antibiotics most associated with cluster membership.

These findings support the use of the *80/20 train–test split with Random Forest and 5-fold cross-validation* as the standard configuration for supervised validation. The consistently high F1 scores (>0.96) across all models confirm that the unsupervised clustering produced *biologically meaningful, well-separated resistance phenotypes* that can be reliably discriminated by supervised classifiers.

=== Phase 3 Output Summary

The output of this phase consists of:

- Classification performance metrics for each model and task
- Confusion matrices for per-class analysis
- Feature importance rankings from Random Forest
- Cross-seed stability statistics
- Sensitivity analysis results across split configurations

