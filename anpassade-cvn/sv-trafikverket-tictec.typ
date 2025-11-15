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
Systemutvecklare med fokus på plattform, utvecklarupplevelse och infra som kod. Erfaren i Linux, containerteknik och automatisering (CI/CD, test, release) samt i att stötta andra team med arbetssätt, verktyg och utbildning. Bakgrund som leg. psykolog med stark analytisk profil, vilket ger vana att driva förändring, kommunicera tydligt och arbeta strukturerat med komplexa problem.

== Arbetslivserfarenhet

#work(
  title: "Fullstackutvecklare (kundnära lead)",
  location: "Örebro, SE",
  company: "TIQQE AB",
  dates: dates-helper(start-date: "apr 2023", end-date: "mar 2024"),
)
- Byggde AI-översättningsfunktion med AWS Translate + LLMs; skalerade LMS från 2 → 8+ språk och minskade manuellt arbete i verksamheten.
- Var kundnära teknisk lead: drev roadmap-dialog, kravfångst och demo/feedback-loopar med beställare och intressenter.
- Arbetade med kvalitet och automatisering kring leveranser (kodgranskning, test, releaseprocesser) tillsammans med teamet.
- Drev AI-införande via interna föredrag (LLMs/RAG) och externa strategisamtal – erfarenhet av att sprida nya arbetssätt och teknik i organisationer.

#work(
  title: "Leg. psykolog",
  location: "Hallsberg, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "maj 2024", end-date: "nu"),
)
- Strukturerad, evidensbaserad problemlösning i komplex vårdmiljö med många intressenter.
- Vald skyddsombud; ansvar för arbetsmiljöfrågor och dialog med ledning – erfarenhet av styrning, processer och uppföljning.
- Handledde juniora kollegor med fokus på lärande, feedback och hållbara arbetssätt.

#work(
  title: "Leg. psykolog",
  location: "Örebro, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "aug 2018", end-date: "apr 2023"),
)
- Psykologisk utredning och behandling enligt evidens och riktlinjer.
- Utformade och förbättrade arbetsflöden för vårdkoordination – erfarenhet av processförbättring och standardisering.
- Psykologiskt sakkunnig i tvärprofessionellt team; återkommande presentationer och medverkan i media.

== Projekt (plattform & utvecklarupplevelse)

#project(
  name: "Minne – grafbaserad personlig kunskapsbas",
  dates: dates-helper(start-date: "sep 2024", end-date: "nu"),
  url: "github.com/perstarkse/minne",
)
- Självhostad, graf-driven PKMS byggd i Rust (SSR) + HTMX, med minimal JS.
- Använder OpenAI API för automatisk extraktion av entiteter och relationer, chatt över egna data och visuell kunskapsgraf.
- Paketerad för enkel drift (binaries, Docker, Nix) – visar erfarenhet av deploybar produkt, containerisering och driftbarhet.

#project(
  name: "Infra – deklarativ homelab/infrastruktur",
  dates: dates-helper(start-date: "jan 2023", end-date: "nu"),
  url: "github.com/perstarkse/infra",
)
- Deklarativ infrastruktur med Nix flakes för router, server och arbetsstationer.
- Hanterar hemligheter, backup, övervakning och deployment pipelines för Minne och andra tjänster.
- Konfigurerar Linux-baserad miljö (NixOS), WireGuard, nginx och containeriserade tjänster – erfarenhet av Linux, containerteknik och plattformstänk.

#project(
  name: "Teknisk blogg",
  dates: dates-helper(start-date: "2022", end-date: "nu"),
  url: "blog.stark.pub",
)
- 10+ djupgående inlägg om Rust, NixOS, systemutveckling och tillämpad AI.
- Delar konfigurationer, mönster och arbetssätt – syftet är att förbättra skrivande, utbilda och göra komplex teknik begriplig för andra utvecklare.

== Färdigheter
- *Språk & ramverk*: Rust, Python, JavaScript, HTML/CSS
- *Plattform & infra*: Linux, NixOS/Nix, Docker, nginx
- *Utvecklingsprocess*: Git, CI/CD, test- och releaseautomatisering, kodgranskning
- *Data & AI*: LLM-prompting/RAG, statistik, forskningsmetodik
- *Arbetssätt & samarbete*: stöd till team, förändringsarbete, utbildning/föreläsning, teknisk dokumentation

== Utbildning
#edu(
  institution: "EC Utbildningar",
  location: "Distans, SE",
  dates: dates-helper(start-date: "aug 2022", end-date: "jun 2024"),
  degree: "Fullstackutvecklare (.NET)",
)
- Examensarbete: LLM-baserad extraktion av stressmått från studentchattdata; longitudinell analys och modellvalidering – erfarenhet av data, statistik och AI i praktiska tillämpningar.

#edu(
  institution: "Örebro universitet",
  location: "Örebro, SE",
  dates: dates-helper(start-date: "aug 2011", end-date: "jun 2016"),
  degree: "Psykologexamen, master i psykologi",
)
- Examensarbete: Psykometrisk utveckling av mått på handledningskvalitet; datadrivet mentorskap och lärande – visar strukturerad analys, mätning och uppföljning.

== Förtroendeuppdrag
#extracurriculars(
  activity: "Kommunfullmäktigeledamot; nämndledamot",
  dates: dates-helper(start-date: "2022", end-date: "nu"),
)
- Lokal styrning, policygranskning och intressentdialog.
- Erfarenhet av beslutsfattande, struktur och helhetsperspektiv – relevanta för plattforms- och enablementarbete i större organisationer.
