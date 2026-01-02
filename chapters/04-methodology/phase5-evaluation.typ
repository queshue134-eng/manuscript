// Section: Phase 5 - System Evaluation and Interpretation

== Phase 5: System Evaluation and Interpretation

System performance was evaluated using a combination of *internal clustering metrics*, *supervised validation metrics*, and *controlled association analysis*.

=== Clustering Evaluation Metrics

#figure(
  table(
    columns: 3,
    table.header[*Metric*][*Purpose*][*Interpretation*],
    [Silhouette Score], [Cluster cohesion and separation], [Higher values indicate better-defined clusters],
    [WCSS], [Cluster compactness], [Lower values indicate tighter clusters],
    [Adjusted Rand Index], [Robustness across methods], [Higher values indicate greater stability],
    [Jaccard Coefficient], [Bootstrap stability], [Higher values indicate membership consistency],
    [Cluster Size Distribution], [Practical validity], [Minimum of 20 isolates per cluster],
  ),
  caption: [Clustering Evaluation Metrics],
) <tab:clustering-evaluation-metrics>

=== Supervised Validation Metrics

#figure(
  table(
    columns: 2,
    table.header[*Metric*][*Description*],
    [Accuracy], [Overall classification correctness],
    [Macro Precision], [Average precision across classes],
    [Macro Recall], [Average recall across classes],
    [Macro F1-score], [Balanced performance across classes],
    [Confusion Matrix], [Per-class misclassification analysis],
  ),
  caption: [Supervised Validation Metrics],
) <tab:supervised-validation-metrics>

=== Association Analysis

Associations between resistance clusters and metadata variables were evaluated using *Cramér's V*, computed as:

$
  V = sqrt(chi^2 / (n dot min(r-1, c-1)))
$

where $chi^2$ is the chi-square statistic, $n$ is the sample size, and $r$ and $c$ are the dimensions of the contingency table.

#figure(
  table(
    columns: 2,
    table.header[*Cramér's V Value*][*Association Strength*],
    [0.00 – 0.10], [Negligible],
    [0.10 – 0.20], [Weak],
    [0.20 – 0.40], [Moderate],
    [0.40 – 0.60], [Relatively Strong],
    [0.60 – 1.00], [Strong],
  ),
  caption: [Cramér's V Interpretation],
) <tab:cramers-v-interpretation>

=== Interpretation Protocol

Interpretation followed a strict *post-hoc protocol* to maintain analytical integrity:

1. Clusters were generated using resistance features only (Phase 2)
2. Metadata were overlaid after clustering for descriptive analysis
3. Statistical associations were reported using associational language only
4. No causal claims were made regarding resistance emergence or transmission

This protocol ensures that interpretive conclusions remain within the methodological scope of the study.
