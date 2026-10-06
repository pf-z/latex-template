\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{twocolpaper}[2026/10/06 Personal paper style]

% ============================================================
% Base document class
% 固定使用 article 的 10pt、A4、双栏版式
% ============================================================

\LoadClass[10pt,a4paper,twocolumn]{article}


% ============================================================
% Page layout
% 固定 A4 页面尺寸、版心及页边距
% ============================================================

\RequirePackage[%
    top=26mm,
    headheight=12pt,
    headsep=5.15mm,
    text={160mm,216mm},
    marginparsep=5mm,
    marginparwidth=12mm,
    bindingoffset=6mm,
    footskip=10.13mm
]{geometry}


% ============================================================
% Title font
% 使用与 article 默认 \section 相同的字体风格
% ============================================================

\makeatletter

\renewcommand{\@maketitle}{%
    \newpage
    \begin{center}%
        {\normalfont\Large\bfseries\@title\par}%
        \vskip 1.5em%
        {\large
            \lineskip .5em%
            \begin{tabular}[t]{c}%
                \@author
            \end{tabular}\par}%
        \vskip 1em%
        {\large \@date\par}%
    \end{center}%
    \par
    \vskip 1.5em%
}

\makeatother


% ============================================================
% Cross-column abstract
% 保持 \begin{abstract}...\end{abstract} 用法不变，自动横跨双栏
% ============================================================

\RequirePackage{cuted}

\setlength{\stripsep}{-5pt}

\renewenvironment{abstract}
{%
    \begin{strip}
    \vspace*{0\baselineskip}% ← 摘要距标题块
    \small
    {\centering\bfseries Abstract \par}
    \vspace{10pt}
    \noindent\ignorespaces
}
{%
    \par
    \vspace{40pt}% ← 摘要距正文
    \end{strip}
}

\endinput