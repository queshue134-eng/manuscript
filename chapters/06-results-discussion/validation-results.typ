// Section 6.3: Validation Results
== Cluster Validation and Statistical Performance <sec:validation-results>

=== Principal Component Analysis

Principal Component Analysis (PCA) was applied to the 22-dimensional encoded resistance matrix to assess intrinsic dimensionality and enable visualization. @tab:pca-variance summarizes the variance explained by the first five principal components.

#figure(
  table(
    columns: 3,
    table.header[*Component*][*Variance Explained (%)*][*Cumulative (%)*],
    [PC1], [23.53%], [23.53%],
    [PC2], [16.40%], [39.92%],
    [PC3], [11.57%], [51.49%],
    [PC4], [9.74%], [61.24%],
    [PC5], [7.02%], [68.26%],
  ),
  caption: [Variance explained by the first five principal components of the encoded resistance matrix],
) <tab:pca-variance>

The first two principal components capture 39.92% of the total variance, which is characteristic of high-dimensional phenotypic data where resistance patterns are influenced by multiple independent genetic determinants. Five components are required to exceed 68% cumulative variance, indicating substantial dimensionality in the resistance phenotype space. Despite the limited variance captured in two dimensions, the PCA projection reveals visually distinguishable cluster separation, particularly along PC1 which correlates strongly with the tetracycline–doxycycline resistance axis that defines the MDR Cluster 3 @selvam2024network.

=== Internal Validation Metrics

The internal validity of the clustering solution was evaluated using complementary metrics:

#figure(
  table(
    columns: 5,
    table.header[*k*][*Silhouette*][*WCSS*][*Calinski-Harabasz*][*Davies-Bouldin*],
    [2], [0.378], [2395.19], [173.29], [1.246],
    [3], [0.418], [1765.12], [204.43], [1.278],
    [4], [0.466], [1482.92], [192.78], [1.089],
    [5], [0.489], [1234.94], [197.66], [0.976],
    [6], [0.518], [1009.38], [214.74], [1.088],
    [7], [0.527], [891.76], [212.78], [1.031],
    [8], [0.552], [793.15], [213.21], [1.060],
    [9], [0.575], [723.79], [209.78], [1.023],
    [10], [0.586], [657.01], [210.44], [1.013],
  ),
  caption: [Internal validation metrics for cluster counts k = 2 to k = 10. Selection was performed within k = 2 to k = 8 @ikotun2022kmeans.],
) <tab:validation-metrics>

*Silhouette Coefficient:* At k=4, the Silhouette Coefficient is 0.466, indicating moderate cluster structure. According to interpretation guidelines proposed by Rousseeuw, scores between 0.26 and 0.50 indicate structure that requires careful interpretation @shahapure2020silhouette. However, when applied to complex biological phenotypes with overlapping characteristics, expected silhouette scores are typically lower than those observed in synthetic datasets.

*Davies-Bouldin Index:* At k=4, the DB index is 1.089, representing a favorable value confirming reasonable separation without excessive cluster overlap.

=== Supervised Validation

The supervised validation approach—training a Random Forest classifier to predict cluster membership from resistance features—achieved high classification performance (accuracy = 92%, cross-validated) @ardila2025rfsystematic. This confirms that cluster assignments are predictable from resistance data, reinforcing the validity of the phenotype definitions.
