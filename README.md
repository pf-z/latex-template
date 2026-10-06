# LaTeX Templates

[![LaTeX](https://img.shields.io/badge/LaTeX-Template-008080?logo=latex&logoColor=white)](https://www.latex-project.org/)
[![pdfLaTeX](https://img.shields.io/badge/pdfLaTeX-Compiler-3D6117)](https://www.tug.org/texlive/)
[![License](https://img.shields.io/github/license/pf-z/latex-template)](https://github.com/pf-z/latex-template/blob/main/LICENSE)

Personal LaTeX document classes and templates for academic writing.

## Templates

| Class | Description |
|---|---|
| [`twocolpaper`](class/twocolpaper.cls) | A4 two-column academic paper template based on `article` |
| [`journalpaper`](class/journalpaper.cls) | A4 single-column academic paper template based on `extarticle` |

## Structure

```text
latex-template/
├── class/
│   ├── twocolpaper.cls
│   └── journalpaper.cls
├── example/
│   ├── twocolpaper-example.tex
│   ├── journalpaper-example.tex
│   └── references.bib
├── README.md
├── LICENSE
└── ...
```

## Usage

Copy the desired `.cls` file into your LaTeX project and use it with
the standard `\documentclass` command:

```latex
\documentclass{twocolpaper}
```

or

```latex
\documentclass[11pt]{journalpaper}
```

See the [`example/`](example/) directory for complete examples.

## Requirements

- LaTeX
- pdfLaTeX
- BibTeX

The templates use standard LaTeX packages for mathematics, figures,
tables, citations, hyperlinks, and cross-references.

## License

MIT License. See [LICENSE](LICENSE).