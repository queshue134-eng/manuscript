// Chapter 2: Synthesis - The Methodological Gap
// Identifies the research gap that the current study addresses

== Synthesis: The Methodological Gap

The foregoing review reveals a critical methodological gap at the intersection of computational approaches and environmental AMR surveillance.

=== Comparative Summary of Related Studies

#figure(
  table(
    columns: (1.2fr, 2fr, 0.5fr, 0.8fr, 0.8fr, 1.2fr, 1.2fr),
    align: (left, left, center, center, center, left, left),
    stroke: 0.5pt,
    inset: 5pt,

    // Header row
    table.cell(fill: luma(230))[*Author*],
    table.cell(fill: luma(230))[*Title*],
    table.cell(fill: luma(230))[*Year*],
    table.cell(fill: luma(230))[*Unsup.*],
    table.cell(fill: luma(230))[*Sup.*],
    table.cell(fill: luma(230))[*Focus*],
    table.cell(fill: luma(230))[*Contribution*],

    // Data rows
    [Nguyen et al.], [ML for Predicting Antimicrobial MICs], [2018], [No], [Yes], [Genomic AMR], [Salmonella MICs],
    [Ardila et al.], [Systematic Review of ML in AMR], [2025], [No], [Yes], [Systematic review], [RF/GBDT],
    [Parthasarathi et al.],
    [Clustering-Based AMR Gene Analysis],
    [2024],
    [Yes],
    [Yes],
    [AMR gene clustering],
    [Silhouette 0.82],
    [Kou et al.],
    [Spatial Epidemiology of E. coli],
    [2025],
    [No],
    [No],
    [Spatial epidemiology],
    [Spatial autocorrelation],
    [Abada et al.],
    [Ward's Clustering for Agricultural MDR],
    [2025],
    [Yes],
    [No],
    [Agricultural MDR],
    [Ward's clustering],
    [Abamo et al.],
    [INOHAC AMR Project Two],
    [2024],
    [No],
    [No],
    [Environmental surveillance],
    [Multi-regional dataset],

    // Current study row (highlighted)
    table.cell(fill: rgb("#d4edda"))[*Current Study*],
    table.cell(fill: rgb("#d4edda"))[*Pattern Recognition of AMR*],
    table.cell(fill: rgb("#d4edda"))[*2024*],
    table.cell(fill: rgb("#d4edda"))[*Yes*],
    table.cell(fill: rgb("#d4edda"))[*Yes*],
    table.cell(fill: rgb("#d4edda"))[*Water-fish-human nexus*],
    table.cell(fill: rgb("#d4edda"))[*Hierarchical + RF*],
  ),
  caption: [Comparative Summary of Computational Approaches to AMR Analysis],
)

_The current study uniquely integrates unsupervised pattern discovery with supervised validation for multi-regional environmental surveillance._

*Limitations of Existing Approaches.* Supervised methods achieve high accuracy but cannot identify novel resistance patterns absent from training data. Unsupervised clustering, while effective in agricultural and clinical settings, has rarely been applied to multi-regional One Health surveillance. Spatial epidemiology operates on aggregated metrics rather than phenotypic profiles. Philippine surveillance has relied on conventional MDR classification, leaving the INOHAC dataset's pattern discovery potential unrealized.

*The Present Study's Contribution.* This study addresses these gaps through a hybrid unsupervised-supervised framework for environmental AMR surveillance. Ward's hierarchical clustering discovers resistance archetypes without predefined labels, while Random Forest classification validates whether clusters represent biologically coherent structures. Applying this methodology to isolates spanning multiple Philippine regions and ecological compartments (water, fish, human) enables characterization of resistance phenotypes specific to the One Health nexus. This integrated approach advances beyond purely supervised prediction or unsupervised clustering alone, offering a reproducible framework for future surveillance studies.
