# Curriculum Vitae

Design adapted from the [AltaCV LaTeX résumé class](https://github.com/liantze/AltaCV)
(v1.7.1), originally by LianTze Lim.

## Compiled output

<!--- 
Include image preview of compiled CV here using:
![compiled cv preview](https://dariotrinchero.github.io/files/cv_preview.jpg)
--->

The compiled CV is available on my [website](https://dariotrinchero.github.io/cv/), or
my [LinkedIn profile](https://www.linkedin.com/in/dariotrinchero/).

## Requirements and Compilation

Detailed dependencies can be found on the
[AltaCV GitHub page](https://github.com/liantze/AltaCV). Compilation requires `pdflatex`
and `biber`, and the build process is orchestrated by GNU Make and `latexmk`.
The following Make targets are implemented:

- `all`: default target; build CV
- `bg`: background compilation; watch files & recompile on changes
- `clean`: delete compilation artifacts

Note that AltaCV uses [`fontawesome5`](https://ctan.org/pkg/fontawesome5), but this
is included in the latest versions of TeX Live and MikTeX.

Also note that compiling the document will by default update the 'date of last edit'
at the bottom of the document to reflect the current date, so compilation presupposes
at least some proofreading to ensure that the output really is up to date.
