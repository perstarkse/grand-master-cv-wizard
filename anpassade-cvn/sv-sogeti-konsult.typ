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
Fullstack-utvecklare med konsultprofil och gedigen erfarenhet av modern webbutveckling, cloud-teknik och AI-integration. Kombinerar teknisk spetskompetens inom React, Node.js, C och Azure med stark förmåga att driva kundnära projekt och förstå verksamhetsbehov. Brinner för hantverket, kontinuerligt lärande och att leverera kvalitativa lösningar i samarbete med kunder och team. Erfaren av både frontend- och backend-utveckling, databaser och molnarkitektur.

== Arbetslivserfarenhet

#work(
  title: "Fullstackutvecklare (Konsult)",
  location: "Örebro, SE",
  company: "TIQQE AB",
  dates: dates-helper(start-date: "apr 2023", end-date: "mar 2024"),
)
- Byggde komplett AI-drivet översättningssystem med Vue.js/TypeScript och AWS Lambda, automatiserade undertextgenerering med OpenAI Whisper och flerspråkig innehållshantering med AWS Translate.
- Arkitekterade och implementerade Web-API:er med .NET Core och Entity Framework för datahantering.
- Arkitekterade och implementerade REST API:er för systemintegration och B2B-datautexchange mellan ERP-system, byggde skalbara meddelande-köer med RabbitMQ för asynkron datahantering.
- Genomförde kravworkshops och verksamhetsanalys hos stora företagskunder, översatte affärsbehov till tekniska specifikationer.
- Drev tech-lead och roadmap-dialog med kunder, ansvarade för kravinsamling och demovisningar.
- Implementerade cloud-lösningar i AWS, inklusive databas, API-gateway och automatiserade deploypipelines.

#work(
  title: "Leg. Psykolog",
  location: "Hallsberg, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "maj 2024", end-date: "nu"),
)
- Tillämpar strukturerad problemlösning och evidensbaserad metodik i komplexa miljöer.
- Konsulterar team och samverkansparter med fokus på metodutveckling och kvalitetssäkring.
- Handleder juniora kollegor och driver kontinuerligt kompetensutveckling inom teamet.

#work(
  title: "Leg. Psykolog",
  location: "Örebro, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "aug 2018", end-date: "apr 2023"),
)
- Ledde komplexa utredningar och förbättrade arbetsflöden för vårdkoordination.
- Ansvarade för systematisk uppföljning och kvalitetsutveckling.
- Samverkade med externa parter och fungerade som expert i tvärprofessionella team.

== Projekt

#project(
  name: "Minne - Kunskapshanteringssystem",
  dates: dates-helper(start-date: "sep 2024", end-date: "nu"),
  url: "github.com/perstarkse/minne",
)
- Fullstack-applikation med Rust/Axum backend och HTML/JS frontend, implementerades med test-driven development.
- Byggde komplett testsvit med enhetstester (Rust's inbyggda testramverk), integrationstester och Jest för frontend-testning.
- Implementerade CI/CD-pipeline med automatisk testkörning, nådde 85% kodtäckning och automatiserad regressionshantering.
- REST-API för datahantering, databasdesign med PostgreSQL och realtids-sökfunktioner.
- AI-integration med OpenAI API för automatisk innehållsanalys och kunskapsextraktion.

#project(
  name: "AI-drivet flerspråkigt LMS-översättningssystem",
  dates: dates-helper(start-date: "okt 2023", end-date: "mar 2024"),
)
- Byggde komplett AI-drivet översättningssystem för multinationellt industriföretags Learning Management System, automatiserade hela processen från video till färdiga översättningar.
- Vue.js/TypeScript frontend för språkadministratörer med AWS Lambda backend, integrerade OpenAI Whisper för automatisk undertextgenerering och AWS Translate med anpassade ordlistor.
- S3-baserad lagring av undertexter med automatiskt språkval, reducerade manuella översättningsinsatser med över 90% och möjliggjorde snabb lansering av flerspråkigt utbildningsinnehåll.
- Hanterade kundkontakt, kravinsamling och demo av systemet, fick utmärkt feedback för teknisk lösning och affärsvärde.

#project(
  name: "Infrastruktur och CI/CD",
  dates: dates-helper(start-date: "jan 2023", end-date: "nu"),
  url: "github.com/perstarkse/infra",
)
- Byggde reproducerbar infrastruktur med Docker och Azure Container Instances.
- Konfigurerade CI/CD-pipelines med GitHub Actions för automatiserad testning och deployment.
- Implementerade backup-strategier, övervakning och logghantering för produktionsmiljöer.

== Teknisk kompetens

*Webbutveckling*
- *Frontend*: React, Angular, HTML5, CSS3, JavaScript/TypeScript, HTMX
- *Backend*: Node.js, .NET Core, ASP.NET Web API, Entity Framework
- *Databaser*: SQL Server, PostgreSQL, MongoDB, Entity Framework, LINQ

*Cloud och DevOps*
- *Plattformar*: Microsoft Azure, AWS, Docker, NixOS
- *CI/CD*: GitHub Actions, Azure DevOps, automatiserade deployment-pipelines
- *Övervakning*: Application Insights, Log Analytics, egenbyggda monitoringslösningar

*Systemintegration*
- *API:er*: REST API (design och implementation), GraphQL, Web API, API Gateway, webhook-implementeringar, integration med tredjepartssystem
- *Meddelanden*: Message queues (RabbitMQ, Azure Service Bus), webhooks, realtidskommunikation, Event Sourcing
- *ESB/Middleware*: API Gateway, Azure Service Bus, microservices-integration, data pipeline arkitektur
- *CMS*: Erfarenhet av SharePoint-anpassning och andra CMS-plattformar

*Test och kvalitetssäkring*
- *Testramverk*: xUnit, NUnit, Jest, Rust inbyggda testramverk
- *Testmetoder*: Enhetstester, integrationstester, end-to-end-tester, TDD, test automation
- *Kvalitet*: Kodtäckning, kontinuerlig integration, automatisk regressionshantering

*Utvecklingsverktyg*
- *Versionering*: Git, GitHub, GitLab
- *IDE/Editor*: Visual Studio Code, Visual Studio, Rider
- *Projektmetoder*: Agile, Scrum, teknisk dokumentation

== Utbildning
#edu(
  institution: "EC Utbildningar",
  location: "Distans, SE",
  dates: dates-helper(start-date: "aug 2022", end-date: "jun 2024"),
  degree: "Fullstackutvecklare (.NET)",
)
- Specialisering inom modern webbutveckling med React, Node.js och .NET
- Examensarbete: LLM-baserad extrahering av stressmått från studentchattar; utveckling av pipeline för textanalys och statistisk validering

#edu(
  institution: "Örebro universitet",
  location: "Örebro, SE",
  dates: dates-helper(start-date: "aug 2011", end-date: "jun 2016"),
  degree: "Psykologexamen, master i psykologi",
)
- Komplementär kompetens inom kommunikation, teamdynamik och problemlösning

== Personliga egenskaper
- Positiv och engagerad med starkt fokus på samarbete och teamutveckling
- Driven av nyfikenhet och kontinuerligt lärande, håller mig i teknikens framkant
- Strukturerad och noggrann med hög kvalitetsmedvetenhet
- Van vid att arbeta i konsultroll och snabbt anpassa mig till olika kundmiljöer och tekniska stackar
- Kommunikativ med förmåga att översätta komplex teknisk information till lättförståeligt språk
- Erfaren av kravworkshops och verksamhetsanalys, identifierar affärsvärde och översätter till tekniska lösningar

== Förtroendeuppdrag
#extracurriculars(
  activity: "Kommunfullmäktigeledamot; nämndledamot",
  dates: dates-helper(start-date: "2022", end-date: "nu"),
)
- Lokalt styrningsuppdrag med fokus på policygranskning, intressentkoordination och långsiktiga beslut
