// Section 6.3: Supervised Learning Validation
== Supervised Learning Validation <sec:validation-results>

The supervised validation approach evaluates whether the clusters identified through unsupervised hierarchical clustering represent reproducible, predictable patterns in the resistance data. By training a classifier to predict cluster membership from resistance features alone, we can assess whether the cluster assignments capture genuine structure rather than artifacts of the clustering algorithm.

=== Random Forest Classification

A Random Forest classifier was trained to predict cluster membership using the 22-dimensional encoded resistance data as input features @ardila2025rfsystematic. The model was evaluated on a held-out test set (20%) after stratified splitting to ensure robust performance estimates across all four clusters.

#figure(
  table(
    columns: 3,
    table.header[*Metric*][*Value*][*Interpretation*],
    [Accuracy], [99.0%], [Exceptional overall prediction accuracy],
    [Macro F1-Score], [0.96], [Excellent balanced performance across clusters],
    [Weighted Precision], [0.99], [Very low false positive rate],
    [Weighted Recall], [0.99], [Very low false negative rate],
  ),
  caption: [Random Forest classification performance for cluster prediction (Held-out Test Set)],
) <tab:rf-performance>

The exceptionally high classification accuracy (99.0%) demonstrates that cluster assignments are highly predictable from resistance data alone. This confirms that the four clusters represent distinct, reproducible resistance phenotypes rather than arbitrary groupings. The balanced macro F1-score (0.96) indicates excellent performance across all cluster sizes, including the smaller Cluster 1 (n=23).

=== Feature Importance

The Random Forest model also provides interpretable feature importance scores, indicating which antibiotics contribute most to cluster discrimination.

#figure(
  table(
    columns: 3,
    table.header[*Antibiotic*][*Importance Score*][*Primary Cluster Association*],
    [Tetracycline (TE)], [0.241], [C3 (MDR Archetype)],
    [Cephalothin (CF)], [0.180], [C2, C4],
    [Amoxicillin-Clavulanic Acid (AMC)], [0.157], [C2, C3, C4],
    [Doxycycline (DO)], [0.155], [C3 (MDR Archetype)],
    [Cephalexin (CN)], [0.057], [C2, C4],
  ),
  caption: [Top 5 antibiotics by Random Forest feature importance for cluster discrimination],
) <tab:feature-importance>

Tetracycline, cephalothin, and amoxicillin-clavulanic acid emerge as the most discriminating features, with tetracycline (0.241) retaining its strong role in defining the MDR Archetype cluster (C3). The prominence of beta-lactams (cephalothin, AMC) and tetracyclines (TE, DO) confirms that these drug classes are the primary drivers of phenotypic separation.

=== Sensitivity Analysis: Split Ratio and Cross-Validation

To validate the robustness of the chosen experimental configuration (80/20 split, Random Forest), a sensitivity analysis was conducted comparing different partitioning strategies. Three split ratios (70/30, 80/20, 90/10) and two cross-validation schemes (5-fold, 10-fold) were evaluated across all three classifier models.

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

The analysis confirms *consistently high performance (>0.96 F1)* across all configurations, indicating that cluster separability is robust to sampling variations. The 80/20 split with 5-fold cross-validation was confirmed as an optimal balance between training adequacy and evaluation reliability.

=== Validation Implications

The successful supervised validation provides several key insights:

1. *Cluster Reproducibility:* The 99.0% accuracy confirms that an independent learning algorithm can recover the same groupings with near-perfect precision, substantially reducing concerns about clustering artifacts.

2. *Phenotype Distinctiveness:* High precision and recall indicate clear boundaries between resistance phenotypes, supporting their use as meaningful epidemiological categories.

3. *Feature Interpretability:* The alignment between feature importance and known resistance mechanisms—particularly the strong discriminatory power of tetracycline-class antibiotics for MDR phenotypes—validates the biological coherence of the clustering solution.
