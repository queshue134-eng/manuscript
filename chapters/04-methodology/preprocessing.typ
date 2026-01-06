// Section: Data Preprocessing and Feature Engineering

== Data Preprocessing and Feature Engineering

The objective of this phase is to transform heterogeneous raw antimicrobial susceptibility testing (AST) records into a structured numerical form that supports similarity-based analysis while preserving biologically meaningful resistance information. All preprocessing decisions are explicitly parameterized to ensure reproducibility and to prevent information leakage in downstream analyses.

=== Data Ingestion and Harmonization

Raw phenotypic AST data are consolidated from multiple source files provided by the INOHAC–Project 2. These files, supplied as comma-separated value (CSV) datasets corresponding to different collection sites, are integrated into a single unified dataset.

The ingestion process includes the following steps:

- *Schema harmonization:* Column names, data types, and value encodings are standardized across source files to ensure structural consistency.
- *Metadata extraction:* Structured isolate identifiers are parsed to extract contextual variables such as geographic region, local site, source category, replicate number, and colony number.
- *Duplicate resolution:* Duplicate isolate records are identified and removed to ensure a one-to-one correspondence between isolates and resistance profiles.

This step ensures that all downstream analyses operate on a coherent and internally consistent dataset.

=== Data Quality Filtering

To ensure sufficient data completeness for reliable pattern recognition, threshold-based filtering criteria were applied at both the antibiotic and isolate levels.

- *Antibiotic-level filtering:* Antibiotics tested on fewer than *70% of isolates* were excluded to ensure adequate representation across resistance profiles.
- *Isolate-level filtering:* Isolates with more than *30% missing susceptibility values* were removed to avoid excessive reliance on imputation.

These thresholds balance data retention with analytical reliability and are consistent with exploratory machine learning practices applied to high-dimensional biological data. All thresholds are established beforehand to avoid after-the-fact adjustments based on results. Antibiotics failing to meet the 70% coverage threshold are excluded from subsequent analysis.

=== Resistance Encoding

Phenotypic AST outcomes recorded as categorical values—Susceptible (S), Intermediate (I), and Resistant (R)—are converted into ordinal numerical representations to support quantitative analysis.

#figure(
  table(
    columns: 3,
    table.header[*Phenotype*][*Encoded Value*][*Interpretation*],
    [Susceptible (S)], [0], [No resistance observed],
    [Intermediate (I)], [1], [Reduced susceptibility],
    [Resistant (R)], [2], [Clinical resistance],
  ),
  caption: [Ordinal Encoding of Phenotypic AST Results],
) <tab:resistance-encoding>

This ordinal encoding preserves the progressive nature of resistance severity while enabling distance-based computations.

=== Missing Value Imputation

Following threshold-based exclusion, remaining missing susceptibility values are imputed using *median imputation*, applied independently to each antibiotic feature:

$
  hat(x)_(i,j) = "median"({x_(k,j) | x_(k,j) "is observed"})
$

where $hat(x)_(i,j)$ is the imputed resistance value for isolate $i$ and antibiotic $j$, and $x_(k,j)$ represents observed resistance values for antibiotic $j$.

Median imputation is robust to outliers and preserves the ordinal nature of resistance data. Alternative strategies such as mean or mode imputation are considered; however, the median provides a conservative central estimate suitable for exploratory pattern recognition.

=== Derived Resistance Feature Computation

To support downstream interpretation and epidemiological contextualization, several derived resistance descriptors are computed. These features are *not included as inputs* to unsupervised clustering to prevent bias during pattern discovery.

==== Multiple Antibiotic Resistance (MAR) Index

The MAR index quantifies the proportion of antibiotics to which an isolate exhibits resistance:

$
  "MAR" = a / b
$

where $a$ is the number of antibiotics for which resistance is observed (encoded value = 2), and $b$ is the total number of antibiotics tested for the isolate.

*Interpretation:*

- MAR ≤ 0.2: Low-risk source
- MAR > 0.2: High-risk source, indicative of antibiotic selection pressure


==== Resistant Classes Count

The breadth of resistance across antimicrobial classes was computed as:

$
  "Resistant Classes" = |{c | exists a in c, "resistance"(a) = "true"}|
$

where $c$ denotes an antimicrobial class and $a$ denotes an antibiotic belonging to that class.

This metric captures class-level resistance diversity rather than resistance to individual agents.

==== Multidrug Resistance (MDR) Classification

An isolate is classified as multidrug-resistant (MDR) if resistance is observed in *three or more antimicrobial classes*, consistent with established definitions @magiorakos2011mdr:

$
  "MDR" = cases(
    1\, & "if Resistant Classes" >= 3,
    0\, & "otherwise"
  )
$



=== Feature–Metadata Separation

To prevent *information leakage* and circular reasoning, the analysis-ready dataset is explicitly partitioned into two components:

- *Feature Matrix ($bold(X)$):* Encoded resistance values for the 22 antibiotics, used exclusively for unsupervised clustering and supervised validation.
- *Metadata Matrix ($bold(M)$):* Contextual variables (e.g., region, site, species, source category, MDR status), reserved solely for post-discovery interpretation.

This separation ensures that resistance patterns are discovered strictly from phenotypic similarity and are not influenced by external labels or contextual information.

=== Preprocessing Component Output

The output of the preprocessing component consists of:

- Analysis-ready resistance feature matrix with encoded susceptibility values
- Derived resistance indicators (MAR, Resistant Classes, MDR status)
- Separated metadata matrix for post-hoc interpretation
- Data quality documentation including filtering statistics
