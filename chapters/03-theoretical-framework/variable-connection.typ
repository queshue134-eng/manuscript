// Section: The Variable Connection: From Data to Design

== The Variable Connection: From Data to Design

The relationship between research findings (independent variables) and design features (dependent variables) follows a structured derivation process grounded in the theoretical frameworks above.

=== Independent Variables (Research/Data)

The independent variables in this study comprise the phenotypic antimicrobial susceptibility testing (AST) data:

#figure(
  table(
    columns: 3,
    table.header[*Variable Category*][*Specific Variables*][*Measurement*],
    [*Resistance Profile*], [22 antibiotic susceptibility results], [Ordinal (S=0, I=1, R=2)],
    [*Derived Metrics*], [MAR Index, Resistant Classes Count, MDR Status], [Continuous/Binary],
    [*Contextual Metadata*], [Region, Site, Source Category, Species], [Categorical (excluded from analysis)],
  ),
  caption: [Independent Variables],
) <tab:independent-variables>

=== Dependent Variables (Design Features)

The dependent variables are the architectural design features implemented in the system:

#figure(
  table(
    columns: 3,
    table.header[*Design Feature*][*Derivation from Theory*][*Justification*],
    [*Hierarchical Clustering Module*],
    [Pattern Recognition Theory → unsupervised structure discovery],
    [Addresses SOP Problem 1 (categorical constraints) by discovering latent patterns without predefined labels],

    [*Supervised Validation Module*],
    [Cluster Validation Theory → external validation mechanism],
    [Addresses SOP Problem 2 (weak assurance from clustering alone)],

    [*Feature--Metadata Separation*],
    [Information Leakage Theory → prevent feature leakage],
    [Ensures objectivity in pattern discovery],

    [*Split-Before-Transform Protocol*],
    [Information Leakage Theory → prevent preprocessing leakage],
    [Ensures unbiased performance estimation],

    [*Layered Architecture*],
    [Software Architecture Theory  → separation of concerns],
    [Addresses SOP Problem 3 (need for integrated framework)],

    [*Interactive Dashboard*],
    [Exploratory Data Analysis Theory  → hypothesis generation through visualization],
    [Enables post-hoc interpretation without biasing discovery],
  ),
  caption: [Dependent Variables (Design Features)],
) <tab:dependent-variables>

=== The Derivation Chain

The following derivation chain traces how theoretical principles translate into design decisions:

#figure(
  table(
    columns: 3,
    table.header[*Theoretical Foundation*][*Research Finding*][*Design Decision*],
    [Pattern Recognition Theory\ (Duda, Hart & Stork)],
    [AST data contains latent resistance structure],
    [Hierarchical Clustering Module],

    [Cluster Validation Theory\ (Jain & Dubes)],
    [Unsupervised alone is insufficient],
    [Supervised Validation Module (LR/RF/kNN)],

    [Information Leakage Theory\ (Kaufman et al.)],
    [Metadata may bias pattern discovery],
    [Feature--Metadata Separation],

    [Statistical Learning Theory\ (Vapnik)],
    [Preprocessing on full data causes leakage],
    [Split-Before-Transform Protocol],

    [One Health Framework\ (WHO/FAO/WOAH)],
    [AMR crosses environmental boundaries],
    [Multi-source Data Ingestion Module],

    [Software Architecture Theory\ (Garlan & Shaw)],
    [Need for reproducible, modular pipeline],
    [Layered Architecture + CLI Orchestration],
  ),
  caption: [Derivation Chain from Theory to Design],
) <tab:derivation-chain>

