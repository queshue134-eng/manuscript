// Section: Conceptual Framework Diagram

== Conceptual Framework Diagram

The following diagram synthesizes the theoretical relationships among the primary theories, supporting concepts, and design outcomes.

The conceptual framework consists of three interconnected layers:

=== Theoretical Layer

The foundational theories that inform the study's approach:

#figure(
  table(
    columns: 2,
    table.header[*Theory*][*Role*],
    [Pattern Recognition Theory @duda2001pattern],
    [Provides the computational paradigm for discovering latent structures],

    [One Health Framework @zinsstag2010onehealth], [Situates AMR within interconnected health systems],
  ),
  caption: [Theoretical Layer Components],
) <tab:theoretical-layer>

=== Conceptual Layer

The supporting concepts that operationalize theoretical principles:

#figure(
  table(
    columns: 2,
    table.header[*Concept*][*Function*],
    [Cluster Validation], [Ensures discovered patterns are meaningful and reproducible],
    [Information Leakage], [Prevents methodological artifacts in performance estimation],
    [Ordinal Data Representation], [Justifies encoding of resistance categories],
    [MDR Definition], [Provides standardized classification criteria],
  ),
  caption: [Conceptual Layer Components],
) <tab:conceptual-layer>

=== Design Layer

The architectural outcomes derived from theoretical constraints:

#figure(
  table(
    columns: 2,
    table.header[*Component*][*Elements*],
    [Layered System Architecture], [Data Layer → Analysis Layer → Presentation Layer],
    [Leakage Prevention Protocol], [Split-Before-Transform, Feature-Metadata Boundary],
    [Validation Architecture], [Unsupervised Discovery → Supervised Validation → Stability Assessment],
  ),
  caption: [Design Layer Components],
) <tab:design-layer>

=== Framework Integration

The three layers form a coherent framework where:
- *Theoretical foundations* provide intellectual justification
- *Conceptual elements* operationalize abstract principles into specific constraints
- *Design decisions* implement these constraints as architectural features
