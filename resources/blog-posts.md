
# ./content/posts/gpg_pass.md

```md
+++
title= "pass - A Self-Hosted, Secure, and CLI-Friendly Password Manager"
date= 2024-04-27
description= "Learn how to set up and use pass, a self-hosted, secure, and CLI-friendly password manager, to efficiently manage your passwords with features like multiline inserts, rofi-pass, and pass-otp."
+++

As a long-time user of 1Password, I've grown accustomed to the convenience and security it provides. However, I've always been disappointed with the CLI experience. The command-line interface is clunky and limited, making it difficult to manage my passwords efficiently. That's why I decided to explore alternative solutions, and I'm excited to share my experience with `pass`, a self-hosted, secure, and CLI-friendly password manager.

### Prerequisites

Before we dive into setting up `pass`, you'll need a few prerequisites:

1. **GPG key**: You'll need a GPG key to encrypt your password store. I highly recommend using `gpg-tui` for managing your GPG keys. It's a user-friendly, terminal-based interface that makes it easy to generate and manage your keys.
1. **gnupg**: You'll also need `gnupg` installed on your system. This is a requirement for `pass` to function properly.

### Installing pass

Installing `pass` is a breeze. You can use your favorite package manager to install it. If you're using NixOS, you can use `nix-shell -p pass` to create a temporary "install" environment.

### Initializing the Password Store

Once `pass` is installed, you can initialize the password store using the following command:

```
pass init
```

This will create a new password store in the default location `~/.password-store`.

### Setting up the Git Repo

To store your passwords securely, you'll need to set up a Git repository. You can do this using the following command:

```
pass git init
```

This will create a new Git repository in the `~/.password-store` directory.

### Setting up the Remote Tracking Repo

To ensure that your password store is backed up and accessible across multiple devices, you'll need to set up a remote tracking repository. I recommend using a private GitHub repository for this purpose.

### Generating Passwords

`pass` comes with a built-in password generator that can generate strong, unique passwords for you. You can use the following command to generate a new password:

```
pass generate
```

### Inserting Passwords with Multiline Support

One of the most powerful features of `pass` is its support for multiline inserts. This allows you to add not only passwords but also additional information such as usernames, notes, and more. To insert a new password with multiline support, you can use the following command:

```
pass insert multiline
```

This will open a text editor where you can enter your password and additional information in a formatted way. For example:

```
Username: myusername
Password: mypassword
URL: https://example.com
Notes: This is a note about the password
```

This makes it easy to store and manage complex password entries with additional information.

### Using rofi-pass

`rofi-pass` is a powerful plugin that allows you to search and manage your passwords using the `rofi` fuzzy finder. To use `rofi-pass`, simply execute the following command:

```
rofi-pass
```

This will open a `rofi` interface where you can search and manage your passwords.

### Using pass-otp

`pass-otp` is a plugin that allows you to manage one-time passwords (OTPs) using `pass`. One of the most useful features of `pass-otp` is the ability to scan QR codes and add OTPs to your password store. You can use the following command to scan a QR code and add an OTP to your password store:

```
xclip -selection clipboard -t image/png -o - | zbarimg -q --raw - | pass otp append <your_entry>
```

This command uses `xclip` to capture the QR code from the clipboard, `zbarimg` to decode the QR code, and `pass otp` to add the OTP to your password store.

### pass for iOS

If you're an iOS user, you'll be happy to know that there's a `pass` app available for [iOS devices](https://github.com/mssun/passforios). The app allows you to access your password store on the go, with a simple and intuitive interface. You can search, view, and copy passwords, as well as generate new passwords using the app's built-in password generator.

To get started with `pass for iOS`, simply download the app from the App Store and follow the setup instructions. You'll need to configure the app to connect to your password store, which can be done using the app's built-in Git integration. So far from my own use I'm very pleased, it handles OTP codes great.

### Conclusion

In this post, we've covered the basics of setting up `pass`, a self-hosted, secure, and CLI-friendly password manager. With `pass`, you can manage your passwords efficiently and securely, using a command-line interface that's both powerful and intuitive. The multiline insert feature, `rofi-pass` plugin, and `pass-otp` plugin make it easy to manage complex password entries, search and manage your passwords, and add OTPs to your password store. I hope this guide has been helpful in getting you started with `pass`. Happy password managing!

```

# ./content/posts/markdown-to-pdf/index.md

```md
+++
title= "Writing PDFs with Markdown"
date = 2024-03-26
updated = 2025-10-07
description= "An entry guide to using Markdown to write pretty documents, including PDFs using Pandoc."
+++

{% tip(title="Typst is probably a great alternative") %}
Since a while back I've started using typst instead of pandoc. I have not fully explored if it can do all the following things in this post, but I highly suspect it. No real dependencies, great syntax and lots of community behind it. 
{% end %}

 
## Intro

Writing documents using Microsoft Office, Google Docs, Open Office etc, has in my opinion not provided the best UX experience. Especially not if you are used to mainly using the keyboard to navigate and produce. For much of my writing I just need sensible defaults and not worrying about formatting.
Using [Markdown](https://en.wikipedia.org/wiki/Markdown) and [Pandoc](https://pandoc.org/) you can write documents in Markdown in your favorite text editor, mine is [Helix](https://helix-editor.com/) and end up with great looking PDFs, HTML, EPUB amongst others.

I have used it to great extent to write academic papers, notes, cover letters amongst others. The image below is a snippet of this post when it was in writing.

![Snippet of the current post in writing](markdown-helix-snippet.png)

## Prerequisites

- Text editor of choice, prefferably with Markdown syntax support.
- Pandoc installed. Install on NixOS in shell with:

`$ nix-shell -p pandoc texlive.combined.scheme-small`

## Usage

Write your content in a .md file, and when you are ready to create a PDF from your .md, then run:

`$ pandoc your_document.md -o your_pdf.pdf`

It will then parse the markdown and ouput a formatted PDF.

![Snippet of the current post as PDF](markdown-pdf-snippet.png)

## Table of Content

Adding a Table of Content is as simple as adding --toc to the command, you can also have the sections automatically numbered using --number-sections.

`$ pandoc your_document.md -o your_pdf.pdf --toc --number-sections`

![Snippet of the TOC](markdown-number-sections.png)

## References

Pandoc can also make handling references a breeze. Both footnotes, references to charts and images, as well as creating a reference sheet.

To do this you also need pandoc-crossref installed. To install with pandoc in shell on NixOS:

`$ nix-shell -p pandoc texlive.combined.scheme-small haskellPackages.pandoc-crossref`

To handle the references we need to create and specify a bibliography file, we do this by inserting `bibliography: references.bib` to the top of the file.

It will now look something like so:

```
---
title: your_title
date: 26/03/2024
bibliography: references.bib
---
```

The references.bib file being a standard BibTeX file, making it easy to import references. You can then cite from text by writing `[@reference]`

To generate the PDF with citations and references, run:

`$ pandoc your_document.md -o your_pdf.pdf --toc --number-sections --filter pandoc-crossref --citeproc`

It will both replace `[@reference]` with the information in the bibliography, as well as create a reference list at the end of the document.

## Charts

Using pandoc-plot you can generate plots directly from your markdown code using Python, R, ect. To install with the other libraries run:

`$ nix-shell -p pandoc texlive.combined.scheme-small haskellPackages.pandoc-crossref haskelPackages.pandoc-plot`

You will also need a python environment with matplotlib and numpy to generate the plots in the following code.

You can then insert code like the following:

```
import json
import matplotlib.pyplot as plt

with open("sentiment_data.json") as file:
    data = json.load(file)

html_css_data = data["html_css_data"]
javascript_frontend_data = data["javascript_frontend_data"]
javascript_backend_data = data["javascript_backend_data"]
c_sharp_data = data["c_sharp_data"]
datalagring_data = data["datalagring_data"]
asp_net_data = data["asp_net_data"]

datasets = [
    ("HTML/CSS", html_css_data, "#1f77b4"),
    ("JavaScript Frontend", javascript_frontend_data, "#ff7f0e"),
    ("JavaScript Backend", javascript_backend_data, "#2ca02c"),
    ("C#", c_sharp_data, "#d62728"),
    ("Datalagring", datalagring_data, "#9467bd"),
    ("ASP.NET", asp_net_data, "#8c564b"),
]

fig, ax1 = plt.subplots(figsize=(10, 5))

for name, data, color in datasets:
    x = [d["x"] for d in data]
    y = [d["y"] for d in data]
    ax1.plot(x, y, marker="o", linestyle="-", color=color, label=name, alpha=0.7)
    ax1.plot(x, y, linestyle="-", color=color, alpha=0.3, linewidth=4)

ax1.set_xlabel("Week")
ax1.set_ylabel("Sentiment")
ax1.set_title("Sentiment over Time")
ax1.grid(True)
ax1.legend(loc="upper left")

plt.setp(ax1.get_xticklabels(), rotation=45, ha="right", rotation_mode="anchor")

plt.tight_layout()
```

And run with:

`$ pandoc your_document.md -o your_pdf.pdf --toc --number-sections --filter pandoc-plot --filter pandoc-crossref --citeproc`

This code is from a recent project of mine. Which resulted in this plot:

![Plot example](sentimentTime.png)

## CSL style

You can of course change the style of the citations generated. There is a large [repository](https://github.com/citation-style-language/styles) of styles availible. To use, download the .csl file and place it in the base directory, then you can run:

`$ pandoc your_document.md -o your_pdf.pdf --toc --number-sections --csl="your_csl.csl" --filter pandoc-plot --filter pandoc-crossref --citeproc`

## Summary

The end result is a PDF that's nicely formatted, with a table of contents, citations, charts and a reference list.

I personally feel that I've just so far scratched the surface of what's possible to do with Pandoc. But so far I'm very satisfied, this abstracts away a lot of the unpleasurable things with writing.

```

# ./content/posts/_index.md

```md
+++
title = "Writing"
description = "Research notes, technical explorations, and things I find interesting."
sort_by = "date"
template = "blog.html"
page_template = "post.html"
insert_anchor_links = "right"
generate_feeds = true
[extra]
lang = "en"
title = "Writing"
subtitle = "Research notes, technical explorations, and things I find interesting"
date_format = "%b %-d, %Y"
categorized = false
back_to_top = true
toc = true
comment = false
copy = true
outdate_alert = false
outdate_alert_days = 12
outdate_alert_text_before = "This article was last updated "
outdate_alert_text_after = " days ago and may be out of date."
+++

```

# ./content/posts/axum_ergonomics/index.md

```md
+++
title = "Axum Ergonomics - HTML response middleware"
date = "2025-03-15"
description = "Using an axum middleware to simplify development in a SSR rendering context with Axum."
+++

```
.layer(map_response_with_state(app_state.clone(), with_template_response))
```

## Why?

Developing a web application using Rust, Axum and Minijinja is **fun** and once the design and groundwork is laid it's quite easy, maintainable and performant. I'm not in any way an expert, continously finding new ways handle recurring issues and challenges.

Recently I took a gander on refactoring my growing application. With the amount of routes growing I took a look at simplifying the conversion of state into HTML. During this work I came across a quite enjoyable approach which I thought I'd share given my enjoyment of it, and that it it isn't too widely used, which prompted me writing this post.

![github search](map_response_with_state.png)

## Rendering

I'm using [MiniJinja](https://docs.rs/minijinja/latest/minijinja/index.html) a templating engine which I highly recommend. I explored a couple (Askama, Tera) before settling on MiniJinja. Simplifying a bit, it uses Serde to serialize values and passes it to the templates which it then renders into HTML, which then the handler returns as a response to the request.

## Middleware

Looking through the Axum documentation there is [map_response_with_state()](https://docs.rs/axum/latest/axum/middleware/fn.map_response_with_state.html), which is a function to create a middleware that transforms the response sent from the handler. This means we can localize all HTML rendering to this middleware.

```
pub async fn with_template_response(
    State(state): State<HtmlState>,
    response: Response,
) -> Response {
    // Clone the TemplateResponse from extensions
    let template_response = response.extensions().get::<TemplateResponse>().cloned();

    if let Some(template_response) = template_response {
        TemplateStateWrapper {
            state,
            template_response,
        }
        .into_response()
    } else {
        response
    }
}
```

Rusts type system makes it easy to check if the type matches our TemplateResponse type, and if it doesn't we just forward the response and do nothing with it. So in some instances I need to do stuff with the rendered response, like change headers, but for now its quite limited, the current approach allows me to just do .into_response() inside the handler and it will pass through the middleware with limited interference, mostly to see if the response matches the struct.

### Error handling

Implementing error conversion also means we can use ? to propagate errors, and handle them in a fitting way.

```
impl From<surrealdb::Error> for HtmlError {
    fn from(err: surrealdb::Error) -> Self {
        HtmlError::AppError(AppError::from(err))
    }
}

impl IntoResponse for HtmlError {
    fn into_response(self) -> Response {
        match self {
            HtmlError::AppError(err) => {
                let template_response = match err {
                    AppError::NotFound(_) => TemplateResponse::not_found(),
                    AppError::Auth(_) => TemplateResponse::unauthorized(),
                    AppError::Validation(msg) => TemplateResponse::bad_request(&msg),
                    _ => {
                        tracing::error!("Internal error: {:?}", err);
                        TemplateResponse::server_error()
                    }
                };
                template_response.into_response()
            }
        }
    }
}
```

## Wrapping it all together

This is an example of how a handler could look. Do note that there are other approaches that might be more concise for constructing the context than mine, but I enjoy being a bit strict and having a struct for passing the response, which helps when refactoring, catching errors that might occur when changing the data types returned from helper functions for example.

```
pub async fn show_text_content_edit_form(
    State(state): State<HtmlState>,
    RequireUser(user): RequireUser,
    Path(id): Path<String>,
) -> Result<impl IntoResponse, HtmlError> {
    let text_content = User::get_and_validate_text_content(&id, &user.id, &state.db).await?;

    #[derive(Serialize)]
    pub struct TextContentEditModalData {
        pub user: User,
        pub text_content: TextContent,
    }

    Ok(TemplateResponse::new_template(
        "content/edit_text_content_modal.html",
        TextContentEditModalData { user, text_content },
    ))
}
```

This post is not designed to be comprehensive or a detailed venture in to the considerations to be made about using it. But for me, it offered a **fun** approach, and I wanted to share it. If you got any questions or corrections to be made, please reach out by email.

```

# ./content/posts/nixos_abstractions.md

```md
+++
title = "NixOS, an operating system for me?"
date = 2024-08-24
description = "Detailing my experience with NixOS, its benefits and drawbacks, and how to work around them for a great experience."
subtitle = "The Right Amount of Abstraction?"
+++

## Intro

For the past year, I've been using NixOS for my systems, starting with a VM and eventually including my workstation, work laptop, NAS, and more. All these systems are managed from the same configuration file, accessible on GitHub. During this time, I've experienced some frustrations, learned a lot, submitted packages to nixpkgs, and taken over maintenance of some.

What prompted this exploration was the fragility of several systems I'd used before. Even with backups of dotfiles, relevant etc files, and installed packages, restoring a broken system was a tedious process.

When I discovered NixOS with its declarative configurations, it clicked. This post details my current conceptual view on what NixOS is for me, what I enjoy about it, and some frustrations I've encountered. If you're new to Nix or NixOS, I recommend reading the short summary at the bottom of the page.

## What is NixOS for Me?

In its completeness, the best way I can describe NixOS (or a subset of its components) is as a wrapper around a Linux system. It abstracts away several aspects of managing a system and services. Setting up a user, OpenSSH, and adding a public SSH key as an authorized key is as simple as adding:

```nix
{
  users.users = {
    p = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII6uq8nXD+QBMhXqRNywwCa/dl2VVvG/2nvkw9HEPFzn p@charon"
      ];
    };
  };
  
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
    settings.PasswordAuthentication = false;
  };
}
```

These configurations aren't hard to set up, and a seasoned Linux user might do them in their sleep. However, having them declared in a configuration file and instantly applied makes things a breeze.

## Other Notable Aspects

- It ensures reproducibility of my systems. Backups are essential for data, but having the system itself be reproducible makes restoring much easier.
- It documents changes I've made to a system, and with version control, they're timestamped and reversible.
- It offers great developer tooling, for example for setting up project enviroments. In my opinion it offers a substantially better version control than for example nvm for nodejs versions. It's easy to have environment variables set up and automatically applied with direnv.

## On Having the Right Amount of Abstraction

Abstractions can be great, but they also carry significant drawbacks. Looking at the example above, it's easy to draw two conclusions: **A**, more can be done with less code and mental effort. I don't have to remember all the commands, file system locations, and action sequences. **B**, one loses a certain connection to the underlying system. One can, and often should, read the modules/nixpkgs to understand what they do. By doing so, one can learn the underlying system without a doubt.

I've heard concerns in the r/nixos community that using NixOS impedes the learning journey. I agree to a large degree. I think learning this more abstracted way is a shallower learning experience. However, it also enables a wider scope. Most of us have limited time, and tools that enable us to do more are generally good. One can wonder, to what purpose does the learning serve? Being a great sysadmin? If so, perhaps it's useful to run something else.

As always, key aspects to abstraction are finding the correct level. Too abstracted, and it becomes a hindrance; too little, and it offers small benefits. As of writing, I'm quite pleased with the amount.

## Current pain points

- Python projects. Have for me meant a significant issue. There are most likely great solutions, but for me the solutions I've opted for have always felt a bit hacky and suboptimal.
- Documentation is a bit lacking. My current best workaround is looking through the options and searching github for Nix language files containing what I am looking for. Most time there is someone who has already solved the issue I'm having.

## Nix

Nix is several things:

- A package manager serving the nixpkgs repository containing over 100,000 packages.
  - Nix can be used on various distros, as well as MacOS (nix-darwin).
  - Nix package manager isolates packages from each other using the "Nix store" concept.
- The language in which NixOS and nixpkgs configuration files are written.
  - The Nix language is a functional programming language allowing for concise and reproducible configuration.
- A build tool enabling reproducible builds of packages and configurations.

Here's an example of a part of a `.nix` config:

```nix
{pkgs, ...}: {
  home.packages = with pkgs; [
    pinentry-gtk2
  ];

  home = {
    username = "p";
    homeDirectory = "/home/p";
  };
}
```

## NixOS

NixOS is a Linux distribution built on top of Nix, providing:

- A declarative configuration model, where the user describes the desired system configuration.
  - NixOS configuration files define the desired state of the system, which is then built and managed by Nix.
- A set of tools for managing the system configuration, including `nixos-rebuild` and `nixos-config`.
- A community-driven repository of configuration modules, allowing users to easily customize their system.

```

# ./content/posts/psychological_research_using_llms/index.md

```md
+++
title = "Using LLMs for psychological research"
date = 2024-06-10
updated = 2025-10-01
+++


{% detail(title="TLDR", default_open=true) %}
- The author is clinical psychologist who at the time was studying software development
- There was a discord group chat with a lot of activity
- During early LLM days the author had the idea to do quantitative analysis on text classified chat messages
- Results were in line with psychological theory
- Shows you could probably use LLMs to track students well being and optimize learning
- Probably a lot of ethics considerations tho 
- [Paper](./2024-per-stark-student-stress-analysis-llm.pdf)
{% end %}

## The idea was formed

At the time GPT-3.5 became available I was studying fullstack development. I was already somewhat proficient due to self-studies, but I was on parental leave, had the time, thought it could be fun, and some formal merits are good, right? The courses were all remote, and we students came to primarily communicate via discord. Messages per week in the channel ranged from 560-2200 during the first months, so it was quite active.

Early days in the LLM hype era, the capabilities of the models was not evident, and definitely not proven. I was quite fascinated about the possibilities they could enable.

In psychology research, qualitative research is sometimes used, interviews, transcriptions, observations etc. Sometimes you might do labeling and analysis of the content, to be used in a more quantitative way. The idea occurred to me: use LLMs to label/analyze chat messages, with regards to more nuanced psychological measures than sentiment for example. We might with the use of analyzed chat messages get real actionable information about student well-being and optimize learning environment. 

{% detail(title="Sidenote: why do I keep ending up as peer rep?", default_open=false) %}
I’m not sure. A bit reluctantly, I keep raising my hand. Looking back, I’ve been a peer rep in elementary school, high school, university, and at work. That pattern—and a steady interest in student well-being—is a big part of why this research question stuck.
{% end %}

## Stress, Learning and Support

This section will be a compressed summary on how stress, learning and what psychological factors that relates. For those already knowledgeable about these relationships, skip ahead.

In short, we'll use two established theories to help us understand. First, being Vygotsky's theory of zone of proximal development. It states that learning is proceeding at an optimal pace when the demands are just above the comfort level. The second theory is Karasek's demand-control-support model. Stress and well-being depend on the balance of demand, amount of percieved control of ones situation, and experienced support. High demand with ample control is fine, but high demands with low control leads to stress. Social support can act as a buffer.

So, in this specific context, if the ambition of the educational program is to have students learn and integrate, the demands should be set at an appropriate level, promoting the sense of control and providing support when needed. Sounds easy right?

## Method

So the idea was: can we use zero shot LLMs (ie no fine-tuning, no specifically trained models, but rather commercially available ones) to analyze discord messages to determine experienced demand, control and support, as well as measures we'd expect to be dependent of those variables, like sentiment?

It would be possible, and one could argue interesting, to look at individual persons in the chat, and follow them longitudinally. But ethics is worth considering, so I opted to remove user identity from each message, and simply send the message content. I also chose to have the analysis done per week, so all messages for each week gets aggregated under one analysis. 

After extracting the messages from Discord, the data was cleaned, PII removed, clustered by week, and sent to a LLM for analysis (initially GPT-3.5-turbo, later GPT-4o). The prompt was fairly simple:
```
Analyze the text and assign scores (0-100) for 'Demand', 'Control', 'Support', 'Sentiment', and 'Engagement' based on the Demand Control Support Model and sentiment analysis. Do your best attempt at interpreting, no excuses! Output the scores in JSON format. No other output is allowed.
```
## Result

The rest was a matter of statistical analysis.  Please read the paper for more details, but in short:
- There was significant correlation in the expected direction.
- Multiple regression analysis showed that the model (Karasek's) was doing a good job at explaining differences in sentiment (R-squared=0.788).

{{ figure(src="./regression-model.png", alt="regression model result", caption="Multiple regression analysis") }}

## So, what to take from it?

Several things:
- Convergent validity of the findings with the demand-control-support model leads us to believe that the LLM is doing a decent enough job of analyzing large amounts of chat data, most of it in swedish.
- Monitoring chat like this can give an aggregate measure of information pertaining to psychological variables of interest for educational settings.
- Use of LLMs in research have a way to go in regards of being validated, but in comparison to manual labeling and rating, which has its own issues with validity, its seemingly a valid tool which opens up new research possibilities.
- Monitoring via chat holds the potential for some frightening situations, the possibility existed beforehand of course, but with the enormous cost decreases in comparison to doing it manually, its significantly more likely to happen in the future.

## Looking back

It was a fun project, at a certain point in time where using LLMs like this was really quite new. For me personally it offered a glimpse into what could possibly be done at a reasonable cost. It would have been totally possible to do the same study without LLMs, but enormously costly considering the amount of messages. I think I haven't, and possibly, many others too, fully comprehended the amount of insight that could be gotten on a persons inner functioning by observation and monitoring, at least not in a fully automated way.

```

# ./content/posts/quadratic_voting/index.md

```md
+++
title = "Quadratic Voting, and a simple tool for managing surveys"
date = 2025-01-03
description = "Detailing the what, why and how of my implementation of QV in a forms application."
+++

## What is it

Quadratic voting (QV) is a voting system that allows participants to express how strongly they feel about different options. Unlike traditional voting where each person gets one equal vote, QV lets voters allocate "credits" across different choices, with the cost of additional votes increasing quadratically. For example, casting 3 votes costs 9 credits, while 4 votes costs 16 credits.

This mechanism helps prevent "tyranny of the majority" by giving people a way to show how much they care about specific issues. Voters can choose to spread their influence across many topics or concentrate it on what matters most to them.

## My usecase

As someone engaged in local politics, I've observed how traditional yes/no polling can miss important nuances. By implementing QV in my organization's decision-making process, I believe we can better understand not just what people support, but how strongly they feel about different initiatives. This leads to more informed decisions that better reflect our community's true preferences.

## History

QV emerged from early work by Vickrey, Clarke, and Groves on market mechanisms. However, it was E. Glen Weyl at Microsoft Research who developed and named the modern concept of Quadratic Voting. Weyl's primary motivation was addressing the "tyranny of the majority" problem in democratic systems, where concentrated majorities can systematically benefit at the expense of minorities.

The system has since been tested in various settings, from corporate governance to public policy. Notable implementations include the Colorado House of Representatives' use of QV to prioritize bills in 2019, and Volt Germany's application in determining party manifesto priorities.

## nxForm

Since I wanted to try this out for a organization that I am active in which I feel could benefit from the QV approach, I developed [nxForm](https://nxform.starks.cloud), a web application tailored to meet my specific needs.

The primary motivation came from language barriers within our organization - many members are more comfortable with Swedish than English. While several quadratic voting platforms exist, none offered Swedish localization. Additionally, I needed features like QR code sharing for in-person voting sessions and wanted full control over our data. Some existing solutions also had concerning issues, such as invalid SSL certificates.

Beyond solving immediate organizational needs, nxForm was conceived with research potential in mind. I also saw an opportunity to explore how quadratic voting might enhance psychological research, particularly in survey methodology. The ability to measure preference intensity could offer additional insights into human decision-making and group dynamics.

From a technical perspective, nxForm provided an exciting opportunity to work with cutting-edge technologies:

- **Frontend**: Built with SvelteKit, offering a smooth, responsive user experience
- **Backend**: Powered by Rust and the Axum framework, delivering exceptional performance and reliability
- **Infrastructure**: Deployed on AWS Lambda for scalability and cost-effectiveness

The choice of Rust and Axum for the backend proved particularly rewarding and **fun**. The combination offers outstanding ergonomics and developer experience, while maintaining the performance and safety guarantees Rust is known for. This tech stack not only ensures a snappy user experience but also provides the robustness needed for serious research applications.

![nxForm](nxform.png)

```

# ./content/posts/speedrun_ethereum/index.md

```md
+++
title = "Zen and the art of ethereum development, the BuidlGuidl way"
#Speedrunning Ethereum, BuidlGuidl style"
date = 2024-05-09
description = "Zen and the art of ethereum development, the BuidlGuidl way"
+++

## Intro

BuidlGuidl is a curated group of Ethereum builders creating products, prototypes, and tutorials to enrich the web3 ecosystem. Providing video tutorials, newsletters and coordination tools.

They also maintain a full stack solution for developing great dapps with the [Scaffold-ETH 2 toolkit](https://github.com/scaffold-eth/scaffold-eth-2). A solution that I highly recommend for getting going and prototyping.

[Speedrun Ethereum](https://speedrunethereum.com/) is an intensive, hands-on program designed to help developers quickly learn and master the skills needed to build decentralized applications (dApps) on the Ethereum blockchain. Created by the team at BuidlGuidl, this program is known for its practical, project-based approach to Ethereum development.

## Prerequisites

To get the most out of the Speedrun Ethereum program, it's recommended that you have a basic understanding of the following:

- JavaScript or TypeScript
- Solidity (the programming language for Ethereum smart contracts)
- Some familiarity with tools like Hardhat and ethers.js, which are commonly used in Ethereum development

## Speed Run Ethereum

The programme contains 8 challenges in total, providing opportunities to explore state channels, multisig wallets, SVG NFTs and more. The tooling provided makes the overhead minimal, improving the chance of actually learning the essential skills.

### Simple NFT Example, Challenge #0

🎫 Create a simple NFT to learn basics of 🏗 scaffold-eth. You'll use 👷‍♀️ HardHat to compile and deploy smart contracts. Then, you'll use a template React app full of important Ethereum components and hooks. Finally, you'll deploy an NFT to a public network to share with friends! 🚀

### Decentralized Staking App, Challenge #1

🦸 A superpower of Ethereum is allowing you, the builder, to create a simple set of rules that an adversarial group of players can use to work together. In this challenge, you create a decentralized application where users can coordinate a group funding effort. The users only have to trust the code.

### Token Vendor, Challenge #2

🤖 Smart contracts are kind of like "always on" vending machines that anyone can access. Let's make a decentralized, digital currency (an ERC20 token). Then, let's build an unstoppable vending machine that will buy and sell the currency. We'll learn about the "approve" pattern for ERC20s and how contract to contract interactions work.

### Join BuidlGuidl

When you've completed the first three challenges you have the option to join the BuidlGuidl.

### Build a DEX, challenge #4

The challenge is to build a simple DEX solution, where the user can seamlessly trade a ERC20 token with ETH. You will implement the pricing logic `x * y = k`.

### State Channel Application, challenge #5

This challenge was really quite interesting. In this challenge, you'll build a state channel application that enables users to exchange value-for-service at high frequency. You'll create a contract that collects ETH from clients and keeps track of balances, implement off-chain service exchange between the contract owner and clients, and add a challenge mechanism with a timeout to protect clients.

## Cohort 4

I recently recieved an invitation to join the fourth batch of the BG batch program. The github repo for the shared project is [here](https://github.com/BuidlGuidl/batch4.buidlguidl.com/tree/main).

It involved checking in to the deployed contract using a own deployed proxy contract, setting up a socials page and contributing to what you want. I chose to be helpful with reviews, comments and implementing a graph plotting when the builders checked in to the smart contract.

![Chart](buidlguidl-batch-4.png)

The experience was very pleasant, people were helpful and encouraging. 10/10 🚀

## Final project

The wonderful people at buidlguidl have set up a grants solution, where you can apply with an idea and get funding which I generously was given for my idea. What I chose to develop was a community building experience. The users submit inspirations to a contract and the application generates a story from these inspirations which is then presented in the application together with appropriate artwork. Relying on a smart contract for record keeping means there is a great immutable version control and a timeline on how the story has evolved can be shown. Feel free to fork or inspect if you want too, [github](https://github.com/perstarkse/lets-create-a-story)

![timeline](buidlguidl-project-timeline.gif)


```

# ./content/posts/clan_migration/index.md

```md
+++
title = "Summer project 2025: Migrating to Clan and a Dendritic Architecture"
date = "2025-08-30"
description = "Refactoring a multi-year NixOS setup to flake-parts + Clan."
draft = false
+++

{% detail(title="TLDR", default_open=true) %}
- Five machine NixOS homelab consisting of workstations, server and router migration to [Clan](https://clan.lol) and dendritic flake-parts
- Public and private bits split
- Abstractions to create maintainable modules (Router module)
- Clan vars wrapper developed to add features like discovery and ACL permissions
- [Repo](https://github.com/perstarkse/infra)
{% end %}


## Summer of 2025

Summers are when I dive into one or two new projects. I look forward to it.

{% detail(title="In past years, summer projects included:", default_open=false) %}
- [VFIO](https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF) & [Looking-Glass](https://looking-glass.io/) for near native performance in Windows VMs.
- Rust, reading [Zero to Production in Rust](https://www.zero2prod.com), the [Rust Book](https://doc.rust-lang.org/stable/book/), doing [Rustlings](https://github.com/rust-lang/rustlings), and developing [Minne](https://github.com/perstarkse/minne).
- NixOS, deploying to my first workstations.
{% end %}

This year I picked two projects to balance my time with family: build a 40 m² deck and tidy my homelab configuration. The former drew far more praise—unsurprisingly.

{{ figure(src="./finished_deck.webp", alt="Finished deck", caption="Finished deck") }}

## Pain

Over the years my homelab has grown in scope and machines. This spring I replaced my old router with a new N150 running NixOS, which I detailed in the [blog](https://blog.stark.pub/posts/n150-nixos-router/). My server now runs my save-for-later PKM, [Minne](https://github.com/perstarkse/minne), and its demo deployment.

I initially kept my configurations public, but as I added services (email, etc.) they leaked too many personal details. Another goal with the refactor was to split the private bits to a private repo while keeping the main configuration shareable.

## Orchestration/Deployment options

I’ve used remote builds on my workstation for low-resource devices; it’s been solid. While revising the setup I evaluated Colmena, deploy-rs, and Clan (a longer list exists [here](https://nix-community.github.io/awesome-nix/#deployment-tools)). [Clan](https://clan.lol/) stood out: active development, clear ambition, great people—and its secrets module ("vars"), an overlay on sops-nix, made creating and sharing secrets between machines straightforward.

## Dendritic configurations

A quick detour into architecture. Over time my configuration became more chaotic, and it became harder to localize changes. I lacked a consistent pattern.

*Mightyiam's* [repo](https://github.com/mightyiam/dendritic) is where I first came across the Dendritic Pattern.

{% quote(cite="mightyiam") %}
The Dendritic Pattern:

A Nix flake-parts usage pattern in which every Nix file is a flake-parts module
{% end %}

You can still make a mess, but it helps—and it's fun.

My current setup is what I think of as a hybrid dendritic approach. All features live under `modules/` and are written as flake‑parts modules, each exposing `nixosModules.<name>` or `homeModules.<name>`. Machines then compose these features in their `configuration.nix` by importing the relevant modules. I might move to a fully dendritic design, but for now I'm pleased.

## Goals

At this point the plan is beginning to shape up. We've got a framework to implement in a certain manner, and target machines:
- *Io*: Router, reverse proxy, etc.
- *Makemake*: Server, hosting internal and external services, media, backups.
- *Charon*: Workstation.

The goals for this project are:
- Refactor existing configuration for increased maintainability.
- Use Clan where appropriate.
- Enable sharing of main repo, separating sensitive bits out of the main config.
- Increase security across my machines.

## Migration strategy

The plan was to create a fresh configuration around Clan and the new architecture rather than refactoring in place, for three reasons:
1. It's recommended in the [Clan migration guide](https://docs.clan.lol/guides/getting-started/convert-flake/).
2. I wanted a public repository going forward, without rewriting history.
3. It offered a cleaner path.

I started by setting up a new VM following the getting started guide. The flake template helped. Once I had a working deployment—with host SSH keys and user/root passwords as secrets—I migrated the old configuration into the new pattern, added options to form meaningful abstractions, and placed them under `config.my.*`. It was fun taking some time and creating abstractions over different areas. One module, or rather set of modules, I found particularly meaningful was the ones related to router functionality. Network stuff isn't my specialty, and maintaining it was a bit fragile. Creating an abstraction layer on top makes maintenance easier, making changes like adding static ip addresses, forwarding ports and reverse proxying is now simplified. 

```nix,name=router/configuration.nix
{
  my.router = {
    enable = true;
    hostname = "io";
    lan = { subnet = "10.0.0"; interfaces = [ "enp2s0" "enp3s0" "enp4s0" ]; };

    machines = [
      { name = "makemake"; ip = "10"; mac = "00:d0:b4:02:bb:3c";
        portForwards = [ { port = 25; protocol = "tcp"; } ]; }
    ];

    wireguard.peers = [ { name = "phone"; ip = 2; publicKey = "<redacted>"; persistentKeepalive = 25; } ];

    nginx = {
      enable = true;
      acmeEmail = "per@stark.pub";
      wildcardCerts = [
        { name = "lanstark"; baseDomain = "lan.stark.pub"; dnsProvider = "cloudflare";
          environmentFile = config.my.secrets.getPath "api-key-cloudflare-dns" "api-token"; }
      ];
      virtualHosts = [
        { domain = "minne.stark.pub"; target = "makemake"; port = 3000; cloudflareOnly = true; }
      ];
    };
}
```

## Clan

### Inventory
One file lists machines and roles (router, server, workstation). Each entry sets hostname, users, networking roles, and which features to import. Below is an excerpt from my configuration, declaring three machines, sshd setup for all, admin module, the user p for all machines. Note that deploy.buildHost is set to @localhost, this is since I use my workstation to deploy from, letting it evaluate and build, saving time.

```nix,name=inventory.nix (excerpt)
{
  inventory = {
    machines.io = {
      deploy.targetHost = "root@io.lan";
      deploy.buildHost = "root@localhost";
      tags = ["server"];
    };
    machines.charon = {
      deploy.targetHost = "root@localhost";
      tags = ["client"];
    };
    instances = {
      sshd-basic = {
        module = {
          name = "sshd";
          input = "clan-core";
        };
        roles.server.tags.all = {};
        roles.client.tags.all = {};
      };
      user-p = {
        module = {
          name = "users";
          input = "clan-core";
        };
        roles.default.tags.all = {};
        roles.default.settings = {
          user = "p";
          prompt = true;
        };
      };
      admin = {
        roles.default.tags.all = {};
        roles.default.settings = {
          allowedKeys = {
            "p" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII6uq8nXD+QBMhXqRNywwCa/dl2VVvG/2nvkw9HEPFzn";
          };
        };
      };
  };
}
```

### Modules
Services are features under `modules/system` and `modules/home` exposed as `nixosModules.*` or `homeModules.*` and enabled per machine. Examples: reverse proxy, minne, media stack, backups. They all share the same pattern, which is somewhat more verbose, but offers some flake-parts niceties.

```nix,name=interception-tools.nix
{
  config.flake.nixosModules.interception-tools = {pkgs, ...}: {
    services.interception-tools = {
      enable = true;
    };
  };
}
```

This enables us to do several things. One is that we can use [import-tree](https://github.com/vic/import-tree), to import all nix files from a directory into our flake and import them to our configurations by importing using their declared names. This also enables us to share config.* between all our modules. Reusing used options between modules with ease.

```nix,name=io/configuration.nix
{
  imports = with modules.nixosModules;
    [
      interception-tools
      system-stylix
      shared
      options
      router
      home-assistant
      k3s
    ]
    ++ (with vars-helper.nixosModules; [default]);
}
```

### Secrets
Secrets use Clan "vars" on top of sops-nix. You might've noticed the vars-helper.nixosModules.default in the above code snippet. It's a wrapper around clan vars I made to improve ergonomics and add some additional features, you can find it [here](https://github.com/perstarkse/clan-vars-helper). For example it adds discovery of files by the use of tags, some helper functions to set up secrets in userspace, allow read access via ACL to secrets, wrapping commands in systemd environments for improved security.

### Private configuration
Having this structure meant that having a private repo containing sensitive bits, and importing this into my public configuration was quite straightforward. I set up a repository in a similar manner, with flake-parts, import-tree and sops (since I want to keep the secrets pertaining to services localized to where they are created).

```nix,name=hello-world-service.nix
{
  config.flake.nixosModules.hello-service = {
    config,
    pkgs,
    ...
  }: {
    # Set up sops and have it point to the secrets.yaml in the private repo, and the key managed by clan vars
    sops = {
      defaultSopsFile = ./../../secrets.yaml;
      age.sshKeyPaths = ["/run/secrets/vars/openssh/ssh.id_ed25519"];
      secrets.hello = {};
    };
    systemd.services.hello-world-tmp = {
      description = "Create hello world file with secret";
      serviceConfig.Type = "oneshot";
      script = ''
        ${pkgs.coreutils}/bin/echo "Hello from private repo!" > /tmp/hello-world
        ${pkgs.coreutils}/bin/echo "Secret: $(${pkgs.coreutils}/bin/cat ${config.sops.secrets.hello.path})" >> /tmp/hello-world
        ${pkgs.coreutils}/bin/chmod 644 /tmp/hello-world
      '';
      wantedBy = ["multi-user.target"];
    };
  };
}
```

This is then consumed by my public config
```nix,name=flake.nix
{
  private-infra = {
    url = "git+ssh://git@github.com/perstarkse/private-infra.git";
    inputs.nixpkgs.follows = "nixpkgs";
  };  
}
```

And then the modules are imported in my:
```nix,name=charon/configuration.nix
{
  imports  = ["module"] ++ (with private-infra.nixosModules; [hello-service]);
}
```

## End
At the point of writing I've reached the point where the summer is at it's last legs here in Sweden and all machines and services are migrated.

It's time for reflection. It's been a fun summer project, some aspects of it more than others. Assuming a dendritic nix pattern (ish) and utilizing options to create meaningful abstractions, reducing code duplication, improving maintainability sure was fun.

Implementing Clan, well, I knew it was going to be a bit of a challenge due to how early it was. Just in the past month documentation has really improved and I think getting started is significantly easier now. I really do enjoy clan vars, the sshd service. And I know there is significantly more services to use, distributed s3 storage, databases, etc.



```

# ./content/posts/n150_nixos_router/index.md

```md
+++
title = "N150 NixOS router, a guide"
date = 2025-05-23
draft = false
+++

## The why

For years, I’ve relied on two Google Nest Wi-Fi units to handle my home networking needs. To be fair, they’ve served me well—stable, low-maintenance, and good enough for day-to-day use. That’s probably why I kept postponing any kind of upgrade. But eventually, I reached a point where I felt it was time for a change.

There were a few things pushing me to make a change:

- I wanted more control over my network, and features such as VLAN tagging.
- And I was tired of managing everything through the Google Home app instead of using SSH.
- I wanted to explore running a NixOS router, I use NixOS for the rest of my machines and enjoy it.

## Hardware

A while back, I bought an N100-based motherboard and CPU combo from AliExpress. It was compact, power-efficient, and came with multiple NICs, M.2 slots, and SATA ports—plenty for most DIY network projects. It worked flawlessly and honestly exceeded expectations.

For the router I picked up an [N150-based board](https://www.aliexpress.com/item/1005004360072281.html), added an M.2 SSD and 16GB of DDR5 RAM (which is probably overkill, but useful for future flexibility), and got to work. Besides routing, I also plan to run a few lightweight networking services on it. I already have a separate server for heavier workloads, but it’s nice to spread things out and keep the network-focused features close to the router itself.

## Unboxing and installation

The N150 device was packaged quite neatly and contained all the specified parts. The device feels quite sturdy. I forgot to order a wall mount, which topton sells via Aliexpress, so I decided to print [one](https://www.printables.com/model/903657-slim-wall-mount-for-topton-mini-pc/files) instead.

{{ figure(src="./n150_mini_pc.webp", alt="mini pc", caption="View from bottom with backplate dismounted")}}
Installing the M.2 SSD and RAM was quite simple. The device opened easily by removing four screws in the bottom.

It booted directly, recognizing the RAM and disk without issue. Inspecting BIOS settings showed appropriate settings to my knowledge. VT-d enabled. i226 LAN PXE was disabled, but I don't plan to use it.

Installing NixOS went without flaw. Its always a bit of a chore setting up secrets management on a new device but it's fairly straight forward. I use sops as well as git-agecrypt. The installer correctly set the hardware.cpu.intel.updateMicrocode to the same value as nixos-hardware.

## System Configuration

The N150 hardware has some known issues with power management that are common among budget mini PCs. BIOS options for power limiting and advanced C-state control are often limited or non-functional.

I applied some power management configuration. Please get in touch if you've got better ideas on how to do it.

```nix
{
environment.systemPackages = [
  pkgs.lm_sensors
  pkgs.powertop
];

services.tlp.enable = true;
powerManagement = {
  enable = true;
  powertop.enable = true;
  cpuFreqGovernor = "powersave";
};

boot.kernelParams = [
  "intel_pstate=passive"
  "processor.max_cstate=6"
];

boot.blacklistedKernelModules = [ "i915" ];
}
```

The results seems decent for now. At idle, the system maintains:

- **CPU temperatures**: 42-46°C across all cores
- **NVMe SSD**: 59-65°C
- **C-state behavior**: Individual cores spend 99% of time in deep sleep states (C6/C7), while the package maintains lighter sleep (C2).

The device is clearly warm/hot to the touch. But the provided temperatures shows it's acceptable for now. I plan to wall mount it, which according to someone at STH forums improved cooling somewhat.

When configuring the network settings and testing it became clear there is an issue when inserting in to NIC ports which are down, it will not go up again. It turned out that PCIe port power management and EEE is responsible. Setting this resulted in everything working as it should.

```
boot.kernelParams = [
  "pcie_port_pm=off" # Disable PCIe port power management
  "igc.eee_enable=0" # Disable Energy Efficient Ethernet
];
```

## Network configuration

A benefit of doing this on NixOS is having the configuration evaluated before runtime. This makes it easy to catch errors, like the one below I encountered when mistyping a firewall rule.

```
ruleset.conf:13:60-86: Error: Statement after terminal statement has no effect
iifname "enp1s0" tcp dport 22 limit rate 5/minute accept commen "Allow SSH from WAN"
```

Another aspect I enjoyed was evaluating and building the router system remotely from my workstation, deploying it over SSH. This both saves time and makes for a great workflow experience.

```
nixos-rebuild switch --flake .#io --target-host root@io.lan --use-remote-sudo
```

For the networking stack I settled for:

- systemd-networkd
- nftables
- Unbound
- Kea DHCP

### Update after running it for a couple of months

At this point in time I've used the router with mostly that same settings for a couple of months. The device has worked flawlessly. The N150 is a quite capable device. At one point I had my usual build server down in a migration, and the N150 acted as a fully capable build server in the meantime. I was a bit mindful of the temperatures, but it has not been an issue, idling at 46 degrees C. 

I had one outage, and it was when cloudflare dns was down, showcasing the vulnerability of having it as the sole dns resolver. I've since done some revisions, but that's mainly been adding additional features and abstracting some settings into a more user friendly (me friendly in the future) interface. If you're interested the code is reachable [here](https://github.com/perstarkse/infra/tree/main/modules/system/router) and enables a router configured by the following

```nix
 my.router = {
    enable = true;
    hostname = "io";
    lan = {
      subnet = "10.0.0";
      dhcpRange = { start = 100; end = 200; };
      interfaces = ["enp2s0" "enp3s0" "enp4s0"];
    };
    wan.interface = "enp1s0";
    ipv6.ulaPrefix = "fd00:711a:edcd:7e75";

    wireguard = {
      enable = true;
      peers = [
        {
          name = "phone";
          ip = 2;
          publicKey = "NWwGu+pFOMhV6r6mlE7efbe1qSEU8cPHKljl+j1Wxxo=";
          persistentKeepalive = 25;
        }
      ];
    };

    machines = [
      {
        name = "charon";
        ip = "15";
        mac = "f0:2f:74:de:91:0a";
        portForwards = [];
      }
      {
        name = "makemake";
        ip = "10";
        mac = "00:d0:b4:02:bb:3c";
        portForwards = [
          { port = 25; protocol = "tcp"; }
          { port = 465; protocol = "tcp"; }
          { port = 993; protocol = "tcp"; }
          { port = 32400; protocol = "tcp"; }
        ];
      }
    ];

    services = [
      { name = "mail.stark.pub";    target = "10.0.0.10"; }
      { name = "chat.stark.pub";    target = "10.0.0.1"; }
      { name = "minne.stark.pub";   target = "10.0.0.1"; }
      { name = "request.stark.pub"; target = "10.0.0.1"; }
      { name = "vault.stark.pub";   target = "10.0.0.1"; }
    ];

    dhcp = {
      enable = true;
      validLifetime = 86400;
      renewTimer = 43200;
      rebindTimer = 75600;
      domainName = "lan";
    };

    dns = {
      enable = true;
      upstreamServers = [
        "1.1.1.1@853#cloudflare-dns.com"
        "1.0.0.1@853#cloudflare-dns.com"
        "2606:4700:4700::1111@853#cloudflare-dns.com"
        "2606:4700:4700::1001@853#cloudflare-dns.com"
      ];
      localZone = "lan.";
    };

    nginx = {
      enable = true;
      acmeEmail = "services@stark.pub";
      ddclient.enable = true;
      virtualHosts = [
        { domain = "vault.stark.pub";   target = "makemake"; port = 8322; websockets = true; lanOnly = true; acmeDns01 = { dnsProvider = "cloudflare"; environmentFile = config.my.secrets.getPath "api-key-cloudflare-dns" "api-token"; }; }
        { domain = "chat.stark.pub";    target = "makemake"; port = 7909; websockets = true; cloudflareOnly = true; }
        { domain = "request.stark.pub"; target = "makemake"; port = 5055; websockets = true; cloudflareOnly = true; }
        {
          domain = "minne.stark.pub";
          target = "makemake";
          port = 3000;
          websockets = false;
          cloudflareOnly = true;
          extraConfig = ''
            proxy_set_header Connection "close";
            proxy_http_version 1.1;
            chunked_transfer_encoding off;
            proxy_buffering off;
            proxy_cache off;
          '';
        }
        {
          domain = "minne-demo.stark.pub";
          target = "makemake";
          port = 3001;
          websockets = false;
          cloudflareOnly = true;
          extraConfig = ''
            proxy_set_header Connection "close";
            proxy_http_version 1.1;
            chunked_transfer_encoding off;
            proxy_buffering off;
            proxy_cache off;
          '';
        }
      ];
    };
```

### Flake (initial)

Im fairly certain there are some improvements to be done, and possibly some redundancies. I suspect it will be a work in progress for quite some while. But having this declarative nature (and rollbacks) is as always a huge benefit when iterating. Should you the reader have any questions or suggestions feel free to reach out by [mail](mailto:per@stark.pub).

```nix
{pkgs, ...}: let
  lanSubnet = "10.0.0";
  lanCidr = "${lanSubnet}.0/24";
  routerIp = "${lanSubnet}.1";
  dhcpStart = "${lanSubnet}.100";
  dhcpEnd = "${lanSubnet}.200";

  # Machines
  charon = "${lanSubnet}.15";
  makemake = "${lanSubnet}.10";
  encke = "${lanSubnet}.156";

  ulaPrefix = "fd99:d22a:eddd:7e75";
in {
  boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = true;
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.enp1s0.rp_filter" = 1;
    "net.ipv4.conf.br-lan.rp_filter" = 1;

    "net.ipv6.conf.all.forwarding" = true;
    "net.ipv6.conf.all.accept_ra" = 0;
    "net.ipv6.conf.all.autoconf" = 0;
    "net.ipv6.conf.all.use_tempaddr" = 0;
  };

  boot.kernelParams = [
    "pcie_port_pm=off" # Disable PCIe port power management
    "igc.eee_enable=0" # Disable Energy Efficient Ethernet
  ];

  networking = {
    hostName = "io";
    useNetworkd = true;
    useDHCP = false;
    networkmanager.enable = false;
    firewall.enable = false;

    nftables = {
      enable = true;
      tables = {
        filterV4 = {
          family = "ip";
          content = ''
            chain input {
              type filter hook input priority 0; policy drop;
              iifname "lo" accept
              iifname "br-lan" accept
              iifname "enp1s0" ct state established,related accept
              iifname "enp1s0" ip protocol icmp accept
            }
            chain forward {
              type filter hook forward priority 0; policy drop;
              iifname "br-lan" oifname "enp1s0" accept
              iifname "enp1s0" oifname "br-lan" ct state established,related accept
              iifname "enp1s0" oifname "br-lan" ip daddr ${makemake} tcp dport { 80, 443, 25, 465, 993 } accept
            }
          '';
        };
        natV4 = {
          family = "ip";
          content = ''
            chain prerouting {
              type nat hook prerouting priority -100;
              iifname "enp1s0" tcp dport { 80, 443, 25, 465, 993 } dnat to ${makemake}
            }
            chain postrouting {
              type nat hook postrouting priority 100;
              oifname "enp1s0" masquerade
            }
          '';
        };
        filterV6 = {
          family = "ip6";
          content = ''
            chain input {
              type filter hook input priority 0; policy drop;
              iifname "lo" accept
              iifname "br-lan" accept
              iifname "enp1s0" ct state established,related accept
              iifname "enp1s0" icmpv6 type {
                destination-unreachable, packet-too-big, time-exceeded,
                parameter-problem, nd-router-advert, nd-neighbor-solicit,
                nd-neighbor-advert
              } accept
              iifname "enp1s0" udp dport dhcpv6-client udp sport dhcpv6-server accept
            }
            chain forward {
              type filter hook forward priority 0; policy drop;
              iifname "br-lan" oifname "enp1s0" accept
              iifname "enp1s0" oifname "br-lan" ct state established,related accept
            }
          '';
        };
      };
    };
  };

  systemd.network = {
    enable = true; 

    # Define the bridge device itself
    netdevs."20-br-lan" = {
      netdevConfig = {
        Kind = "bridge";
        Name = "br-lan";
      };
    };

    networks = {
      # WAN interface configuration (enp1s0)
      "20-wan" = {
        matchConfig.Name = "enp1s0";
        networkConfig = {
          DHCP = "yes"; 
          IPv4Forwarding = true;
          IPv6Forwarding = true;
          IPv6AcceptRA = true; 
        };
        dhcpV6Config.WithoutRA = "solicit"; 
        linkConfig.RequiredForOnline = "routable";
      };

      # LAN bridge (br-lan) configuration
      "10-br-lan" = {
        matchConfig.Name = "br-lan";
        # Addresses for the router on the LAN bridge
        address = [
          "${routerIp}/24"
          "${ulaPrefix}::1/64" 
        ];
        networkConfig = {
          ConfigureWithoutCarrier = true; 
          DHCPPrefixDelegation = true; 
          IPv6SendRA = true; 
          IPv6AcceptRA = false; 
        };
        bridgeConfig = {}; 
        ipv6Prefixes = [
          {
            AddressAutoconfiguration = true;
            OnLink = true;
            Prefix = "${ulaPrefix}::/64";
          }
        ];
        linkConfig.RequiredForOnline = "no";
      };

      # Configure enp2s0 to be part of br-lan
      "30-enp2s0-lan" = {
        matchConfig.Name = "enp2s0";
        networkConfig = {
          Bridge = "br-lan";
          ConfigureWithoutCarrier = true;
        };
      };
      # Configure enp3s0 to be part of br-lan
      "30-enp3s0-lan" = {
        matchConfig.Name = "enp3s0";
        networkConfig = {
          Bridge = "br-lan";
          ConfigureWithoutCarrier = true;
        };
      };
      # Configure enp4s0 to be part of br-lan
      "30-enp4s0-lan" = {
        matchConfig.Name = "enp4s0";
        networkConfig = {
          Bridge = "br-lan";
          ConfigureWithoutCarrier = true;
        };
      };
    };
  };

  services.unbound = {
    enable = true;
    settings = {
      server = {
        interface = [
          "127.0.0.1"
          "::1"
          routerIp
          "${ulaPrefix}::1"
        ];
        access-control = [
          "127.0.0.0/8 allow"
          "::1 allow"
          "${lanCidr} allow"
          "${ulaPrefix}::/64 allow"
          "0.0.0.0/0 refuse"
          "::0/0 refuse"
        ];
        cache-min-ttl = 0;
        cache-max-ttl = 86400;
        do-tcp = true;
        do-udp = true;
        prefetch = true;
        num-threads = 1;
        so-reuseport = true;
        local-zone = ''
          "lan." static
        '';
        local-data = [
          # Router
          ''"io.lan. IN A ${routerIp}"''
          ''"io.lan. IN AAAA ${ulaPrefix}::1"''

          # Machines
          ''"charon.lan. IN A ${charon}"''
          ''"makemake.lan. IN A ${makemake}"''
          ''"encke.lan. IN A ${encke}"''

          # Services
          ''"mail.stark.pub. IN A ${makemake}"''
        ];
      };
      forward-zone = [
        {
          name = ".";
          forward-addr = [
            "1.1.1.1@853#cloudflare-dns.com"
            "1.0.0.1@853#cloudflare-dns.com"
            "2606:4700:4700::1111@853#cloudflare-dns.com"
            "2606:4700:4700::1001@853#cloudflare-dns.com"
          ];
          forward-tls-upstream = true;
        }
      ];
    };
  };

  services.kea.dhcp4 = {
    enable = true;
    settings = {
      interfaces-config.interfaces = ["br-lan"];
      lease-database = {
        name = "/var/lib/kea/dhcp4-leases.csv";
        type = "memfile";
        persist = true;
        lfc-interval = 3600;
      };
      valid-lifetime = 86400;
      renew-timer = 43200;
      rebind-timer = 75600;
      subnet4 = [
        {
          id = 1;
          subnet = lanCidr;
          pools = [
            {
              pool = "${dhcpStart} - ${dhcpEnd}";
            }
          ];
          reservations = [
            {
              hw-address = "f0:2f:74:de:91:0a";
              ip-address = "${charon}";
              hostname = "charon";
            }
            {
              hw-address = "00:d0:b4:02:bb:3c";
              ip-address = "${makemake}";
              hostname = "makemake";
            }
            {
              hw-address = "52:54:00:a7:db:fe";
              ip-address = "${encke}";
              hostname = "encke";
            }
          ];
          option-data = [
            {
              name = "routers";
              data = routerIp;
            }
            {
              name = "domain-name-servers";
              data = routerIp;
            }
            {
              name = "domain-name";
              data = "lan";
            }
          ];
        }
      ];
    };
  };
}

```

```

# ./content/posts/i3_to_hyprland/index.md

```md
+++
title = "Migrating from i3/X11 to Hyprland on NixOS"
subtitle = "Impressions, quirks and more"
date = 2025-05-21
draft = false
+++

## Introduction

After years of using a stable X11 + i3 setup (with an **NVIDIA GTX 1650** and an ultra-wide monitor), I decided it was time to make the move to Wayland. While my X11 setup “just worked” (apart from some minor screen tearing fixed with `ForceFullCompositionPipeline`), it’s clear Wayland is the future, and migration is inevitable for anyone running Linux on modern hardware. When looking at alternatives I tried a couple, Sway, Niri, before settling on Hyprland. I looked around and tried to find more experiences of doing the switch that I was planning, but found limited. Therefore I thought I’d share mine, hopefully helpful for someone else.

## Setup

- **OS**: NixOS (unstable channel, flake-based config)
- **GPU**: NVIDIA GTX 1650 (proprietary drivers)
- **Monitor**: Ultra-wide, variable refresh rate supported
- **VFIO/GPU passthrough**: yes, somewhat involved boot/kernel config

## Initial Steps & Installation

The **Hyprland** wiki was well written and easy to follow. For NixOS, you have the choice between the package or pulling the repo as a Flake. To stay current, I opted to use the flake solution.

A few key points:

- Environment variables and NVIDIA tweaks are essential (see Hyprland FAQ and wiki).
- Use **proprietary NVIDIA driver** for GTX 1650 and similar, the open version is recommended.
- For VFIO passthrough, ensure kernel modules for NVIDIA are loaded at the right stage (initrd).
- Oddly, you may still need to set the X11 driver to `"nvidia"` in your NixOS config—even if you’re not using X11 anymore.

```nix
{
services.xserver.videoDrivers = [ "nvidia" ];
}
```

Debugging involved `journalctl`, `dmesg`, and careful reading of `nvidia-smi` outputs.

## Memory leaks!

So one issue that became evident a while in was issues with VRAM memory. Hyprland was using up all there was, causing graphical glitches, issues with setting windows to fullscreen. Some debugging and I found this [issue](https://github.com/NVIDIA/egl-wayland/issues/126#issuecomment-2379945259) and solution. Following those instructions it now seems stable.

## Final Thoughts

I’ll see where this goes. These are my notes and impressions just a couple of days in. I hope to return to the topic in a while.

## August update

I used Hyprland for a couple of months, and the ecosystem. Some plugins were nice. The flash on focus change was in particular nice. I tried with some different tiling methods. Didn't really find any to my full liking. Qutebrowser kept crashing occasionally. It used quite a lot of VRAM. For many that might not be an issue, but I only have 4GB, and on more than once occasion I had to close windows to free VRAM.

The choice was now between other wayland window managers and going back to i3. I figured I should give Sway another change, and I'm glad I did. I've not had any issues what so ever. The fix above regarding memory leaks is still needed. I created a small program that hooks into the sway IPC to create a opacity effect on focus change. Inspired by the one created for Hyprland. For my usage, where I have thin borders and no gaps, it's sometimes helpful for seeing which is the focused window when switching focus. Feel free to look it up, I've precompiled binaries and it's built using rust so performance implications are minimal. [Source](https://github.com/perstarkse/sway-focus-flash) 

{{ figure(src="./screenshot.webp", alt="screenshot", caption="Current layout when working on this post, showcasing the opacity effect when switching focus to the main window")}}

All in all, Hyprland is quite interesting. It has an vast community behind it, of people really interested in improving their workflow and making things look pretty. It still has some quirks and rough edges, and it will be fun to see where it's at in a while.

```

# ./content/posts/foss_deployment_strategies.md

```md
+++
title = "FOSS deployment strategies"
draft = true
+++
# Deployment strategies

I'm the developer behind a solution for storing knowledge over time, [Minne](https://github.com/perstarkse/minne). I've preivously tried a couple of solutions (Obsidian, Logseq, plain .md files) and none really did all I wanted. Then I discovered Karakeep, previously named Hoarder, which did almost all I wanted, but then I was already head deep in development and wanted to continue. I digress, I'm supposed to talk about deployment strategies. I plan to open source this, which means I have to think somewhat about possible means of deployment. I set up a couple of requirements for myself when developing it which also influences my choices/options here.

- It should be able to browse the web, to scrape and screenshot, it has chromium as a dependency.
- It should be possible to run it as a server and worker separately on different machines communicating via a queue in the db.
- It should be limited in what dependencies it uses besides rust native ones.

So for binaries I've settled for three different ones.

- Server, runs the API, serving the pages, and handling api requests.
- Worker, responsible for ingesting submitted content, which could prove to be resource intensive, especially running with local llms.
- Main which runs both the server and the worker.

It has two dependencies, a SurrealDB instance and Chromium.

For releasing, frequently requested is a docker container.
Docker compose
Github actions
Musl vs gnu
Nix flake


```

# ./content/posts/eval-retrieval-refactor/index.md

```md
+++
title = "How I Learned to Stop Worrying and Love Simplicity: Refactoring a Retrieval Pipeline Through Evaluation"
date = 2025-11-10
draft = true

[extra]
lang = "en"
toc = true
mermaid = true
+++

{% detail(title="TLDR", default_open=true) %}
- The author is the developer behind [Minne](https://github.com/perstarkse/minne)
- Minne uses a combined retrieval strategy for the "slow search" consisting of vector comparison, full text search, exploration of a graph database
- Current design was created in 2024, inspired by psychology and a zettlekasten style of knowledge mapping
- The post details the process of implementing a evaluation pattern against two established datasets to evaluate and steer continued development
- Minor improvements to full scale refactoring
{% end %}

## How did I actually get in this mess, and background
For the past year my passion project has been developing [Minne](https://github.com/perstarkse/minne), which is a save-for-later and personal knowledge management system (PKMS). Since learning about the [Zettlekasten](https://zettelkasten.de/introduction/) method, I became quite enamored with the idea of having a personal knowledge database. I've tried a couple of different tools, but none really to my like. While I truly believe a lot of the benefits of a PKMS comes from the manual process of creating links between knowledge and documents, by means of creating neural pathways and working through knowledge, I've learned that I'm not *that* enamored with PKMS. But I believe that storing all knowledge in a single place, making it easy to explore, searchable and changeable still offers a great tool for my every day life and learning. So development began.

When designing Minne in 2024 I envisioned having content as a base layer, and then extracted knowledge entities as an abstraction of it. And that this higher level plane of knowledge could work well for searching and working on. That then these knowledge entities are based in and connected to the underlying documents/content that it was derived from. I think it came out quite nifty, and to some respect it mimics a human learning pattern.

{% mermaid() %}
flowchart TB
subgraph Ingestion
A[Content] --> B[Chunks]
B --> C[Knowledge Entities]
end
subgraph Retrieval
C --> D[Graph Exploration]
C --> E[Vector + Text Search]
end
{% end %}

 We humans learn these higher level abstractions connected to different entities which we then can reference and explore if we need more detail. That these second layer knowledge entities exists as a compressed version and that some fidelity loss occurs but that's fine. Cant overload the context anyways, then we loose quality.

### Current retrieval pipeline

In the application we look through this knowledge entity database in two separate occurrences. For simplicity I call this *slow search*. As of writing, this retrieval pipeline consists of vector comparison, full text search, and exploration of the graph database.
{% mermaid() %}
flowchart LR
Q[Query/Embedding] --> V[Vector Search]
Q --> L[Lexical Search]
V --> M[Fuse Scores]
L --> M
M --> D[Expand Graph]
D --> E[Attach Chunks]
E --> F[Rerank]
F --> G[Assemble]
{% end %}


- When we ingest new content, we run slow search so the LLM that creates new knowledge entities can link them to existing ones and work with a context-aware view of the graph.
- When we chat with an LLM in the application, it gets the result of slow search as context, which lets it answer in a knowledge-aware way and attach references.

While I *like* the current design, it's not the fastest. We run several different database operations on quite a lot of data, using the knowledge entities as primary candidates. The project has started to see some real users, and I'd like to explore optimizing the retrieval pipeline. It should serve its purpose first, not just give me the pleasure of maintaining a complex retrieval pipeline.

{{ figure(src="./office-space-meme.webp", alt="meme trying to captivate my current stance on the complex retrieval pipeline", caption="What does this *nice* and complex retrieval pipeline actually do for me—and is it doing it well enough to justify the complexity?")}}

## Getting started
So to proceed I opted to set up two evaluation frameworks. One strictly for speed, and the other one for accuracy. At this point in time I'm not evaluating the actual LLM performance, but rather the accuracy of the slow search itself. Is the answer to a question inside the data retrieved from our knowledge system?

### Datasets
For datasets I met a interesting decision. What type of data should this "slow search" be optimized for. What are the users actually ingesting in the system? What am I ingesting? I've found I use it for an assortment of things, written notes, audio notes, links for reading later, some pdf documents. But creating a meaningful representative dataset would be hard. So even though it would have been preferred I opted to abandon creating my own dataset, and use established ones. I chose two:
- SQUAD v2, it acts as a simpler and lighter dataset. Shorter paragraphs.
- Natural Questions, dev. Its a dataset on wikipedia articles. Some articles are really long and could prove to be challenging.

### Implementation details
For my current design, each evaluation would mean running each article through the ingestion pipeline, so it could create the knowledge entities and its relationships. Which is a somewhat costly operation. For each question, to make sure I had a lot of incorrect potential answers, I opted to ingest nine incorrect contexts. Which meant that to answer the first 200 questions, I had to ingest in total 2000 articles. Total character for the first 2000 articles in either dataset totaled [TODO:]. So considering the effort into converting the raw dataset to my knowledge design, I needed persistence. That way I could do changes on the retrieval pipeline on a static set. And if I were to change the ingestion pipeline, I could recreate the set. I also wanted to have a variety of options to modify at runtime, like amount of snippets to pass. Total amount to retrieve from initial search, enable re-ranking etc.

I opted to persist the converted dataset to disk, but to use a in memory database. I use surrealdb for this project since I was mindful of dependencies and it offered a clear path to having all these db features in a single package. Surrealdb has some nice features, a in-memory db is great for smoke tests, unit tests, etc. For each eval run I'd spin up a in memory db, either generate or import the converted dataset. Persist the data to the db. Create indexes. As you might have guessed, creating indexes for 2000 wikipedia articles takes a while, two BM25 indexes, and two HNSW indexes... But I managed to get the eval harness quite decently working, using transactions to create efficient batches. However parallelizing index creation was not fruitful. Creating a new index was done in a single thread, and concurrency was strictly not possible for in-memory surrealdb. I've not tested if it works better with other types of database initialization, should anyone have an idea on how to improve the in-memory path, please reach out!

### Initial testing
Initial runs on datasets showed the following results, which in my opinion are fairly respectable, except for latency. The majority of latency comes from the embedding and reranking, especially since I run the retrieval pipeline in parallel, batches of five. 
Initial testing showed clear room for improvement, it performed decently on squad, but did not manage to get the initial natural-questions questions correct. Prompting some quick improvement to the retrieval pipeline to boost the score assigned to lexical search and we managed to get it passing. However this was just a quick bolt-on, not the actual "what really is important for this retrieval process? Can we scale away redundant stuff?" 







```

# ./content/posts/what-makes-for-a-good-life.md

```md
+++
title = "What makes for a good life, Per at 35 years old"
draft = true
+++

- How do I disable the trackpad via a simple command?
- What parts of my retrieval pipeline are especially important?
- Why are people finding some of my projects interesting?

These are questions that bring me real joy. I think a central theme is curiosity. For me that's been a driver for as long as I can remember, and a great source of joy.

I think the title of this post is a bit ambitious, but thinking about what constitutes a good life has been on my mind for a long time. I've come into contact with the question in different forms over the years, via philosophy studies, introspection, clinical psychology practice and more. The time is here to put some words down on paper, sort of...

I cannot in any regard hold myself as a guru, but I've met a lot of people in distress, existential dread, depression and more. And being a certified psychologist I've got a grasp on what current psychological treatments entail, and those evidently help a lot of people. To clarify, the treatment manuals and teachings by themselves don't claim to know the answer to this question, but they navigate in that territory.

I've changed perspective somewhat in the past decade or so, of when I've had a somewhat coherent and internally consistent theory on the subject, and I might very well come to see this current post as incorrect in the long run, hopefully I'll view the current self as naive and lovable.

## The importance of the now

I cant for the life of me recall any clear and great metaphors. But everything is happening now. There is in this very moment, a now happening around me. Sometimes this is very evident, like getting slapped real bad. Your experience is wholly on the here and now. There is ample attention paid in clinical practice to mindfulness in different forms and it's a great practice. It's a tool helpful for getting to the now. Being in the now, with my children and family, there exists nothing else. That is a very healthy state to visit from time to time. For a while in life I spent the majority of time in that state, like on a grander scale treading a path in the forest in the dark with only a small lantern. I fared well, was happy and maintained meaningful connections and stimuli.

## Radical acceptance

I am mindful to not appear vain, self-glorifying or narcissistic. I am at times a bit nervous in situations where I want to perform well. I've on occasion participated in media interviews talking about psychology, and I've worried about colleagues reaching out or talking about how I performed badly. I am at times a bit socially daft, missing cues. These are aspects of me that I'm not sure that I'd want to change. I love that I get nervous in situations where I want to perform well. I love that I'm downplaying accomplishments and that's fine. It still is something I want to work on to perform even better in life, but I love where I am at still. It says something meaningful about me and the path that I am on. I can choose to accept the current situation and reality, and try and see it for the good and the bad, or I can choose to reject it, and helping myself how?

## On reality

There is probably no real objective reality. We might near it in some domains and experience, but in most situations involving humans, our perspective of reality differs greatly depending on an inordinate amount of factors. Keeping this in mind imparts a subtle humility on facing situations. 


```

# ./content/posts/bundling-onnxruntime-rust-nix.md

```md
+++
title= "Bundling ONNX Runtime in Rust with Nix, Docker and GitHub Actions"
date= 2025-11-02
description= "Learn how to bundle onnxruntime, or any other dependency, with examples from Nix, Docker and GitHub CI"
+++

{% detail(title="TLDR", default_open=true) %}

* I added reranking to Minne and that pulled in fastembed + ort
* That worked locally but not in Nix, Docker and CI
* The fix was to make onnxruntime an explicit dependency in every environment instead of letting the crate download it
* Below is the pattern I used, plus actual snippets
  {% end %}

## Why I’m even writing this

I like shipping stuff that can be run in several ways: Nix flake, build from source, Docker, and release binaries. That’s what I’ve been doing for [Minne](https://github.com/perstarkse/minne). Up until v0.2.6 this was fine.

Then I enabled reranking by pulling in `fastembed-rs`, which in turn uses `ort`. Locally it worked great: the crate downloads what it needs. But my deployment methods failed: Nix (sandbox, no network), Docker and through GitHub Actions (Windows in particular) things broke.

So this post is me writing down the approach I ended up with. It’s centered on my case, but the idea in general is to stop relying on crate download magic, and supply dependencies myself.

## The core idea

Before diving into Nix, Docker and CI, here’s the model I ended up with:

1. **Turn off auto-download in the Rust crate via features.** no build-time network calls.
2. **Put ONNX Runtime somewhere predictable** for each environment.
3. **Teach the application to look for it in a predictable way** (`ORT_DYLIB_PATH` + a small fallback).
4. **Repeat the same** in Nix, Docker, GitHub Actions, and release archives.

That’s it. Everything below is just doing this four times.

## What changed in the Rust side

This was the dependency line I used:

```toml
fastembed = { version = "5.2.0", default-features = false, features = ["hf-hub-native-tls", "ort-load-dynamic"] }
```

The important parts:

* `default-features = false` so it doesn’t pull in download stuff I don’t control.
* `ort-load-dynamic` so it uses `dlopen()` and respects `ORT_DYLIB_PATH`.

Then I made the app look for the lib like this:

```rust
use std::{env, path::PathBuf};

fn ort_lib_dir() -> PathBuf {
    if let Ok(p) = env::var("ORT_DYLIB_PATH") {
        return PathBuf::from(p);
    }

    // fallback: ./lib next to binary
    let exe = env::current_exe().unwrap_or_else(|_| PathBuf::from("."));
    exe.parent()
        .map(|p| p.join("lib"))
        .unwrap_or_else(|| PathBuf::from("./lib"))
}
```

So every deployment method only has to do one of these:

* set `ORT_DYLIB_PATH` to the actual file
* or package `libonnxruntime.*` in `./lib`

I think this is the interesting reusable bit.

## Why Nix complained

Nix builds in a sandbox and only sees declared inputs. Quoting the Nix manual: when `sandbox = true`, builds only see the Nix store, the build dir and what you bind in. Network is isolated for normal derivations.

So a crate that wants to download ONNX Runtime during build or run is not going to work inside that sandbox. That forced me to make ONNX Runtime a real input.

### My Nix flake for Minne

This is the shape I used (shortened to the relevant bit):

```nix
{
  description = "Minne application flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    crane.url = "github:ipetkov/crane";
  };

  outputs = { self, nixpkgs, flake-utils, crane }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        lib = pkgs.lib;
        craneLib = crane.mkLib pkgs;
        libExt = if pkgs.stdenv.isDarwin then "dylib" else "so";
        minne-pkg = craneLib.buildPackage {
          src = lib.cleanSourceWith {
            src = ./.;
            filter = let
              extraPaths = [
                (toString ./common/migrations)
                (toString ./common/schemas)
                (toString ./html-router/templates)
                (toString ./html-router/assets)
              ];
            in
              path: type:
                craneLib.filterCargoSources path type
                || lib.any (x: lib.hasPrefix x (toString path)) extraPaths;
          };

          pname = "minne";
          version = "0.2.6";
          doCheck = false;

          nativeBuildInputs = [ pkgs.pkg-config pkgs.rustfmt pkgs.makeWrapper ];
          buildInputs = [ pkgs.openssl pkgs.chromium pkgs.onnxruntime ];

          postInstall = ''
            wrapProgram $out/bin/main \
              --set CHROME ${pkgs.chromium}/bin/chromium \
              --set ORT_DYLIB_PATH ${pkgs.onnxruntime}/lib/libonnxruntime.${libExt}
            for b in worker server; do
              if [ -x "$out/bin/$b" ]; then
                wrapProgram $out/bin/$b \
                  --set CHROME ${pkgs.chromium}/bin/chromium \
                  --set ORT_DYLIB_PATH ${pkgs.onnxruntime}/lib/libonnxruntime.${libExt}
              fi
            done
          '';
        };
      in {
        packages = {
          minne-pkg = minne-pkg;
          default = minne-pkg;
        };
      });
}
```

Key points:

* I pulled in `pkgs.onnxruntime` as a normal build input.
* I wrapped the binaries to **set** `ORT_DYLIB_PATH` to that exact file.
* Chromium is also wrapped.

So the Nix solution is: “declare ONNX Runtime as an input, and hard-set the env var when installing.”

## Docker: bake it in

Docker is looser than Nix, so it could have worked with download on startup, but I don't want another feature set and I prefer to align all deployment methods to the same pattern. So I downloaded the exact ONNX Runtime release during the build and set the env var in the image.

This is the Dockerfile I used:

```dockerfile
# === Builder ===
FROM rust:1.86-bookworm AS builder
WORKDIR /usr/src/minne
RUN apt-get update && apt-get install -y --no-install-recommends \
    pkg-config clang cmake git && rm -rf /var/lib/apt/lists/*

# Cache deps
COPY Cargo.toml Cargo.lock ./
RUN mkdir -p api-router common composite-retrieval html-router ingestion-pipeline json-stream-parser main worker
COPY api-router/Cargo.toml ./api-router/
COPY common/Cargo.toml ./common/
COPY composite-retrieval/Cargo.toml ./composite-retrieval/
COPY html-router/Cargo.toml ./html-router/
COPY ingestion-pipeline/Cargo.toml ./ingestion-pipeline/
COPY json-stream-parser/Cargo.toml ./json-stream-parser/
COPY main/Cargo.toml ./main/
RUN cargo build --release --bin main --features ingestion-pipeline/docker || true

# Build
COPY . .
RUN cargo build --release --bin main --features ingestion-pipeline/docker

# === Runtime ===
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    chromium libnss3 libasound2 libgbm1 libxshmfence1 \
    ca-certificates fonts-dejavu fonts-noto-color-emoji \
    libgomp1 libstdc++6 curl \
  && rm -rf /var/lib/apt/lists/*

ARG ORT_VERSION=1.22.0
RUN mkdir -p /opt/onnxruntime && \
    curl -fsSL -o /tmp/ort.tgz \
      "https://github.com/microsoft/onnxruntime/releases/download/v${ORT_VERSION}/onnxruntime-linux-x64-${ORT_VERSION}.tgz" && \
    tar -xzf /tmp/ort.tgz -C /opt/onnxruntime --strip-components=1 && rm /tmp/ort.tgz

ENV CHROME_BIN=/usr/bin/chromium \
    SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt \
    ORT_DYLIB_PATH=/opt/onnxruntime/lib/libonnxruntime.so

RUN useradd -m appuser
USER appuser
WORKDIR /home/appuser

COPY --from=builder /usr/src/minne/target/release/main /usr/local/bin/main
EXPOSE 3000
CMD ["main"]
```

So here the pattern is: **download once at build time, put it under `/opt/onnxruntime`, set `ORT_DYLIB_PATH`**. No runtime download.

TODO: add line about changing to GPU build of ONNX Runtime if needed. `[todo!]`

## GitHub Actions

I added a block in the GH workflow that creates a `lib/` dir and downloads the matching ONNX Runtime artifact per OS, then lets `cargo-dist` package it, and also set the dist toml file to include the lib folder when building.

```yaml
    - name: Prepare lib dir (Unix)
      if: runner.os != 'Windows'
      run: |
        mkdir -p lib
        rm -f lib/*

    - name: Prepare lib dir (Windows)
      if: runner.os == 'Windows'
      shell: pwsh
      run: |
        New-Item -ItemType Directory -Force -Path lib | Out-Null
        Get-ChildItem -Path lib -Force | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue

    - name: Fetch ONNX Runtime (Linux)
      if: runner.os == 'Linux'
      env:
        ORT_VER: 1.22.0
      run: |
        set -euo pipefail
        ARCH="$(uname -m)"
        case "$ARCH" in
          x86_64)  URL="https://github.com/microsoft/onnxruntime/releases/download/v${ORT_VER}/onnxruntime-linux-x64-${ORT_VER}.tgz" ;;
          aarch64) URL="https://github.com/microsoft/onnxruntime/releases/download/v${ORT_VER}/onnxruntime-linux-aarch64-${ORT_VER}.tgz" ;;
          *) echo "Unsupported arch $ARCH"; exit 1 ;;
        esac
        curl -fsSL -o ort.tgz "$URL"
        tar -xzf ort.tgz
        cp -v onnxruntime-*/lib/libonnxruntime.so* lib/
        [ -f lib/libonnxruntime.so ] || cp -v lib/libonnxruntime.so.* lib/libonnxruntime.so
```

and similarly for macOS and Windows (`onnxruntime.dll`).

That way the release artifact can contain:

* the binary
* the `lib/` dir with the right ONNX Runtime file

and since the Rust side already looks at `ORT_DYLIB_PATH` and `./lib`, it just works.

## Closing

So the final shape is:

* the Rust app is _dumb_ and only cares about `ORT_DYLIB_PATH` or `./lib`
* Nix, Docker, CI, and release all supply ONNX Runtime in their own way
* I don’t rely on auto-download in anymore, and operate on a specific pinned version of onnxruntime


```

# ./content/about/_index.md

```md
+++
title = "About me"
description = "About Per Stark - psychologist and software developer"
template = "prose.html"
insert_anchor_links = "none"

[extra]
lang = 'en'

title = "About"
subtitle = "Learning out loud, for the fun of it"

math = false
mermaid = false
copy = false
comment = false
reaction = false
+++

## Why I write
Because I enjoy it. I've found that writing offers a time for reflection and enjoyment, looking back at projects, challenges, etc, and hopefully it can on occasion provide enjoyment for someone else too. Cant get better at writing either without getting it done.

## Background

Always a learner, interested in computers since way back when. Software developer and psychologist. Engaged in local politics. 

## Current interests

For the past years I've been diving head first into AI, focusing on LLMs; software development in rust; NixOS and reproducible deployment pipelines; hobbyist physics, philosophy and politics.

## On sharing knowledge
It's fun sharing, and receiving feedback. I believe strongly in sharing ideas and knowledge. Much of what I've learned comes from others who've shared their work openly, so I try to contribute back when I can. 

## Technical setup

 This blog runs on [Zola](https://getzola.org), migrated from [Nuxt Content](https://content.nuxt.com/). The combination of Rust-based static site generation, excellent performance, and overlap with my existing knowledge made it a great choice.

## Contact

Feel free to reach out if something I've written interests you or if you'd like to collaborate on a project. I'm most easily reached via [email](mailto:per@starks.cloud).

```

# ./content/_index.md

```md
+++
template = 'home.html'

[extra]
lang = 'en'

# Show footer in home page

footer = false

# If you don't want to display id/bio/avatar, simply comment out that line

name = "Per Stark"
id = "perstark"
bio = "psychologist & software developer"
# avatar = "img/avatar.webp"
links = [
{ name = "GitHub", icon = "github", url = "https://github.com/perstarkse" },
{ name = "LinkedIn", icon = "linkedin", url = "https://www.linkedin.com/in/per-stark/" },
{ name = "Email", icon = "email", url = "mailto:per@stark.pub" },
]

# Show a few recent posts in home page

recent = true
recent_max = 15
recent_more_text = "more »"
date_format = "%b %-d, %Y"
+++

I enjoy exploring various topics, but often the intersection of behavioral science and technology. Topics range from psychological research with LLMs to NixOS configurations and Rust development—whatever I'm researching, learning or building at the moment.


```

# ./content/projects/_index.md

```md
+++
title = "My projects"
description = "Projects page of Per Stark"
template = "prose.html"

[extra]
title = "Projects"
subtitle = "Some projects of mine"
+++

{{ collection(file="projects.toml") }}

```

