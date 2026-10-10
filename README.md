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


## Packages

| Package | Description |
|---|---|
| [`titlefoot`](style/titlefoot.sty) | Beamer footline that switches automatically between body pages and title/TOC pages |

## Structure

```text
latex-template/
├── class/
│   ├── twocolpaper.cls
│   └── journalpaper.cls
├── style/
│   └── titlefoot.sty
├── example/
│   ├── twocolpaper.tex
│   ├── journalpaper.tex
│   ├── titlefoot.tex
│   └── references.bib
├── README.md
├── LICENSE
└── ...
```

## Usage

### Document classes

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

### `titlefoot` (Beamer footline)

Provides a three-column footline for **body pages** and a single
centered footline for **title / TOC / closing pages**:

| Page type | Footline content |
|---|---|
| Body page | `\insertshortauthor` \| `\insertsection` \| `\insertframenumber/\inserttotalframenumber` |
| Title / TOC / closing page | `\insertshorttitle` only |

**Load after the theme**, otherwise the theme overwrites `footline`:

```latex
\usetheme{Boadilla}
\usepackage{../style/titlefoot}
```

**Switch inside the frame** — do not hook `\titlepage` / `\tableofcontents`,
as the footline is drawn at frame end and would be reset:

```latex
\begin{frame}
  \thispagestyle{navigation@titlepage}
  \titlepage
\end{frame}

\begin{frame}
  \thispagestyle{navigation@titlepage}
  \frametitle{Contents}
  \tableofcontents
\end{frame}
```

The same command works for a closing page. Do **not** use `[plain]` on
these frames — it hides the footline.

See [`example/titlefoot.tex`](example/titlefoot.tex)
for a complete example.

## Requirements

- LaTeX
- pdfLaTeX (for `twocolpaper` / `journalpaper`)
- XeLaTeX or LuaLaTeX (for `titlefoot`, which relies on system fonts
  when used with `xeCJK` / `fontspec`)
- BibTeX

The templates use standard LaTeX packages for mathematics, figures,
tables, citations, hyperlinks, and cross-references.

## License

MIT License. See [LICENSE](LICENSE).