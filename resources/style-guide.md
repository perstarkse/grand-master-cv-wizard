# Style Guide for CVs and Profiles

This file captures preferred tone, phrasing and patterns so tailored CVs stay consistent with how you actually write.

## Tone & General Principles
- Prefer concrete, verifiable statements over vague claims.
- Lead with actions and outcomes: *verb + scope + effect*.
- Avoid self-evaluative phrases like “shows great ability to…”; instead, describe what you did and what changed.
- Keep sentences relatively compact and information-dense.
- Use domain-appropriate vocabulary for each profile (tech, clinical, governance, data).

## Swedish CV phrasing

### Verbs to prefer (examples)
- Clinical/health:
  - “genomförde psykologisk utredning och behandling…”
  - “bedömde, prioriterade och följde upp insatser…”
  - “konsulterade team och samverkansparter…”
  - “handledde juniora kollegor / gav metodstöd…”
- Data/mikrodata:
  - “designade analysplan…”
  - “genomförde statistiska analyser…”
  - “kvalitetssäkrade datamaterial och dokumentation…”
  - “operationaliserade [modell/begrepp] på aggregerade data…”
- Tech/infra:
  - “designade och implementerade…”
  - “byggde/konfigurerade [system/tjänst]…”
  - “automatiserade [flöde/backup/deploy]…”
  - “standardiserade arbetssätt för [backup/loggning/secrets]…”
- Governance/ledarskap:
  - “koordinerade…”
  - “granskade policyförslag…”
  - “ledde förbättringsarbete…”
  - “ägde roadmap-dialog och krav…”

### Constructions to avoid
- Avoid “visar vana att…”, “visar förmåga att…”.
  - Prefer “har dokumenterat…”, “omhändertog…”, “utformade…” or simply state the action/effect.
- Avoid overly general statements (“jobbat mycket med data”) without specifying *hur* och *i vilket sammanhang*.

### Patterns to reuse
- “verb + område + kontext”
  - “Genomförde psykologisk utredning och behandling i [miljö].”
  - “Designade analysplan för [typ av data/studie].”
- “verb + resultat”
  - “Skalerade LMS från 2 → 8+ språk och minskade manuellt arbete.”
  - “Standardiserade arbetsflöden för [process], vilket gav [effekt]” (effekt bara där den är sann och känd).

## English CV phrasing

### Verbs to prefer
- “designed”, “implemented”, “built”, “scaled”, “standardised”, “coordinated”, “led”, “mentored”, “evaluated”, “analysed”.
- For research/data: “operationalised”, “designed the analysis plan”, “conducted statistical analyses”, “evaluated validity”.

### Constructions to avoid
- Avoid empty boosters like “world-class”, “excellent”, “outstanding”.
- Prefer neutral, factual phrasing anchored in evidence.

## Section-specific notes

### Summary / Sammanfattning
- 2–4 meningar, tydligt fokus på rolltyp (t.ex. tech, klinik, data/analys, styrning).
- Lyfter:
  - bakgrund (psykologi + system/AI),
  - domänspecifik erfarenhet (t.ex. klinik eller myndighet),
  - data-/analyskompetens där relevant,
  - ev. ledarskap/styrning.

### Work Experience / Arbetslivserfarenhet
- 2–4 bullets per roll är normalt; fler bara om de tillför tydligt ny information.
- För kliniska roller: minst en bullet som konkretiserar:
  - utredning/behandling,
  - konsultation/samverkan,
  - uppföljning/struktur.
- För data/mikrodata-roller: minst en bullet som konkretiserar:
  - typ av data (t.ex. textbaserad, registerliknande, administrativa data),
  - metod (statistik, psykometri, regressionsmodeller, etc.),
  - roll i analysarbete (design, genomförande, tolkning).

### Projects / Projekt
- Koppla projekt till:
  - tekniskt innehåll (stack),
  - datahantering (var det finns),
  - ansvar (ägarskap, arkitektur, drift).
- Använd projekten för att ge exempel på “hur du jobbar” snarare än bara vilka tekniker du använder.

## Tagging / Themes (for YAML resources)
- When tagging roles/projects in YAML, prefer stable, reusable tags:
  - `clinical-assessment`, `treatment`, `consultation`, `health-and-safety`
  - `data-analysis`, `microdata`, `register-data`, `longitudinal-analysis`
  - `ai-llm`, `infra`, `backups`, `secrets-management`, `governance`, `policy-review`
- Tags should describe *what you did*, not just tools (`python` vs `data-analysis+python`).

