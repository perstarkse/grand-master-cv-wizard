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

/*
Formatting helpers:
#edu(dates: "", degree: "", gpa: "", institution: "", location: "", consistent: false)
#work(company: "", dates: "", location: "", title: "")
#project(dates: "", name: "", role: "", url: "")
#extracurriculars(activity: "", dates: "")
*/
== Summary
Full-stack developer with background in psychology and applied research. Experience in Rust, NixOS, infra automation, and LLM-powered applications. Delivered production features (AI translation, multi-language LMS) and built reproducible infra (secrets, backups, deployment pipelines). Skilled in Rust (Axum, HTMX), Python, JavaScript, and cloud (AWS). Strong record of technical writing, leadership, and cross-disciplinary problem solving.


== Projects

#project(
  name: "Minne",
  dates: dates-helper(start-date: "Sep 2024", end-date: "Present"),
  url: "github.com/perstarkse/minne",
)
- Self-hosted, graph-powered PKM. Rust SSR + HTMX. Automatic entity/relationship extraction via OpenAI API, chat over personal data, visual graph, and binaries/Docker/Nix packaging.

#project(
  name: "Infra",
  dates: dates-helper(start-date: "Jan 2023", end-date: "Present"),
  url: "github.com/perstarkse/infra",
)
- Declarative Nix flakes infra for router/server/workstation. Reproducible secrets, backups, monitoring, WireGuard, nginx, and the deployment pipeline for Minne and related services.

#project(
  name: "Technical Blog",
  dates: dates-helper(start-date: "2022", end-date: "Present"),
  url: "blog.stark.pub",
)
- 10+ deep-dive posts on Rust, NixOS, systems, and applied AI. Public configs and tutorials used as reference by practitioners.

== Skills
- *Languages*: Rust, Python, JavaScript, HTML/CSS
- *Infra/OS*: NixOS/Nix, Linux, Docker, WireGuard, nginx
- *Data/AI*: LLM prompting/RAG, Statistics
- *Tools*: Git, CI/CD, HTMX, Axum, React, Vue, AWS

== Work Experience

#work(
  title: "Full-Stack Developer",
  location: "Örebro, SE",
  company: "TIQQE AB",
  dates: dates-helper(start-date: "Apr 2023", end-date: "Mar 2024"),
)
- Built AI translation feature with AWS Translate + LLMs, scaling an LMS from 2 → 8+ languages and cutting manual localization.
- Acted as tech and client-facing lead: roadmap discussions, requirements, and demos.
- Drove AI adoption through internal talks on LLMs/RAG and external AI strategy sessions.

#work(
  title: "Certified Psychologist",
  location: "Hallsberg, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "May 2024", end-date: "Present"),
)
- Applied structured, evidence-based problem solving in complex environments.
- Elected Health and Safety Representative; mentored junior staff.

#work(
  title: "Certified Psychologist",
  location: "Örebro, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "Aug 2018", end-date: "Apr 2023"),
)
- Led assessments and improved workflows for care coordination.
- Served as subject-matter lead in an interprofessional team; recurring media briefings.

== Education
#edu(
  institution: "EC Utbildningar",
  location: "Remote, SE",
  dates: dates-helper(start-date: "Aug 2022", end-date: "Jun 2024"),
  degree: "Full-Stack Developer (.NET)",
)
- Thesis: LLM-based extraction of stress measures from student chat data; longitudinal stats and model validation.

#edu(
  institution: "Örebro University",
  location: "Örebro, SE",
  dates: dates-helper(start-date: "Aug 2011", end-date: "Jun 2016"),
  degree: "Psychologist, Master’s in Psychology",
)
- Thesis: Psychometrics to develop supervision-quality measures; data-driven mentoring and workplace learning.

== Extracurricular Activities
#extracurriculars(
  activity: "Municipal Councilor; committee member",
  dates: dates-helper(start-date: "2022", end-date: "Present"),
)
- Local governance and committee work (leadership, policy review)
