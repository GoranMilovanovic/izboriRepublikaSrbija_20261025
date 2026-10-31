# Could Ipsos Have Obtained Its Numbers by Chance?
### Da li je Ipsos svoje brojke mogao dobiti slučajno?

A statistical analysis of the final Ipsos pre-election poll (22 October 2026) against the official results of the Serbian parliamentary elections of 25 October 2026.

**Author:** Goran S. Milovanović, PhD · [goran.s.milovanovic@gmail.com](mailto:goran.s.milovanovic@gmail.com) · [LinkedIn](https://www.linkedin.com/in/gmilovanovic/)

---

[English](#english) · [Srpski](#srpski)

---

## English

### What this repository contains

Two reports, both written in R Markdown and knitted to self-contained HTML (open the `.html` files in any browser; no installation needed):

| File | What it is |
|---|---|
| [`Ipsos-Izbori-2026.Rmd`](Ipsos-Izbori-2026.Rmd) → [`Ipsos-Izbori-2026.html`](Ipsos-Izbori-2026.html) | **Technical report (English).** The full analysis: data with provenance, every statistical concept explained before it is used, five independent methods, sensitivity analyses, "what would it take" scenarios, references. All code included (hidden behind *Code* buttons). |
| [`Ipsos-Izbori-2026-SR.Rmd`](Ipsos-Izbori-2026-SR.Rmd) → [`Ipsos-Izbori-2026-SR.html`](Ipsos-Izbori-2026-SR.html) | **Summary for the public (Serbian).** A compact, non-technical version in the simplest possible language, with all figures and all essential numbers. The Serbian report links to the English technical report for details. |

Both reports compute every number from the same data and code, so they always agree.

### The question

Three days before the vote, Ipsos Strategic Marketing published its final estimate: *Aleksandar Vučić – Ujedinjena Srbija* 47.4%, *Studentska lista* 40.0% (n = 3,624; commissioned by the *Ujedinjena Srbija* list). The official count by the Republic Electoral Commission (RIK) was *Studentska lista* 53.0%, *Ujedinjena Srbija* 39.0%.

The analysis treats the official result as the true composition of the electorate and asks: **how probable is it that a properly conducted random sample of the people who voted would produce Ipsos's numbers?**

### Main findings

- The gap (13.0 points on one list, 8.4 on the other) is about **12 and 8 standard deviations** of a poll of Ipsos's effective size (≈ 2,110 decided respondents, derived from Ipsos's own published margins of error — the most generous choice for Ipsos).
- The probability that random sampling produces a result at least this far from the truth is about **3 × 10⁻³⁷** (exact multinomial test by importance sampling); every other method and every variant tried lands between **10⁻³⁰ and 10⁻³⁶**. Among two million simulated random polls from the real electorate, none came close.
- By Ipsos's **own** published margin of error, the true *Studentska lista* share lay 10.9 points outside the top of its 95% interval.
- The conclusion does not depend on the assumed sample size (1,500 to 3,624), on whether Kosovo i Metohija and the diaspora are excluded, or on whether invalid ballots are included in the base.
- **What would it take to rescue the poll:** a late swing of about **450,000 voters** to *Studentska lista* within three days; or, if every one of the ~275,000 unexpected extra voters had voted *Studentska*, a further ~300,000 still switching; or a quarter of voters undecided and then voting 92% for one list — and even then the small-list excess remains unexplained.
- The only other published poll (NSPM, fieldwork 25 September – 5 October) also missed in the same direction, but Ipsos's result is about 10²⁴ times less probable than NSPM's.

### What the findings do and do not mean

Sampling error alone **cannot** account for the gap. The analysis does **not** establish *why* the gap exists. The remaining explanations — a very large late swing, a turnout or undecided-voter shift of unusual size, a methodological bias well beyond the other poll's, or the published numbers not reflecting what the survey measured — cannot be separated by statistics, nor can any of them be separated from misreporting. The reports make no claim about intent. Resolving the question requires Ipsos's raw data, weighting scheme, likely-voter model and treatment of undecided respondents.

### Data

- Ipsos Strategic Marketing, press release of 22 October 2026 ([web](https://www.ipsos.com/sr-rs/rezultati-istrazivanja-pred-parlamentarne-izbore-oktobar-2026)).
- Republička izborna komisija, [results portal](https://www.rik.parlament.gov.rs/542645/rezultati/), snapshot of 31 October 2026, 11:00 CET (8,339 of 8,392 polling stations; **preliminary**). Regional sub-totals for Kosovo i Metohija and abroad from the same portal.
- NSPM, *Srbija, jesen 2026 (I)*, fieldwork 25 September – 5 October 2026.

All inputs are hard-coded in Section 3 of the technical report, with provenance. When RIK publishes the final results, re-enter them there and re-knit; every number in both reports updates automatically.

### Reproducing

R ≥ 4.4 with `rmarkdown`, `knitr`, `pmultinom`, `ggplot2`, `dplyr`, `tidyr`, `tibble`, `purrr`, `kableExtra`, `scales` (the technical report installs any missing package on first knit). Then:

```r
rmarkdown::render("Ipsos-Izbori-2026.Rmd")
rmarkdown::render("Ipsos-Izbori-2026-SR.Rmd")
```

Knitting takes a few minutes (two Monte Carlo simulations of 2 million polls and an importance-sampling run of 10 million). Results are seeded and reproducible. Knit in a UTF-8 locale so that Serbian diacritics render correctly.

### Citing

*Milovanović, G. S. (2026). Could Ipsos Have Obtained Its Numbers by Chance? A multinomial probability analysis of the final Ipsos pre-election poll against the official results of the 2026 Serbian parliamentary elections.* With a link to this repository.

---

## Srpski

### Šta se nalazi u ovom repozitorijumu

Dva izveštaja, oba napisana u R Markdownu i pretvorena u samostalne HTML dokumente (otvorite `.html` fajl u bilo kom pregledaču; nije potrebna nikakva instalacija):

| Fajl | Šta je to |
|---|---|
| [`Ipsos-Izbori-2026.Rmd`](Ipsos-Izbori-2026.Rmd) → [`Ipsos-Izbori-2026.html`](Ipsos-Izbori-2026.html) | **Tehnički izveštaj (engleski).** Potpuna analiza: podaci sa izvorima, svaki statistički pojam objašnjen pre upotrebe, pet nezavisnih metoda, provere osetljivosti, scenariji „šta bi bilo potrebno“, literatura. Sav kod je uključen (sakriven iza dugmadi *Code*). |
| [`Ipsos-Izbori-2026-SR.Rmd`](Ipsos-Izbori-2026-SR.Rmd) → [`Ipsos-Izbori-2026-SR.html`](Ipsos-Izbori-2026-SR.html) | **Sažetak za javnost (srpski).** Kratka, netehnička verzija na najjednostavnijem mogućem jeziku, sa svim graficima i svim bitnim brojevima. Srpski izveštaj upućuje na engleski tehnički izveštaj za detalje. |

Oba izveštaja računaju sve brojeve iz istih podataka i istog koda, pa se uvek slažu.

### Pitanje

Tri dana pred izbore, agencija Ipsos Strategic Marketing objavila je završnu procenu: *Aleksandar Vučić – Ujedinjena Srbija* 47,4%, *Studentska lista* 40,0% (n = 3.624; naručilac: lista *Ujedinjena Srbija*). Zvanični rezultat Republičke izborne komisije (RIK): *Studentska lista* 53,0%, *Ujedinjena Srbija* 39,0%.

Analiza uzima zvanični rezultat kao stvarni sastav biračkog tela i pita: **kolika je verovatnoća da ispravno sproveden slučajan uzorak ljudi koji su glasali dâ Ipsosove brojke?**

### Glavni nalazi

- Razlika (13,0 poena za jednu i 8,4 za drugu listu) iznosi oko **12 odnosno 8 standardnih devijacija** ankete Ipsosove stvarne veličine (≈ 2.110 opredeljenih ispitanika, izvedeno iz Ipsosovih sopstvenih objavljenih raspona greške — izbor najpovoljniji za Ipsos).
- Verovatnoća da slučajan uzorak dâ rezultat bar ovoliko udaljen od istine iznosi oko **3 × 10⁻³⁷** (tačan multinomni test uzorkovanjem po važnosti); svaki drugi metod i svaka isprobana varijanta daju između **10⁻³⁰ i 10⁻³⁶**. Od dva miliona simuliranih slučajnih anketa iz stvarnog biračkog tela, nijedna nije ni blizu.
- Po Ipsosovom **sopstvenom** objavljenom rasponu greške, stvarni udeo *Studentske liste* bio je 10,9 poena iznad gornje granice njegovog intervala od 95%.
- Zaključak ne zavisi od pretpostavljene veličine uzorka (od 1.500 do 3.624), od toga da li se isključe Kosovo i Metohija i dijaspora, niti od toga da li se nevažeći listići računaju u osnovu.
- **Šta bi „spaslo“ anketu:** kasni preokret od oko **450.000 birača** ka *Studentskoj listi* u tri dana; ili, čak i da je svaki od ~275.000 neočekivanih dodatnih glasača glasao za *Studentsku listu*, još ~300.000 koji menjaju mišljenje; ili četvrtina neodlučnih birača koja potom glasa 92% za jednu listu — a ni tada višak kod malih lista ne može da se objasni.
- Jedina druga objavljena anketa (NSPM, terenski rad 25. septembar – 5. oktobar) takođe je promašila u istom smeru, ali je Ipsosov rezultat oko 10²⁴ puta manje verovatan od NSPM-ovog.

### Šta nalazi znače, a šta ne

Slučajna greška uzorka **ne može** objasniti razliku. Analiza **ne utvrđuje** *zašto* je razlika nastala. Preostala objašnjenja — veoma veliki kasni preokret, neuobičajeno veliki pomak u izlaznosti ili među neodlučnima, metodološka pristrasnost znatno veća od one u drugoj anketi, ili to da objavljene brojke ne odražavaju ono što je anketa izmerila — statistika ne može da razdvoji, niti bilo koje od njih od pogrešnog izveštavanja. Izveštaji ne iznose nikakvu tvrdnju o namerama. Razrešenje zahteva Ipsosove sirove podatke, shemu ponderisanja, model verovatnih glasača i postupanje sa neodlučnima.

### Podaci

- Ipsos Strategic Marketing, saopštenje od 22. oktobra 2026 ([veb](https://www.ipsos.com/sr-rs/rezultati-istrazivanja-pred-parlamentarne-izbore-oktobar-2026)).
- Republička izborna komisija, [portal rezultata](https://www.rik.parlament.gov.rs/542645/rezultati/), stanje 31. oktobar 2026, 11:00 (8.339 od 8.392 biračkih mesta; **preliminarno**). Regionalni zbirovi za Kosovo i Metohiju i inostranstvo sa istog portala.
- NSPM, *Srbija, jesen 2026 (I)*, terenski rad 25. septembar – 5. oktobar 2026.

Svi ulazni podaci uneti su u Odeljku 3 tehničkog izveštaja, sa izvorima. Kad RIK objavi konačne rezultate, dovoljno ih je tamo uneti i ponovo pokrenuti; svi brojevi u oba izveštaja ažuriraju se automatski.

### Ponovno pokretanje

R ≥ 4.4 sa paketima `rmarkdown`, `knitr`, `pmultinom`, `ggplot2`, `dplyr`, `tidyr`, `tibble`, `purrr`, `kableExtra`, `scales` (tehnički izveštaj sam instalira pakete koji nedostaju). Zatim:

```r
rmarkdown::render("Ipsos-Izbori-2026.Rmd")
rmarkdown::render("Ipsos-Izbori-2026-SR.Rmd")
```

Izrada traje nekoliko minuta (dve simulacije od po dva miliona anketa i uzorkovanje po važnosti od deset miliona). Rezultati su reproducibilni. Pokrenite u UTF-8 okruženju da bi se dijakritici ispravno prikazali.

### Citiranje

*Milovanović, G. S. (2026). Could Ipsos Have Obtained Its Numbers by Chance? A multinomial probability analysis of the final Ipsos pre-election poll against the official results of the 2026 Serbian parliamentary elections.* Uz link ka ovom repozitorijumu.

---

**Kontakt / Contact:** Goran S. Milovanović, PhD · [goran.s.milovanovic@gmail.com](mailto:goran.s.milovanovic@gmail.com) · [linkedin.com/in/gmilovanovic](https://www.linkedin.com/in/gmilovanovic/)
