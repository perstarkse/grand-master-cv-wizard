#import "@preview/basic-resume:0.2.9": *

#let name = "Per Stark"
#let location = "Örebro, SE"
#let email = "per@stark.pub"
#let github = "github.com/perstarkse"
#let linkedin = "linkedin.com/in/per-stark"
#let phone = "+46 760276752"
#let personal-site = "blog.stark.pub"

#show: resume.with(
  author: name,
  location: location,
  email: email,
  github: github,
  linkedin: linkedin,
  phone: phone,
  personal-site: personal-site,
  accent-color: "#26428b",
  font: "New Computer Modern",
  paper: "us-letter",
  author-position: left,
  personal-info-position: left,
)

== Sammanfattning
Fullstackutvecklare med bakgrund i psykologi och tillämpad forskning. Erfaren i Rust, NixOS, infra som kod och LLM-drivna applikationer. Levererat produktionsfunktioner (AI-översättning, flerspråkig LMS) och byggt reproducerbar infrastruktur (hemligheter, backup, deploypipelines). Van vid Rust (Axum, HTMX), Python, JavaScript och moln (AWS). Stark teknisk skrivförmåga, ledarskap och tvärdisciplinärt problemlösande.

== Projekt

#project(
  name: "Minne",
  dates: dates-helper(start-date: "sep 2024", end-date: "nu"),
  url: "github.com/perstarkse/minne",
)
- Självhostad, graf-driven PKB. Rust SSR + HTMX. Automatisk entitets-/relationsextraktion via OpenAI API, chatt över egna data, visuell kunskapsgraf, och paketering (binaries/Docker/Nix).

#project(
  name: "Infra",
  dates: dates-helper(start-date: "jan 2023", end-date: "nu"),
  url: "github.com/perstarkse/infra",
)
- Deklarativ infrastruktur med Nix flakes för router/server/workstation. Reproducerbara hemligheter, backup, övervakning, WireGuard, nginx samt deploypipeline för Minne och relaterade tjänster.

#project(
  name: "Teknisk blogg",
  dates: dates-helper(start-date: "2022", end-date: "nu"),
  url: "blog.stark.pub",
)
- 10+ djupgående inlägg om Rust, NixOS, teknik och tillämpad AI. Offentliga konfigurationer och guider som referens för praktiker.

== Färdigheter
- *Språk*: Rust, Python, JavaScript, HTML/CSS
- *Infra/OS*: NixOS/Nix, Linux, Docker, WireGuard, nginx
- *Data/AI*: LLM-prompting/RAG, statistik
- *Verktyg*: Git, CI/CD, HTMX, Axum, Zola, AWS

== Arbetslivserfarenhet

#work(
  title: "Fullstackutvecklare",
  location: "Örebro, SE",
  company: "TIQQE AB",
  dates: dates-helper(start-date: "apr 2023", end-date: "mar 2024"),
)
- Byggde AI-översättning med AWS Translate + LLMs; skalerade LMS 2 → 8+ språk och minskade manuellt arbete.
- Tech- och kundnära lead: roadmap, krav och demovisningar.
- Drev AI-införande via interna föredrag (LLMs/RAG) och externa strategisessioner.

#work(
  title: "Leg. Psykolog",
  location: "Hallsberg, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "maj 2024", end-date: "nu"),
)
- Strukturerad, evidensbaserad problemlösning i komplexa miljöer.
- Vald skyddsombud; handledde juniora kollegor.

#work(
  title: "Leg. Psykolog",
  location: "Örebro, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "aug 2018", end-date: "apr 2023"),
)
- Ledde bedömningar och förbättrade flöden för vårdkoordination.
- Ämnesansvar i team; återkommande medverkan i media.

== Utbildning
#edu(
  institution: "EC Utbildningar",
  location: "Distans, SE",
  dates: dates-helper(start-date: "aug 2022", end-date: "jun 2024"),
  degree: "Fullstackutvecklare (.NET)",
)
- Examensarbete: LLM-baserad extraktion av stressmått från studentchattar; longitudinell statistik och modellvalidering.

#edu(
  institution: "Örebro universitet",
  location: "Örebro, SE",
  dates: dates-helper(start-date: "aug 2011", end-date: "jun 2016"),
  degree: "Psykologexamen, master i psykologi",
)
- Examensarbete: Psykometri för mått på handledningskvalitet; datadrivet mentorskap och lärande.

== Förtroendeuppdrag
#extracurriculars(
  activity: "Kommunfullmäktigeledamot; nämndledamot",
  dates: dates-helper(start-date: "2022", end-date: "nu"),
)
- Lokal styrning och utskottsarbete (ledarskap, policygranskning, intressentkoordination)

