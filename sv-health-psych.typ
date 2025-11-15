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
Leg. psykolog med erfarenhet av psykologisk bedömning, evidensbaserad behandling, förbättringsarbete och arbetsmiljö/styrning. Van vid tvärprofessionellt samarbete och handledning. Stark analytisk profil med psykometri, statistik och tillämpad AI för forskning och kvalitetsarbete.

== Kärnkompetenser
- Klinisk bedömning och diagnostik
- Evidensbaserad behandling och uppföljning
- Förbättringsarbete och processdesign
- Handledning och teamarbete
- Psykometri, statistik och studiedesign
- Arbetsmiljö, patientsäkerhet och styrning
- Vetenskaplig och extern kommunikation

== Arbetslivserfarenhet

#work(
  title: "Leg. psykolog",
  location: "Hallsberg, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "maj 2024", end-date: "nu"),
)
- Strukturerad, evidensbaserad problemlösning i komplex vårdmiljö.
- Vald skyddsombud; drev arbetsmiljöinsatser med ledning och medarbetare.
- Handledde juniora kollegor med systematisk feedback och kunskapsdelning.

#work(
  title: "Leg. psykolog",
  location: "Örebro, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "aug 2018", end-date: "apr 2023"),
)
- Psykologisk utredning och behandling enligt evidens.
- Utformade nya arbetsflöden för förbättrad vårdkoordination.
- Psykologiskt sakkunnig i tvärprofessionellt team; återkommande externa presentationer.

== Utbildning
#edu(
  institution: "Örebro universitet",
  location: "Örebro, SE",
  dates: dates-helper(start-date: "aug 2011", end-date: "jun 2016"),
  degree: "Psykologexamen, master i psykologi",
)
- Examensarbete: Psykometrisk utveckling av mått på handledningskvalitet; datadrivet mentorskap och arbetsplatslärande.

#edu(
  institution: "EC Utbildningar",
  location: "Distans, SE",
  dates: dates-helper(start-date: "aug 2022", end-date: "jun 2024"),
  degree: "Fullstackutvecklare (.NET)",
)
- Examensarbete: LLM-baserad extraktion av stressmått från studentchattar; longitudinell analys och modellvalidering.

== Projekt & publikationer

#project(
  name: "Studie: LLM för psykologiska mått i chattdata",
  dates: dates-helper(start-date: "2023", end-date: "2024"),
  url: "blog.stark.pub/posts/psychological_research_using_llms",
)
- Operationaliserade efterfrågan–kontroll–stöd-modellen på aggregerade chattdata; visade konvergent validitet och praktisk användbarhet för uppföljning av välmående.

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
- Ledde AI-översättningsfunktion (AWS Translate + LLM) i produktion; visar förmåga att omsätta data/AI till verksamhetsnytta som kan överföras till hälso- och sjukvård.

== Färdigheter
- *Kliniskt*: bedömning, diagnostik, behandlingsplanering, handledning
- *Analys*: psykometri, statistik, studiedesign; Python för dataanalys; LLM/AI i forsknings- och kvalitetsarbete
- *Samarbete & styrning*: tvärprofessionellt arbete, förbättringsarbete, arbetsmiljö/säkerhet, extern kommunikation
