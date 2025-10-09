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

== Summary
Technical leader with a psychology background. Proven in stakeholder management, roadmap ownership, mentoring, and governance. Led AI feature delivery for a production LMS, drove org-wide AI adoption, and held elected safety and municipal leadership roles. Data-driven decision making; hands-on with Rust, NixOS, and cloud.

== Core Competencies
- People leadership, mentoring, coaching
- Stakeholder management, roadmap & delivery
- Governance, health & safety representation
- Cross-functional communication, public speaking
- Data-informed decisions, experimentation mindset
- AI/LLM productization, technical writing

== Leadership Experience

#work(
  title: "Full-Stack Developer (client-facing lead)",
  location: "Örebro, SE",
  company: "TIQQE AB",
  dates: dates-helper(start-date: "Apr 2023", end-date: "Mar 2024"),
)
- Led AI translation feature from concept to launch using AWS Translate + LLMs; scaled LMS from 2 → 8+ languages and reduced manual localization.
- Owned roadmap dialogue, requirements, and demos with stakeholders and customers.
- Championed AI adoption via internal talks (LLMs/RAG) and external client strategy sessions.

#work(
  title: "Certified Psychologist",
  location: "Hallsberg, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "May 2024", end-date: "Present"),
)
- Elected Health and Safety Representative; coordinated safety initiatives with leadership and staff.
- Mentored junior team members; instituted structured feedback and knowledge sharing.
- Applied evidence-based frameworks to complex, multi-stakeholder problems.

#work(
  title: "Certified Psychologist",
  location: "Örebro, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "Aug 2018", end-date: "Apr 2023"),
)
- Designed workflow improvements for patient management and care coordination.
- Served as subject-matter lead in an interprofessional team; handled recurring media briefings.

== Selected Projects

#project(
  name: "Minne",
  dates: dates-helper(start-date: "Sep 2024", end-date: "Present"),
  url: "github.com/perstarkse/minne",
)
- Initiated and built an open-source, graph-powered PKB (Rust SSR + HTMX). Clear scope, release cadence, and packaging (binaries/Docker/Nix). LLM-based entity/relationship extraction and chat over personal data.

#project(
  name: "Infra",
  dates: dates-helper(start-date: "Jan 2023", end-date: "Present"),
  url: "github.com/perstarkse/infra",
)
- Designed reproducible Nix-based infra for router/server/workstation. Secrets, backups, monitoring, WireGuard, nginx, and the deployment pipeline for Minne and related services.

#project(
  name: "Technical Blog",
  dates: dates-helper(start-date: "2022", end-date: "Present"),
  url: "blog.stark.pub",
)
- Authored 15+ deep-dive posts on systems, Rust, NixOS, and applied AI; used as reference by practitioners. Demonstrates structured communication and knowledge transfer.

== Governance & Community

#extracurriculars(
  activity: "Municipal Councilor; committee member",
  dates: dates-helper(start-date: "2022", end-date: "Present"),
)
- Local governance and committee work focusing on leadership, policy review, and stakeholder coordination.

== Education
#edu(
  institution: "EC Utbildningar",
  location: "Remote, SE",
  dates: dates-helper(start-date: "Aug 2022", end-date: "Jun 2024"),
  degree: "Full-Stack Developer (.NET)",
)
- Thesis: LLM-based extraction of stress measures from student chat data; longitudinal statistics and model validation.

#edu(
  institution: "Örebro University",
  location: "Örebro, SE",
  dates: dates-helper(start-date: "Aug 2011", end-date: "Jun 2016"),
  degree: "Psychologist, Master’s in Psychology",
)
- Thesis: Psychometric development of supervision-quality measures; data-driven mentoring and workplace learning.

== Skills
- *Leadership & Delivery*: stakeholder management, roadmap ownership, mentoring, governance, safety representation
- *Technical breadth*: Rust, Python, JavaScript; NixOS/Nix, Linux, Docker, WireGuard, nginx; HTMX, Axum; AWS (Translate)
- *Data & AI*: LLM prompting/RAG, basic statistics; research methods
- *Communication*: technical writing, public speaking, media briefings

