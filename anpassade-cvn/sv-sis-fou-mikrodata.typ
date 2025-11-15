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
Leg. psykolog med stark analytisk profil och erfarenhet av datadriven uppföljning, psykometri och kvantitativ metod. Van vid att arbeta med känsliga personuppgifter i reglerad vårdmiljö och omsätta data till beslutsunderlag för kvalitet, patientsäkerhet och styrning. Har utvecklat och analyserat mikrodata-liknande material (text- och registernära data) i forsknings- och utvecklingsprojekt med fokus på metod, validitet och tolkning av resultat.

== Kärnkompetenser
- Datadriven uppföljning, statistik och kvantitativ metod
- Psykometri, studiedesign och analysplanering
- Hantering av känsliga personuppgifter (GDPR, sekretess i vård)
- Förbättringsarbete, processdesign och kvalitetssäkring
- Tvärprofessionellt samarbete och metodstöd
- Vetenskaplig, teknisk och extern kommunikation
- Klinisk bedömning, diagnostik och behandlingsuppföljning

== Arbetslivserfarenhet

#work(
  title: "Leg. psykolog",
  location: "Hallsberg, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "maj 2024", end-date: "nu"),
)
- Psykologisk utredning och behandling, konsultation till team och samverkansparter samt uppföljning av insatser.
- Vald skyddsombud; drev arbetsmiljöinsatser och uppföljning tillsammans med ledning och medarbetare.
- Handledde juniora kollegor och gav metodstöd kring bedömning, prioritering och uppföljning.

#work(
  title: "Leg. psykolog",
  location: "Örebro, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "aug 2018", end-date: "apr 2023"),
)
- Psykologisk utredning och behandling enligt evidens; strukturerad journalföring och systematisk uppföljning.
- Utformade och dokumenterade arbetsflöden för förbättrad vårdkoordination – fokus på kvalitet, rättssäkerhet och likvärdig hantering av ärenden.
- Psykologiskt sakkunnig i tvärprofessionellt team; återkommande externa presentationer av resultat och arbetssätt.

== Utbildning
#edu(
  institution: "Örebro universitet",
  location: "Örebro, SE",
  dates: dates-helper(start-date: "aug 2011", end-date: "jun 2016"),
  degree: "Psykologexamen, master i psykologi",
)
- Examensarbete: Psykometrisk utveckling av mått på handledningskvalitet; konstruktion, analys och validering av skalor för systematisk uppföljning.

#edu(
  institution: "EC Utbildningar",
  location: "Distans, SE",
  dates: dates-helper(start-date: "aug 2022", end-date: "jun 2024"),
  degree: "Fullstackutvecklare (.NET)",
)
- Examensarbete: LLM-baserad extraktion av stressmått från studentchattar; konstruktion av mikrodata-liknande dataset, longitudinell analys och modellvalidering.

== Projekt & publikationer

#project(
  name: "Studie: LLM för psykologiska mått i chattdata",
  dates: dates-helper(start-date: "2023", end-date: "2024"),
  url: "blog.stark.pub/posts/psychological_research_using_llms",
)
- Operationaliserade efterfrågan–kontroll–stöd-modellen på aggregerade chattdata; designade analysplan, genomförde statistiska analyser och utvärderade validitet samt möjligheter till löpande uppföljning av välmående.

#project(
  name: "Tekniska och forskningsnära blogginlägg",
  dates: dates-helper(start-date: "2022", end-date: "nu"),
  url: "blog.stark.pub",
)
- Skrivit artiklar om säker datahantering (GPG/pass), reproducerbara analysflöden (Markdown/Pandoc med Python) och databasanvändning i webbtjänster (Rust/Axum m.fl.); har dokumenterat metoder, strukturerat dataflöden och gjort komplex teknik begriplig.

== Förtroendeuppdrag

#extracurriculars(
  activity: "Kommunfullmäktigeledamot; nämndledamot",
  dates: dates-helper(start-date: "2022", end-date: "nu"),
)
- Lokal styrning, policygranskning och intressentkoordination med fokus på ansvar, transparens och beslut.

== Övrig erfarenhet

#work(
  title: "Fullstackutvecklare (kundnära lead)",
  location: "Örebro, SE",
  company: "TIQQE AB",
  dates: dates-helper(start-date: "apr 2023", end-date: "mar 2024"),
)
- Ledde AI-översättningsfunktion (AWS Translate + LLM) i produktion; omsatte data/AI till konkret verksamhetsnytta och byggde robusta dataflöden.

== Färdigheter
- *Data & analys*: psykometri, statistik, kvantitativ metod, studiedesign; Python för dataanalys; erfarenhet av att arbeta med mikrodata-liknande material (text-/registernära data)
- *Dataskydd & kvalitet*: vana vid hantering av känsliga personuppgifter i vård, sekretess och GDPR, dokumentation och kvalitetssäkring av arbetsflöden
- *Verktyg & miljö*: Linux, Git, Markdown/Pandoc för rapporter, GPG/pass för säker hantering av hemligheter
- *Kliniskt*: bedömning, diagnostik, behandlingsplanering, uppföljning, handledning
- *Samarbete & styrning*: tvärprofessionellt arbete, förbättringsarbete, arbetsmiljö/säkerhet, extern och vetenskaplig kommunikation
