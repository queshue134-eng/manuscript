// Section 6.7: Discussion
== Discussion <sec:discussion>

=== Interpretation of Clustering Results

The four-cluster solution identified by hierarchical clustering reveals distinct antimicrobial resistance phenotypes within the Philippine isolate collection. The emergence of a high-MDR cluster (C3) dominated by _E. coli_ and _K. pneumoniae_ aligns with global reports of problematic Enterobacteriaceae strains exhibiting extensive drug resistance @zhao2025mdroinfection.

The clustering approach employed in this study offers advantages over single-gene molecular characterization by capturing the complete phenotypic resistance profile. This holistic view enables identification of clinically relevant resistance patterns that may arise from multiple underlying mechanisms @tolan2025mdr.

=== Methodological Validation

The supervised validation approach using Random Forest classification addresses a key limitation of unsupervised learning: the lack of ground truth labels. By demonstrating that cluster assignments are reproducible via an independent learning algorithm, this study provides evidence that the identified patterns represent genuine biological groupings rather than algorithmic artifacts @ardila2025rfsystematic.

The high F1 Score (0.973) indicates excellent discriminative ability, suggesting that resistance profiles within each cluster share common characteristics distinguishable from other clusters. This finding supports the utility of phenotypic clustering for AMR surveillance stratification.

=== Comparison with Existing Literature

The MDR prevalence rates observed in this study (0.4%--53.7% across clusters) demonstrate wide phenotypic heterogeneity, with C3 representing the primary MDR reservoir at 53.7%. Regional variations in resistance patterns mirror documented disparities in healthcare access and antimicrobial stewardship infrastructure @palmares2025marikina @arsp2024.

The co-resistance patterns identified, particularly the strong tetracycline-doxycycline association, are consistent with mechanistic studies of tet genes conferring cross-resistance @wang2022tetx4. Similarly, fluoroquinolone co-resistance patterns reflect known mechanisms of gyrase mutations and efflux pump overexpression @shariati2022fqmechanisms.

=== One Health Implications

The differential distribution of resistance clusters across environmental sources (clinical, environmental, animal) supports the One Health framework for AMR surveillance @franklin2024onehealth. The presence of high-MDR phenotypes in non-clinical sources indicates environmental reservoirs that may contribute to resistance dissemination.

This finding underscores the importance of integrated surveillance spanning human health, animal husbandry, and environmental monitoring---the core tenets of the INOHAC project from which this data originates @abamo2024inohac.

=== Limitations

Several limitations warrant consideration:

1. *Retrospective design*: Analysis was conducted on historical AST data, limiting the ability to capture temporal trends
2. *Phenotypic focus*: Genotypic resistance mechanisms were not characterized, precluding direct linkage of clusters to specific resistance genes
3. *Regional scope*: Results may not generalize to other Philippine regions or international contexts
4. *Missing data*: Some isolates lacked complete antibiotic panels, potentially affecting cluster assignments

Despite these limitations, the study demonstrates the feasibility and utility of machine learning approaches for AMR pattern recognition in resource-limited surveillance settings.
