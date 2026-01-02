// Section: Implementation Details

== Implementation Details

The analytical framework was implemented using *Python 3.9+* and widely adopted open-source scientific computing libraries. Computational requirements were modest and suitable for standard desktop or laptop hardware.

#figure(
  table(
    columns: 2,
    table.header[*Component*][*Specification*],
    [Programming Language], [Python 3.9+],
    [Data Processing], [pandas, numpy],
    [Machine Learning], [scikit-learn],
    [Statistical Analysis], [scipy],
    [Visualization], [matplotlib, seaborn],
    [Dashboard], [Streamlit],
    [Version Control], [Git],
  ),
  caption: [Implementation Environment],
) <tab:implementation-environment>

=== Computational Pipeline

The complete analytical pipeline is summarized below:

*Complete Analytical Pipeline*

*Input:* Raw AST CSV files

*Output:* Cluster assignments, validation metrics, dashboard

*PHASE 1: Preprocessing*

+ Load and harmonize data from multiple sources
+ Parse isolate identifiers to extract metadata
+ Apply quality filters (70% antibiotic, 30% isolate thresholds)
+ Encode resistance values (S=0, I=1, R=2)
+ Impute missing values using median imputation
+ Compute derived features (MAR, MDR, Resistant Classes)
+ Separate feature matrix X from metadata matrix M

*PHASE 2: Clustering*

+ Compute pairwise Euclidean distances
+ Perform hierarchical clustering (Ward's linkage)
+ Evaluate k=2 to k=8 for optimal selection (metrics computed to k=10)
+ Apply practical constraints (minimum cluster size)
+ Select optimal k and assign cluster labels
+ Assess stability via ARI and bootstrap Jaccard

*PHASE 3: Supervised Validation*

+ Split data (80/20 stratified, before preprocessing)
+ Train models (LR, RF, kNN) on training set
+ Evaluate on test set (accuracy, precision, recall, F1)
+ Extract feature importance from Random Forest
+ Repeat across multiple random seeds

*PHASE 4: Analysis and Visualization*

+ Compute co-resistance phi coefficients
+ Calculate Cramér's V for cluster-metadata associations
+ Generate visualizations (dendrograms, heatmaps, bar plots)
+ Deploy Streamlit dashboard

*Return:* Final cluster assignments, performance metrics, dashboard
