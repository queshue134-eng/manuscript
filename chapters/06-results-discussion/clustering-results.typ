// Section 6.2: Clustering Results
== Hierarchical Clustering Results <sec:clustering-results>

=== Optimal Cluster Selection

Hierarchical agglomerative clustering using Ward's linkage method and Euclidean distance was applied to 491 bacterial isolates collected from the water-fish-human nexus across three Philippine regions. Cluster solutions from k=2 to k=8 were evaluated for optimal selection, with metrics computed to k=10 for validation purposes @ikotun2022kmeans.

#figure(
  table(
    columns: 3,
    table.header[*k*][*Silhouette Score*][*WCSS*],
    [2], [0.378], [2395.19],
    [3], [0.418], [1765.12],
    [4], [0.466], [1482.92],
    [5], [0.489], [1234.94],
    [6], [0.518], [1009.38],
    [7], [0.527], [891.76],
    [8], [0.552], [793.15],
    [9], [0.575], [723.79],
    [10], [0.586], [657.01],
  ),
  caption: [Cluster Validation Metrics Across k Values],
) <tab:cluster-validation-metrics>

The *k=4 cluster solution* was selected as the optimal configuration through a multi-criteria decision framework @ling2025enhancing @jeon2025measuring. The k=4 solution represents the elbow point in the WCSS curve, indicating diminishing returns in cluster compactness for k>4. Additionally, k=4 satisfies both the silhouette threshold (≥0.40 for moderate-strong structure @shahapure2020silhouette) and cluster stability requirement (minimum cluster size ≥20 for reliable phenotype estimation).

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

==== Cluster 1: The Salmonella-Aminoglycoside Phenotype

Cluster 1 comprises the smallest population (n=23, representing 4.7% of the 491 total isolates) and is exclusively composed of _Salmonella_ species, representing a taxonomically homogeneous group. The cluster exhibits low MDR prevalence, with only 1 of 23 isolates (4.3%) classified as MDR, characterized by elevated resistance to aminoglycoside antibiotics (Amikacin, Gentamicin, Tobramycin). Geographically, 17 of 23 C1 isolates (73.9%) originate from Region III – Central Luzon, with 16 of 23 (69.6%) derived from water samples.

==== Cluster 2: The Enterobacter-Penicillin Phenotype

Cluster 2 (n=93, representing 18.9% of total isolates) is dominated by _Enterobacter cloacae_ (66 of 93, 71.0%) and _Enterobacter aerogenes_ (20 of 93, 21.5%). The cluster displays low MDR prevalence, with only 2 of 93 isolates (2.2%) classified as MDR, characterized by resistance to Ampicillin, Cephalothin, and Gentamicin. The Ampicillin–Cephalothin co-resistance pattern is consistent with intrinsic chromosomal AmpC β-lactamase expression characteristic of _Enterobacter_ species.

==== Cluster 3: The Multi-Drug Resistant Archetype

Cluster 3 (n=123, representing 25.1% of total isolates) constitutes the primary MDR reservoir within the dataset. A striking 66 of 123 isolates (53.7%) are classified as multidrug-resistant @magiorakos2011mdr—accounting for 94.3% of all 70 MDR isolates in the dataset and representing a rate more than 50-fold higher than Cluster 4 (1 of 252, 0.4%). The cluster is dominated by _Escherichia coli_ (95 of 123, 77.2%) and _Klebsiella pneumoniae_ (27 of 123, 22.0%), both species recognized as priority pathogens in the WHO global AMR threat list. The resistance profile is characterized by high prevalence of Tetracycline (TE), Doxycycline (DO), and Ampicillin (AM) resistance.

The geographic distribution of C3 reveals that 66 of 123 isolates (53.7%) originate from the BARMM region—a coincidentally identical percentage to the MDR rate but representing a different subset of isolates. Additionally, 69 of 123 C3 isolates (56.1%) were derived from fish samples, while 9 of 123 (7.3%) were collected from hospital environments.

==== Cluster 4: The Susceptible Majority

Cluster 4 (n=252, representing 51.3% of total isolates) is the largest cluster and the dominant susceptibility phenotype within the dataset. The cluster comprises _Escherichia coli_ (129 of 252, 51.2%) and _Klebsiella pneumoniae_ (119 of 252, 47.2%) in nearly equal proportions, yet exhibits a remarkably low MDR prevalence of only 1 of 252 isolates (0.4%). The near-complete susceptibility profile suggests that C4 isolates have not been subjected to the same selective pressures as C3, despite overlapping species composition.
