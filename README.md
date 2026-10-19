[![Build, release & push to website](https://github.com/dariotrinchero/cv/actions/workflows/compile_release.yaml/badge.svg)](https://github.com/dariotrinchero/cv/actions/workflows/compile_release.yaml)

# Curriculum Vitae

Design adapted from the [AltaCV LaTeX résumé class](https://github.com/liantze/AltaCV)
(v1.7.1), originally by LianTze Lim.

## Compiled output

The compiled CV is available alongside as a GitHub **release**, as well as on my
[website](https://dariotrinchero.github.io/cv/), or
[LinkedIn profile](https://www.linkedin.com/in/dariotrinchero/).

Below is a preview of the front page:

![compiled cv preview](https://github.com/dariotrinchero/cv/releases/download/latest/cv-1.jpg)

## Academic and industry versions

The CV comes in two versions, both built from `cv.tex`. Compiling `cv.tex` directly gives
the academic version (`cv.pdf`), which is the one published above. Compiling `cv-industry.tex`
gives the industry version (`cv-industry.pdf`), which is built locally only.

Each section lives in its own file under `sections/`, and `cv.tex` lists the order of the
sections for each version. Content that differs between the two versions is wrapped in
`\ifindustry ... \else ... \fi` within the section files.

## Requirements and Compilation

Detailed dependencies can be found on the
[AltaCV GitHub page](https://github.com/liantze/AltaCV). Compilation requires `pdflatex`
and `biber`, and the build process is orchestrated by GNU Make and `latexmk`.
The following Make targets are implemented:

- `all`: default target; build both versions of the CV
- `bg`: background compilation; watch files & recompile academic version on changes
- `bg-industry`: as above, but for the industry version
- `clean`: delete compilation artifacts

The template files (the AltaCV class, bibliography styles and PDF metadata) live in
`template/`, which `.latexmkrc` adds to TeX's search path; so compile via `latexmk` (as
`make` does), not by running `pdflatex` directly.

Note that AltaCV uses [`fontawesome5`](https://ctan.org/pkg/fontawesome5), but this
is included in the latest versions of TeX Live and MikTeX.

Also note that compiling the document will by default update the 'date of last edit'
at the bottom of the document to reflect the current date, so compilation presupposes
at least some proofreading to ensure that the output really is up to date.
