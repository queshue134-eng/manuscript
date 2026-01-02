// Section: Phase 4 - Integrated Framework Design

== Phase 4: Integrated Framework Design

An integrated analytical framework was developed to support reproducible, leakage-aware antimicrobial resistance pattern recognition. The framework follows a *three-layer architecture* consisting of a data layer, a processing layer, and a presentation layer.

=== System Architecture

#figure(
  table(
    columns: 3,
    table.header[*Layer*][*Components*][*Function*],
    [Data Layer],
    [Preprocessing pipeline, feature engineering modules],
    [Data cleaning, encoding, imputation, feature preparation],

    [Processing Layer],
    [Clustering, supervised models, statistical analysis],
    [Pattern discovery, validation, co-resistance analysis],

    [Presentation Layer], [Streamlit dashboard], [Visualization, exploration, and result interpretation],
  ),
  caption: [Integrated Framework Architecture],
) <tab:integrated-framework-architecture>

=== Pipeline Orchestration

Pipeline orchestration was implemented through a *central command-line interface (CLI)* that controlled execution of all analytical stages. This design ensures modularity, reproducibility, and consistent parameter application across experiments.

#figure(
  table(
    columns: 2,
    table.header[*Command*][*Description*],
    [`--pipeline`], [Execute full data preprocessing and clustering pipeline],
    [`--validate`], [Run supervised validation and stability checks],
    [`--analyze`], [Perform post-hoc statistical and regional analyses],
    [`--viz`], [Generate all figures and plots],
    [`--app`], [Launch interactive Streamlit dashboard],
  ),
  caption: [Pipeline Orchestration Commands],
) <tab:pipeline-orchestration-commands>

Reproducibility was enforced using *fixed random seeds*, centralized configuration files, and persistent storage of intermediate artifacts (e.g., linkage matrices, trained models, clustering assignments).

=== Co-Resistance Analysis

Antibiotic co-resistance patterns were quantified using the *phi coefficient (φ)*, calculated from binary resistance co-occurrence tables:

$
  phi = (a d - b c) / sqrt((a+b)(c+d)(a+c)(b+d))
$

where $a$, $b$, $c$, and $d$ represent the counts in a 2×2 contingency table of resistance presence and absence between two antibiotics.

#figure(
  table(
    columns: 3,
    table.header[][*Antibiotic B: R*][*Antibiotic B: S*],
    [Antibiotic A: R], [$a$], [$b$],
    [Antibiotic A: S], [$c$], [$d$],
  ),
  caption: [Phi Coefficient Contingency Table Structure],
) <tab:phi-coefficient-contingency-table>

Antibiotic clustering based on co-resistance similarity was subsequently performed using hierarchical clustering with distance defined as $1 - phi$.

=== Interactive Visualization Dashboard

The Streamlit-based dashboard provides interactive exploration of resistance patterns through three primary views:

#figure(
  table(
    columns: 2,
    table.header[*View*][*Description*],
    [Cluster Explorer],
    [Interactive dendrogram with selectable cut-points; cluster-level resistance heatmaps displaying mean resistance scores per antibiotic],

    [Regional Distribution],
    [Geographic breakdown of cluster assignments with stacked bar charts showing proportional representation across regions and sites],

    [Co-Resistance Network],
    [Interactive phi-coefficient heatmap with threshold filtering; hierarchically clustered antibiotic groupings],
  ),
  caption: [Dashboard Components],
) <tab:dashboard-components>

The dashboard enables users to:

- Adjust dendrogram cut-height to explore clustering at different granularities
- Filter isolates by region, source type, or species
- Export visualizations and summary statistics
- Compare resistance profiles across selected clusters
