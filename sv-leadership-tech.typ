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
Teknisk ledare med psykologbakgrund. Dokumenterad förmåga i intressenthantering, roadmap-ägarskap, mentorskap och styrning. Ledde AI-funktion i produktion (LMS), drev AI-införande i organisation, och innehar säkerhets- och kommunala ledaruppdrag. Datadriven, hands-on i Rust, NixOS och moln.

== Kärnkompetenser
- Personalledning, mentorskap, coaching
- Intressenthantering, roadmap & leverans
- Styrning, arbetsmiljö/säkerhetsrepresentation
- Tvärfunktionell kommunikation, presentation
- Datainformerade beslut, experiment
- AI/LLM-produktifiering, teknisk dokumentation

== Ledarskapserfarenhet

#work(
  title: "Fullstackutvecklare (kundnära lead)",
  location: "Örebro, SE",
  company: "TIQQE AB",
  dates: dates-helper(start-date: "apr 2023", end-date: "mar 2024"),
)
- Ledde AI-översättning från idé till lansering (AWS Translate + LLMs); skalerade LMS 2 → 8+ språk och reducerade manuellt arbete.
- Ägde roadmap-dialog, krav och demovisningar med kunder och intressenter.
- Drev AI-införande via interna föredrag (LLMs/RAG) och externa strategisessioner.

#work(
  title: "Leg. Psykolog",
  location: "Hallsberg, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "maj 2024", end-date: "nu"),
)
- Vald skyddsombud; koordinerade arbetsmiljöinitiativ med ledning och medarbetare.
- Mentor för juniora; införde strukturerad feedback och kunskapsdelning.
- Evidensbaserade ramverk för komplexa, flerpartsproblem.

#work(
  title: "Leg. Psykolog",
  location: "Örebro, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "aug 2018", end-date: "apr 2023"),
)
- Designade förbättrade arbetsflöden för patienthantering och samordning.
- Ämnesansvar i tvärprofessionellt team; återkommande medieinslag.

== Utvalda projekt

#project(
  name: "Minne",
  dates: dates-helper(start-date: "sep 2024", end-date: "nu"),
  url: "github.com/perstarkse/minne",
)
- Initierade och byggde öppen källkod, graf-driven PKB (Rust SSR + HTMX). Tydlig scope, release-kadens, paketering (binaries/Docker/Nix). LLM-baserad entitets-/relationsanalys och chatt över egna data.

#project(
  name: "Infra",
  dates: dates-helper(start-date: "jan 2023", end-date: "nu"),
  url: "github.com/perstarkse/infra",
)
- Designade reproducerbar Nix-baserad infra för router/server/workstation. Hemligheter, backup, övervakning, WireGuard, nginx och deploypipeline för Minne m.fl.

#project(
  name: "Teknisk blogg",
  dates: dates-helper(start-date: "2022", end-date: "nu"),
  url: "blog.stark.pub",
)
- 15+ djupdykningar i system, Rust, NixOS och tillämpad AI. Visar strukturerad kommunikation och kunskapsöverföring.

== Styrning & samhällsuppdrag

#extracurriculars(
  activity: "Kommunfullmäktigeledamot; nämndledamot",
  dates: dates-helper(start-date: "2022", end-date: "nu"),
)
- Lokal styrning, policygranskning och intressentkoordination.

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

== Färdigheter
- *Ledning & leverans*: intressenthantering, roadmap-ägarskap, mentorskap, styrning, skyddsombud
- *Teknisk bredd*: Rust, Python, JavaScript; NixOS/Nix, Linux, Docker, WireGuard, nginx; HTMX, Axum; AWS
- *Data & AI*: LLM-prompting/RAG, statistik; forskningsmetodik
- *Kommunikation*: teknisk skrivning, presentation, media

