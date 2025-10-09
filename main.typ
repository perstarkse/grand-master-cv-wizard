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
  // All the lines below are optional.
  // For example, if you want to to hide your phone number:
  // feel free to comment those lines out and they will not show.
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
* Lines that start with == are formatted into section headings
* You can use the specific formatting functions if needed
* The following formatting functions are listed below
* #edu(dates: "", degree: "", gpa: "", institution: "", location: "", consistent: false)
* #work(company: "", dates: "", location: "", title: "")
* #project(dates: "", name: "", role: "", url: "")
* certificates(name: "", issuer: "", url: "", date: "")
* #extracurriculars(activity: "", dates: "")
* There are also the following generic functions that don't apply any formatting
* #generic-two-by-two(top-left: "", top-right: "", bottom-left: "", bottom-right: "")
* #generic-one-by-two(left: "", right: "")
*/
== Education
#edu(
  institution: "EC Utbildningar",
  location: "Remote, SE",
  dates: dates-helper(start-date: "Aug 2022", end-date: "June 2024"),
  degree: "Fullstack developer .NET",
)
- Thesis: Using LLMs to extract stress measures from student chat data, longitudinal study and statistical analysis

#edu(
  institution: "Örebro University",
  location: "Örebro, SE",
  dates: dates-helper(start-date: "Aug 2011", end-date: "June 2016"),
  degree: "Psychologist, Master's of Psychology",
)
- Thesis: Applied psychometrics and statistical analysis to develop supervision quality measures, emphasizing data-driven evaluation, mentoring, and workplace learning

== Work Experience

#work(
  title: "Certified Psychologist",
  location: "Hallsberg, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "May 2024", end-date: "Present"),
)
- Applied systematic, evidence-based frameworks to diagnose complex problems and implement effective solutions.
- Entrusted by peers with leadership responsibility as the elected Health and Safety Representative.
- Mentored and supervised junior team members, providing structured guidance and performance feedback.

#work(
  title: "Full Stack Developer",
  location: "Örebro, SE",
  company: "TIQQE AB, SE",
  dates: dates-helper(start-date: "Apr 2023", end-date: "Mar 2024"),
)
- Architected and delivered an AI-powered translation feature using AWS Translate and LLMs, successfully scaling the LMS platform from 2 to 8+ languages while drastically reducing manual workload.
- Acted as the technical and client-facing lead on the team, owning the product roadmap dialogue, gathering requirements, and conducting feature demonstrations.
- Represented the development team in key business meetings, contributing technical insights during pre-sales discussions with potential clients.
- Spearheaded AI adoption and knowledge-sharing, delivering technical presentations on LLMs and RAG internally and presenting AI strategy to external clients.

#work(
  title: "Certified Psychologist",
  location: "Örebro Sweden, SE",
  company: "Region Örebro Län",
  dates: dates-helper(start-date: "Aug 2018", end-date: "Aprl 2023"),
)
- Specialized in psychological assessment and evidence-based psychological treatment.
- Designed and implemented new workflows to streamline patient management and improve care coordination.
- Responsible for psychological knowledge in interprofessional assessment team.
- Made recurring media appearances to spread psychological knowledge.

== Projects

#project(
  name: "Minne",
  // Role is optional
  // role: "Developer",
  // Dates is optional
  // dates: dates-helper(start-date: "Sep 2024", end-date: "Present"),
  // URL is also optional
  url: "github.com/perstarkse/minne",
)
-  Minne (“memory” in Swedish) is a self-hosted, graph-powered personal knowledge base. Store links/snippets/images/files and Minne uses an openai API endpoint to auto-extract entities and relationships from the content, so your content relates without manual linking. You can chat with your data, browse a visual knowledge graph, and it runs as a lean Rust SSR app (HTMX, minimal JS). AGPL-3.0, Nix/Docker/binaries.

#project(
  name: "Infra",
  // dates: dates-helper(start-date: "Jan 2023", end-date: "Present"),
  url: "github.com/perstarkse/infra",
)
- Declarative homelab and infra setup with Nix flakes, managing router, server, and workstation configurations. Provides reproducible secrets, backups, monitoring, and deployment pipeline for Minne and other services.

#project(
  name: "Technical Blog",
  dates: dates-helper(start-date: "2022", end-date: "Present"),
  url: "blog.stark.pub",
)
- Authored 10+ in-depth articles on systems engineering, Rust, NixOS, and applied AI research, providing tutorials and documentation adopted by the developer community.

== Extracurricular Activities
#extracurriculars(
  activity: "Elected representative",
  dates: dates-helper(start-date: "2022", end-date: "Present"),
)
- Local council committees and municipal council


== Skills
- *Programming Languages*: Rust, Python, Javascript, HTML/CSS 
// - *Technologies*: React, Astro, Svelte, Tailwind CSS, Git, UNIX, Docker, Caddy, NGINX, Google Cloud Platform
