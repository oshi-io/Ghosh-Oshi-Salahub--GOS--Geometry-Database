# Ghosh–Oshi–Salahub (GOS) Geometry Database

**Computational chemistry reference data developed through research at the University of Calgary, Canada**

The **Ghosh–Oshi–Salahub (GOS) Geometry Database** is a research-oriented archive of molecular and atomic computational records used in the development and benchmarking of density functional theory (DFT) exchange–correlation functionals. The repository is intended to preserve the underlying calculation inputs, outputs, and execution scripts in a browsable form for reference, methodological comparison, and future computational research.

The archive accompanies work by **Sankha Ghosh, Amr Oshi, and Dennis R. Salahub** on a generalized gradient approximation (GGA) exchange functional and on new full-range and range-separated screened hybrid functionals [1, 2]. It is associated with research conducted at the **University of Calgary**; this affiliation does not, by itself, imply that the repository is an official university-maintained service.

> **Terminology:** **GOS** may refer to the exchange functional described in the earlier study [1]. **GOS-0**, introduced explicitly in the later study [2], is the *Ghosh–Oshi–Salahub-0 thermochemical benchmark database*. This repository is the broader archive of calculation records underlying these research datasets; the functional and the database are distinct concepts.

## Research background

The 2025 study, **“Toward Versatility: A Flexible Generalized Gradient Approximation Exchange Functional”** [1], introduced and assessed the GOS exchange functional in comparisons with established approaches, including PBE and Wu–Cohen (WC), for molecular thermochemistry, transition-metal systems, and selected solid-state properties. Its supporting information includes the earlier **G2** and transition-metal benchmark nomenclature, together with tabulated reference and computed properties.

The 2026 study, **“New Range-Separated Screened and Full-Range Hybrid Functionals”** [2], investigated full-range hybrids and screened, range-separated hybrids built using G96 and WC exchange with PBE or LYP correlation. It defined the **GOS-0** collection (Table II) to compare atomization energies, ionization potentials, electron affinities, proton affinities, and transition-metal bond dissociation energies. The supporting information provides the computational details and property tables used for these assessments. The study also describes use of a Python-based **Lightweight Geometry Wrapper (LGW)** interface with deMon2k for input generation, energy extraction, and thermochemical evaluation.

## Repository contents

The deposited calculations are organized into three principal directory groups:

| Repository directory | Scientific scope | Relation to the published naming |
| --- | --- | --- |
| `G2-AUG-CC-PVTZ-AE-EA-PA-IP/` | Main-group and organic systems evaluated for atomization energies (AE), electron affinities (EA), proton affinities (PA), and ionization potentials (IP). | Earlier **G2** nomenclature; represented in GOS-0 by the four **GOS-ORG** subsets below. |
| `TC-AUG-CC-PVTZ-BDE/` | Transition-metal-containing systems evaluated for bond dissociation energies (BDE), including the transition-metal compound benchmarks used in the earlier study. | Related to the transition-metal BDE records consolidated under **GOS-TM-BDE24** in the 2026 paper. |
| `TML-AUG-CC-PVTZ-IP-BDE/` | Transition-metal carbonyl and metallocene/ligand systems evaluated for IP and BDE. | Retains the transition-metal system naming used in the earlier supporting information. Relevant BDE records contribute to the later transition-metal benchmarking; its IP results should **not** be mistaken for a sixth GOS-0 subset. |

**Naming note:** The three directory names are archival/working names and do **not** constitute a one-to-one renaming of the five Table II sub-databases. In particular, the earlier G2 labels are retained at filesystem level for continuity, while the 2026 study uses the canonical `GOS-ORG-*` identifiers. The `TC` and `TML` directories distinguish groups of transition-metal calculations, whereas the 2026 GOS-0 table groups the selected bond dissociation results as `GOS-TM-BDE24`. System-level correspondence should be established using the cited supporting-information tables when comparing versions of the benchmark.

The folder names contain `AUG-CC-PVTZ`, but **the folder name alone is not a definitive basis-set declaration for every system**. As described in the 2026 supporting information, the GOS-ORG calculations employed **aug-cc-pVTZ**, while systems containing heavy atoms used the **Stuttgart–Dresden effective core potential (ECP)** together with a **DZVP valence basis** [2]. Check each `deMon.inp` file and the corresponding output before reproducing a result.

### Files within calculation directories

Individual calculation directories may contain:

| File | Purpose |
| --- | --- |
| `deMon.inp` | deMon2k input specification, including the molecular system and computational settings. |
| `deMon.out` | Program output for the corresponding calculation; may contain total energies, convergence information, and other computational results. |
| `job.sh` or other job file | Batch submission or execution instructions for the original computing environment. |
| Other files, when present | Supplementary calculation artifacts or derived results; consult their local context before use. |

These files are preserved as *research records*. Their presence does not imply successful convergence, suitability for every downstream analysis, or independent validation of every result. Execution scripts may contain HPC-specific settings that require adaptation to other systems.

## The GOS-0 benchmark database

**GOS-0**, as defined in **Table II of Ghosh, Oshi, and Salahub (2026)** [2], consists of the following five property-based sub-databases:

| No. | Published code | Property | Scope |
| ---: | --- | --- | --- |
| 1 | `GOS-ORG-AE52` | Atomization energies (AE) | Organic molecules and small main-group species |
| 2 | `GOS-ORG-IP30` | Ionization potentials (IP) | Main-group organic and inorganic atoms/molecules |
| 3 | `GOS-ORG-EA24` | Electron affinities (EA) | Main-group organic and inorganic atoms/molecules |
| 4 | `GOS-ORG-PA6` | Proton affinities (PA) | Small organic and main-group molecules |
| 5 | `GOS-TM-BDE24` | Bond dissociation energies (BDE) | Transition-metal-containing species |

The numeric suffixes identify the sizes of the **published property sets**, not necessarily the number of distinct geometries or individual calculation folders. Evaluating a property can require calculations for multiple neutral, ionic, atomic, or fragment species.

**Relationship to the deposited folders:** The GOS-0 entries are the published organization of the benchmark material represented in the repository's G2 and transition-metal calculation groups. The earlier supporting information uses G2 and separate transition-metal conventions, while the 2026 paper aggregates selected records under the five GOS-0 codes. Consult the published tables and original input files when matching a particular geometry or result to a benchmark entry; do not infer equivalence solely from similar folder or molecule names.

## Exchange–correlation functionals

The calculations compare local-density, GGA, full-range hybrid, and screened range-separated hybrid approximations. The following summary follows **Table I** of the 2026 paper [2]. `a` is the fraction of Hartree–Fock exchange (HFX); for screened hybrids it is applied to the short-range component. `ω` is the range-separation parameter in Å⁻¹. A dash denotes a parameter that is not applicable to that functional family.

| Functional | Family | Exchange component | Correlation component | HFX `a` | `ω` (Å⁻¹) |
| --- | --- | --- | --- | ---: | ---: |
| `PZ81` | LSDA | PZ81 | PZ81 | — | — |
| `GLYP` | GGA | G96 | LYP | — | — |
| `GPBE` | GGA | G96 | PBE | — | — |
| `PBE` | GGA | PBE | PBE | — | — |
| `WC` | GGA | WC | PBE | — | — |
| `WCLYP` | GGA | WC | LYP | — | — |
| `GLYP0` | Full-range hybrid | G96 | LYP | 0.08* | — |
| `GPBE0` | Full-range hybrid | G96† | PBE | 0.08* | — |
| `PBE0` | Full-range hybrid | PBE | PBE | 0.25 | — |
| `WC0` | Full-range hybrid | WC | PBE | 0.08* | — |
| `WCLYP0` | Full-range hybrid | WC | LYP | 0.08* | — |
| `GSG2` | Screened hybrid | short-range G96 | PBE | 0.25 | 0.11 |
| `GS2` | Screened hybrid | short-range WC | PBE | 0.25 | 0.11 |
| `GSGLYP2` | Screened hybrid | short-range G96 | LYP | 0.25 | 0.11 |
| `GSLYP2` | Screened hybrid | short-range WC | LYP | 0.25 | 0.11 |
| `HSE06` | Screened hybrid | short-range PBE | PBE | 0.25 | 0.11 |

\* **Full-range hybrid mixing:** Table I presents `a = 0.08` for the four non-PBE0 full-range hybrids in its illustrated comparison. The study's parameter sweep also considered **0.08, 0.16, 0.25, and 0.30**, with the parent GGA at `a = 0`; consequently, a functional folder name alone may not identify the mixing fraction used for every calculation. Refer to the individual input/output files and study tables.

† **Table transcription note:** The printed Table I lists `G69` for the exchange component of `GPBE0`, whereas the paper's surrounding text describes it as using **G96** exchange. The table here follows the prose interpretation rather than silently reproducing that apparent inconsistency. Likewise, Table I labels the screened PBE comparator `HSE0`, while the text and supporting information use **HSE06**; this README uses `HSE06`.

### Why these functionals are included

- **PZ81** provides an LSDA baseline.
- **GLYP, GPBE, PBE, WC, and WCLYP** compare alternative GGA exchange–correlation combinations.
- **GLYP0, GPBE0, PBE0, WC0, and WCLYP0** test the influence of full-range HFX mixing.
- **GSG2, GS2, GSGLYP2, GSLYP2, and HSE06** compare short-range HFX and screened/range-separated exchange across different parent GGA choices.

Together, these methods support comparative assessment of calculated thermochemical properties against experimental or high-level reference values, typically reported using metrics such as the **mean absolute error (MAE)**. The 2026 work also studies the dependence of full-hybrid performance on the HFX mixing fraction [2].

## Calculation methods and interpretation

As detailed in the publications and their supporting information [1, 2]:

- Molecular calculations used spin-unrestricted Kohn–Sham DFT, geometry optimization, and frequency calculations in **deMon2k**, including a development version used for the studied functional implementations.
- **aug-cc-pVTZ** was used for the organic/main-group benchmark; **Stuttgart–Dresden ECP + DZVP** was used for heavy-atom systems in the later study.
- Reported thermochemical comparisons incorporate **zero-point energy corrections**, as specified in the supporting information.
- Some properties, especially BDEs, are constructed from energies of multiple components with defined charges and spin multiplicities. The corresponding reaction definitions are provided in the supporting-information tables.

For reproducibility, preserve each calculation's input, associated output, molecular charge, spin multiplicity, actual functional parameters, basis/ECP selection, program version, and any relevant job configuration. **Do not assume that all archived jobs converged successfully**; inspect the output and numerical results before using them in a benchmark.

## Using and citing this repository

This repository is intended as a **reference archive**, not as a replacement for the published articles and supporting information. When reporting calculations or benchmark comparisons, cite the relevant primary publications below, specify the repository commit or release used, and identify the actual computational settings.

## References

1. **Ghosh, S.; Oshi, A.; Salahub, D. R.** “Toward Versatility: A Flexible Generalized Gradient Approximation Exchange Functional.” *Journal of Chemical Theory and Computation* **2025**, *21* (19), 9234–9238. https://doi.org/10.1021/acs.jctc.5c01375. See the associated supporting information for the earlier G2, transition-metal IP/BDE, and other benchmark nomenclature.

2. **Ghosh, S.; Oshi, A.; Salahub, D. R.** “New Range-Separated Screened and Full-Range Hybrid Functionals.” *The Journal of Chemical Physics* **2026**, *164*, 111102. https://doi.org/10.1063/5.0322935. See **Table I** (functionals), **Table II** (GOS-0 subsets), and the associated supporting information for computational details and benchmark tables.
