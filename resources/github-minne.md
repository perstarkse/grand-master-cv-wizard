# Repo: minne
- URL: https://github.com/perstarkse/minne
- Stars (at snapshot): 154
- Last-synced: 2025-11-15
- Tags: rust, axum, htmx, surrealdb, graph, vector-search, ai, ssr, self-hosted, personal-knowledge-base

## Summary
Minne är en självhostad, grafdriven personlig kunskapsbas och “save-for-later”-applikation inspirerad av Zettelkasten. Den kombinerar manuellt kuraterad kunskap med AI-assisterad extraktion av entiteter och relationer, samt stöd för både sök och chatt över det egna kunskapslagret. Fokus ligger på kontroll över data, bra prestanda (Rust + SSR) och möjlighet att köra mot valfria OpenAI-kompatibla leverantörer.

## Tech stack
- Backend: Rust med Axum, server-side rendering (SSR)
- Frontend: HTML + HTMX med minimal JavaScript, D3-baserad grafvisualisering
- Databas: SurrealDB (graf + dokument + vektor-sök)
- AI-integration: OpenAI-kompatibla API:er med strukturerade svar; hybridretrieval + opt-in FastEmbed-reranking
- Web scraping och innehållsprocessering: Headless Chrome
- Deploy: Docker Compose, Nix, prebyggda binärer; separata binärer för kombinerat läge (`main`), server och worker

## Responsibilities & scope
- Initierat, designat och implementerat huvudarkitekturen (server, worker, datamodell, retrieval-kedja, grafvisualisering).
- Byggt självhostad deploymodell (Docker Compose + Nix) och dokumenterat konfiguration (env vars, `config.yaml`).
- Implementerat stöd för flera innehållstyper (text, URL:er, PDF, ljud, bilder) och integrerat scraping, analys och grafmodell som ett sammanhängande flöde.
- Ansvarat för releaseflöde (GitHub Releases, release-pipeline) och offentlig dokumentation (README, demo-instans).

## Data / analys / säkerhet
- Modellering av kunskap som entiteter och relationer i SurrealDB (graf, dokument, vektor-sök).
- Design av hybrid retrieval: kombinerad vektorlikhet, fulltextsök och graftraversering; opt-in reranking med FastEmbed-cross-encoder.
- Innehållsprocessering som pipeline: scraping → textanalys → entitet-/relationsbyggande → embeddings → indexering.
- Självhostad och integrerad med OpenAI-kompatibla API:er, vilket ger kontroll över dataplacering och provider-val.

## Evidence / ground-truth claims
- Byggt en grafdriven PKM med SurrealDB som backend (graf/doc/vektor).
- Implementerat hybrid retrieval (vektor + fulltext + graf) och opt-in reranking med FastEmbed.
- Stödjer flera innehållstyper (text, URL, PDF, ljud, bilder) via automatiserad processering.
- Tillhandahåller SSR-baserat webbgränssnitt, chatt över kunskapsbasen och visuell grafexplorer.
- Har Docker Compose-, Nix- och binär-baserade installationsvägar dokumenterade i README.

## CV usage
- **Tech-CV (backend/infra)**  
  - “Designade och implementerade en grafdriven, självhostad PKM i Rust (Axum + SSR) med SurrealDB som graf-/vektordatabas och HTMX-baserat webbgränssnitt.”  
  - “Byggde hybridretrieval (vektor, fulltextsök, graftraversering) med opt-in reranking, samt Docker/Nix-baserad deployment.”

- **Data/mikrodata-CV**  
  - “Utformade datamodell och pipeline för innehållsprocessering (scraping, textanalys, entitets-/relationsutvinning, embedding) i SurrealDB-baserad kunskapsdatabas.”  
  - “Konfigurerade och dokumenterade AI-integration mot OpenAI-kompatibla API:er med strukturerade outputs och parametriserbar embedding-dimension.”

- **Ledarskap/ägarskap**  
  - “Initierade och drev ett open source-projekt (Minne) inklusive arkitektur, dokumentation, releaseflöde och demo-instans för användare.”  
  - “Skrev teknisk dokumentation som gör det möjligt för andra att självhosta och utöka systemet (README, konfigurations-exempel, deploy-vägar).”

