// Section 6.5: Co-resistance Analysis
== Co-resistance Pattern Analysis <sec:coresistance-analysis>

=== Phi Coefficient Analysis

Co-resistance relationships between antibiotic pairs were quantified using Phi coefficients, with significance determined via chi-square testing @martiny2024coabundance. Pairs exhibiting Phi > 0.3 and p \\< 0.001 were considered statistically significant co-resistance associations.

#figure(
  table(
    columns: 3,
    table.header[*Antibiotic Pair*][*Phi Coefficient*][*p-value*],
    [Doxycycline -- Tetracycline], [0.806], [$<$ 0.001],
    [Ampicillin -- Amoxicillin-Clavulanate], [0.621], [$<$ 0.001],
    [Ciprofloxacin -- Levofloxacin], [0.584], [$<$ 0.001],
    [Gentamicin -- Amikacin], [0.473], [$<$ 0.001],
    [Ampicillin -- Ceftriaxone], [0.398], [$<$ 0.001],
  ),
  caption: [Top Significant Co-resistance Pairs],
) <tab:coresistance-pairs>

The strongest co-resistance association was observed between doxycycline and tetracycline (Phi = 0.806), reflecting shared resistance mechanisms via ribosomal protection proteins and efflux pumps @wang2022tetx4.

=== Co-resistance Network

Network analysis revealed hub antibiotics with high connectivity, indicating they frequently co-occur with resistance to multiple other agents. These hub positions suggest potential targets for resistance surveillance prioritization.

Key findings from the network topology:
- *Ampicillin* exhibited the highest degree centrality, connecting to 8 other resistance phenotypes
- Fluoroquinolone resistance (ciprofloxacin, levofloxacin) formed a tightly connected subnetwork
- Carbapenem-aminoglycoside co-resistance was observed in 15.3% of MDR isolates

=== Clinical Implications

The identified co-resistance patterns have direct implications for empirical therapy selection. The strong tetracycline-doxycycline linkage suggests that resistance to one tetracycline should prompt consideration of alternative therapies across the class. Similarly, fluoroquinolone co-resistance patterns align with mechanistic understanding of efflux-mediated cross-resistance @shariati2022fqmechanisms.
