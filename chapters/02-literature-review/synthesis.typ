// Chapter 2: Synthesis - The Methodological Gap
// Identifies the research gap that the current study addresses

== Synthesis: The Methodological Gap

The foregoing review reveals a critical methodological gap at the intersection of computational approaches and environmental AMR surveillance:

=== Limitations of Existing Approaches

+ *Supervised approaches* achieve high accuracy but remain constrained to known phenotypes. Models trained on clinical datasets cannot identify novel resistance patterns absent from their training data, fundamentally limiting their utility for environmental discovery.

+ *Existing unsupervised methods* have rarely been applied to multi-regional environmental surveillance. While hierarchical clustering has proven effective in agricultural and clinical settings, its systematic application to One Health surveillance datasets spanning water-fish-human interfaces remains underexplored.

+ *Spatial epidemiology* typically operates on aggregated resistance metrics rather than integrated phenotypic profiles. Studies documenting spatial autocorrelation in resistance rates have not combined these insights with data-driven phenotype discovery.

+ *Philippine surveillance* has characterized environmental resistance through conventional MDR classification without exploring underlying phenotypic structure. The INOHAC dataset's potential for pattern discovery remains unrealized through traditional analytical approaches.

=== The Present Study's Contribution

The present study addresses these gaps through a hybrid unsupervised-supervised framework specifically designed for environmental AMR surveillance:

*Unsupervised Pattern Discovery.* By first clustering isolates using Ward's hierarchical method with Euclidean distance, the approach discovers resistance archetypes directly from phenotypic data without requiring predefined labels. This enables identification of novel resistance patterns that conventional clinical categories might overlook.

*Supervised Validation.* By subsequently training a Random Forest classifier on cluster assignments and evaluating discrimination accuracy through cross-validation, the framework tests whether discovered clusters represent biologically coherent structures rather than statistical artifacts. High classification accuracy combined with high silhouette scores provides convergent evidence for phenotypic validity.

*Multi-Regional Environmental Focus.* Applying this methodology to isolates spanning multiple Philippine regions and ecological compartments (water, fish, human sources) enables characterization of resistance phenotypes specific to the One Health nexus—patterns potentially distinct from those documented in purely clinical surveillance.

*Integrated Interpretation.* Combining cluster validation with MAR index analysis and MDR classification bridges data-driven discovery with clinically interpretable resistance metrics, facilitating translation of computational findings into actionable surveillance insights.

This integrated approach represents a methodological advance over both purely supervised prediction (which requires known labels) and purely unsupervised clustering (which lacks validation mechanisms), offering a reproducible framework for future environmental AMR surveillance studies.
