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
Leg. psykolog och ledare inom hälso- och samhällsområdet. Erfaren i styrning, förändringsledning, arbetsmiljö och kvalitetsarbete. Van vid intressentdialog, tvärprofessionell samverkan, handledning och evidensbaserat beslutsfattande med psykometri och statistik. Innehar valda förtroendeuppdrag på kommunal nivå.

== Kärnkompetenser
- Ledarskap & styrning (arbetsmiljö, patientsäkerhet, policy)
- Förändringsledning & processförbättring
- Klinisk bedömning, behandlingsplanering och uppföljning
- Psykometri, statistik, utvärdering och uppföljning med nyckeltal
- Intressenthantering och samverkan (vård, skola, socialtjänst)
- Kommunikation: handledning, utbildning, media

== Ledarskapserfarenhet

#work(
  title: "Leg. psykolog",
  location: "Hallsberg, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "maj 2024", end-date: "nu"),
)
- Vald skyddsombud; drev arbetsmiljöinsatser och uppföljning tillsammans med ledning och medarbetare.
- Handledde juniora med strukturerad återkoppling och kompetensutveckling.
- Standardiserade arbetssätt för bedömning, prioritering och uppföljning i team.

#work(
  title: "Leg. psykolog",
  location: "Örebro, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "aug 2018", end-date: "apr 2023"),
)
- Ledde förbättringsarbete i patientflöden och vårdkoordination.
- Psykologiskt sakkunnig i tvärprofessionellt team; regelbundna externa presentationer.
- Genomförde utredning och behandling enligt evidens och riktlinjer.

== Styrning & samhällsuppdrag

#extracurriculars(
  activity: "Kommunfullmäktigeledamot; nämndledamot",
  dates: dates-helper(start-date: "2022", end-date: "nu"),
)
- Lokal styrning, policygranskning och intressentdialog med fokus på ansvar, transparens och beslut.

== Projekt & publikationer

#project(
  name: "Uppföljning av välmående i utbildningsmiljö",
  dates: dates-helper(start-date: "2023", end-date: "2024"),
  url: "blog.stark.pub/posts/psychological_research_using_llms",
)
- Operationaliserade efterfrågan–kontroll–stöd-modellen på aggregerade kommunikationsdata; visade konvergent validitet och möjlig nytta för systematisk uppföljning.

#project(
  name: "Vetenskaplig kommunikation",
  dates: dates-helper(start-date: "2022", end-date: "nu"),
  url: "blog.stark.pub",
)
- Författat artiklar, samt deltaigt i media om psykometri, utvärdering, förbättringsarbete och professionell praktik. Fokus på begripliggörande och spridning av evidens.

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
  degree: "Kompletterande studier i systematik och datadriven analys",
)
- Examensarbete: Analys av stressrelaterade mått i studentkommunikation; longitudinell design och modellvalidering.

== Färdigheter
- *Ledning*: arbetsmiljö (OSA), patientsäkerhet, policy & riktlinjer, förändringsledning
- *Kliniskt*: diagnostik, behandlingsplanering, uppföljning, handledning
- *Analys*: psykometri, statistik, studiedesign, utvärdering
- *Kommunikation*: utbildning, presentation, media, klarspråk

