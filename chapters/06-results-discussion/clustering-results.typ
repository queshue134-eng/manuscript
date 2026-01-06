// Section 6.2: Clustering Results
== Unsupervised Learning Results <sec:clustering-results>

=== Clustering Parameters <sec:clustering-parameters>

The structure of the resistance dataset was analyzed using hierarchical agglomerative clustering. This approach builds a hierarchy of clusters by progressively merging similar isolates based on their resistance profiles.

==== Ward's Linkage Method

Ward's minimum variance method was employed as the linkage criterion @ward1963hierarchical. Unlike other linkage methods that focus on pairwise distances (e.g., single or complete linkage), Ward's method minimizes the total within-cluster variance at each merger step. This optimization criterion is particularly effective for discovering compact, spherical clusters that correspond to distinct resistance phenotypes.

The Within-Cluster Sum of Squares (WCSS) quantifies the compactness achieved by Ward's method:

#figure(
  table(
    columns: 4,
    table.header[*k*][*WCSS*][*ΔWCSS*][*% Reduction*],
    [2], [2395.19], [—], [—],
    [3], [1765.12], [630.07], [26.3%],
    [*4*], [*1482.92*], [*282.20*], [*16.0%*],
    [5], [1234.94], [247.98], [16.7%],
    [6], [1009.38], [225.56], [18.3%],
  ),
  caption: [Within-Cluster Sum of Squares (WCSS) by cluster solution. ΔWCSS shows the reduction from the previous k. The elbow point at k=4 marks diminishing returns in variance reduction.],
) <tab:wcss-analysis>

In @tab:wcss-analysis, *k* represents the number of clusters tested, *WCSS* is the Within-Cluster Sum of Squares measuring total variance within all clusters, *ΔWCSS* shows the absolute reduction from the previous k value, and *% Reduction* indicates the relative improvement in cluster compactness. The elbow point occurs where percent reduction begins to plateau.

==== Euclidean Distance

Euclidean distance was selected as the dissimilarity metric, measuring the geometric distance between isolate resistance vectors. This metric is the required complement to Ward's linkage method, as Ward's objective function is defined based on squared Euclidean distances. The combination of Ward's linkage and Euclidean distance provides a robust framework for identifying natural groupings in the multidimensional resistance data.

#figure(
  table(
    columns: 3,
    table.header[*Cluster Solution (k)*][*Lower Threshold (d)*][*Upper Threshold (d)*],
    [5], [—], [22.27],
    [*4*], [*22.27*], [*23.76*],
    [3], [23.76], [35.50],
    [2], [35.50], [41.20],
  ),
  caption: [Euclidean distance thresholds defining cluster solutions. The optimal k=4 solution is stable within the distance range 22.27 to 23.76.],
) <tab:distance-thresholds>

In @tab:distance-thresholds, *Cluster Solution (k)* indicates the resulting number of clusters, *Lower Threshold (d)* is the minimum Euclidean distance at which that solution becomes stable, and *Upper Threshold (d)* is the maximum distance before a merge reduces the cluster count.

=== Optimal Cluster Solution

Hierarchical agglomerative clustering using Ward's linkage method and Euclidean distance (as described in Section 6.2.1, Clustering Parameters) was applied to 491 bacterial isolates collected from the water-fish-human nexus across three Philippine regions. Cluster (k) solutions from k=2 to k=8 were evaluated for optimal selection, with metrics computed to k=10 for validation purposes @ikotun2022kmeans.

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
  caption: [Cluster Validation Metrics Across k Values],
) <tab:cluster-validation-metrics>

In @tab:cluster-validation-metrics, *k* is the number of clusters and *Silhouette Score* measures cluster separation (≥0.40 indicates strong structure). *WCSS* quantifies compactness (lower is better), while *Calinski-Harabasz* (higher is better) and *Davies-Bouldin* (lower is better) provide complementary validity checks.

The *k=4 cluster solution* was selected as the optimal configuration through a multi-criteria decision framework @ling2025enhancing @jeon2025measuring. The k=4 solution represents the elbow point in the WCSS curve and satisfies the silhouette threshold (≥0.40). Furthermore, the Davies-Bouldin index at k=4 (1.089) confirms reasonable separation without excessive overlap, supported by a competitive Calinski-Harabasz score (192.78), indicating dense and well-separated clusters.

#figure(
  table(
    columns: 5,
    table.header[*k*][*Silhouette*][*Elbow Point*][*Interpretability*][*Min Cluster Size*],
    [2], [0.378], [—], [Low: overly broad], [✓ (n≥20)],
    [3], [0.418], [—], [Moderate], [✓ (n≥20)],
    [*4*], [*0.466*], [*✓ Elbow*], [*High: biologically meaningful*], [*✓ (n=23)*],
    [5], [0.489], [—], [Moderate: fragmentation begins], [✓ (n≥20)],
    [6+], [\>0.51], [—], [Lower: over-segmentation], [Risk of n\<20],
  ),
  caption: [Multi-criteria decision matrix for optimal k selection. The k=4 solution satisfies all criteria with a favorable balance of statistical validity and biological interpretability.],
) <tab:k-selection-criteria>

The columns in @tab:k-selection-criteria evaluate each cluster solution across multiple dimensions. *Silhouette* scores measure cluster cohesion (where ≥0.40 indicates strong structure), while the *Elbow Point* identifies the diminishing returns in variance reduction. *Interpretability* assesses the biological relevance of resulting groups, and *Min Cluster Size* ensures no cluster falls below n=20, a threshold required for reliable phenotype estimation.

#figure(
  image("../../figures/cluster_validation.png", width: 90%),
  caption: [Elbow method (left) and silhouette analysis (right) for cluster validation. The WCSS curve shows the elbow point at k=4, while the silhouette plot confirms moderate-to-strong structure at this configuration.],
) <fig:cluster-validation>

=== Sensitivity Analysis: Evaluation of k=5 and k=6

Driven by the favorable Calinski-Harabasz and Davies-Bouldin scores observed at higher cluster counts (@tab:cluster-validation-metrics), varying cluster solutions were rigorously evaluated to test the stability of the k=4 optimal selection.

*Experiment k=5:* The 5-cluster solution (Davie-Bouldin = 0.976) was generated and analyzed. While it achieved a lower dispersion index, inspection of the phenotype profiles revealed that the additional cluster resulted from the fragmentation of the Susceptible Cluster (C4) into two biologically indistinguishable subgroups, offering no additional clinical or epidemiological resolution.

*Experiment k=6:* The 6-cluster solution (Calinski-Harabasz = 214.74) yielded the highest density score but introduced singleton clusters with $n < 10$ isolates. This violated the minimum cluster size requirement ($n \geq 20$) established for statistical reliability, rendering the solution less robust for subsequent analysis.

Consequently, k=4 was retained as the most parsimonious solution that balances statistical performance with biological interpretability.

=== Cluster Characteristics

The four identified clusters exhibited distinct resistance phenotype profiles:

#figure(
  table(
    columns: 5,
    table.header[*Cluster*][*N Isolates*][*Dominant Species*][*MDR %*][*Top Resistant Antibiotics*],
    [C1], [23 (4.7%)], [_Salmonella_ (100%)], [4.3%], [AN, CN, GM],
    [C2], [93 (18.9%)], [_Enterobacter cloacae_ (71.0%)], [2.2%], [AM, CF, CN],
    [C3], [123 (25.1%)], [_E. coli_ (77.2%), _K. pneumoniae_ (22.0%)], [53.7%], [TE, DO, AM],
    [C4], [252 (51.3%)], [_E. coli_ (51.2%), _K. pneumoniae_ (47.2%)], [0.4%], [AM, FT, CN],
  ),
  caption: [Cluster composition summary showing species distribution, MDR prevalence, and dominant resistance patterns],
) <tab:cluster-summary>

In @tab:cluster-summary, the columns describe each group's key features. *Cluster* is the group name, while *N Isolates* shows the number and percentage of samples it contains. *Dominant Species* lists the most common bacteria found in that group, and *MDR %* shows how many are multidrug-resistant. Finally, *Top Resistant Antibiotics* lists the specific drugs that the group resists, using these abbreviations: AN=Amikacin, GM=Gentamicin, AM=Ampicillin, CF=Cefalotin, CN=Cefalexin, TE=Tetracycline, DO=Doxycycline, FT=Nitrofurantoin.

==== Cluster 1: The Salmonella-Aminoglycoside Phenotype

Cluster 1 comprises the smallest population (n=23, representing 4.7% of the 491 total isolates) and is exclusively composed of _Salmonella_ species, representing a taxonomically homogeneous group. The cluster exhibits low MDR prevalence, with only 1 of 23 isolates (4.3%) classified as MDR, characterized by elevated resistance to aminoglycoside antibiotics (Amikacin, Gentamicin, Tobramycin). Geographically, 17 of 23 C1 isolates (73.9%) originate from Region III – Central Luzon, with 16 of 23 (69.6%) derived from water samples.

==== Cluster 2: The Enterobacter-Penicillin Phenotype

Cluster 2 (n=93, representing 18.9% of total isolates) is dominated by _Enterobacter cloacae_ (66 of 93, 71.0%) and _Enterobacter aerogenes_ (20 of 93, 21.5%). The cluster displays low MDR prevalence, with only 2 of 93 isolates (2.2%) classified as MDR, characterized by resistance to Ampicillin, Cephalothin, and Gentamicin. The Ampicillin–Cephalothin co-resistance pattern is consistent with intrinsic chromosomal AmpC β-lactamase expression characteristic of _Enterobacter_ species.

==== Cluster 3: The Multi-Drug Resistant Archetype

Cluster 3 (n=123, representing 25.1% of total isolates) constitutes the primary MDR reservoir within the dataset. A striking 66 of 123 isolates (53.7%) are classified as multidrug-resistant @magiorakos2011mdr—accounting for 94.3% of all 70 MDR isolates in the dataset and representing a rate more than 100-fold higher than Cluster 4 (1 of 252, 0.4%). The cluster is dominated by _Escherichia coli_ (95 of 123, 77.2%) and _Klebsiella pneumoniae_ (27 of 123, 22.0%), both species recognized as priority pathogens in the WHO global AMR threat list. The resistance profile is characterized by high prevalence of Tetracycline (TE), Doxycycline (DO), and Ampicillin (AM) resistance.

The geographic distribution of C3 reveals that 66 of 123 isolates (53.7%) originate from the BARMM region—a coincidentally identical percentage to the MDR rate but representing a different subset of isolates. Additionally, 69 of 123 C3 isolates (56.1%) were derived from fish samples, while 9 of 123 (7.3%) were collected from hospital environments.

==== Cluster 4: The Susceptible Majority

Cluster 4 (n=252, representing 51.3% of total isolates) is the largest cluster and the dominant susceptibility phenotype within the dataset. The cluster comprises _Escherichia coli_ (129 of 252, 51.2%) and _Klebsiella pneumoniae_ (119 of 252, 47.2%) in nearly equal proportions, yet exhibits a remarkably low MDR prevalence of only 1 of 252 isolates (0.4%). The near-complete susceptibility profile suggests that C4 isolates have not been subjected to the same selective pressures as C3, despite overlapping species composition.
