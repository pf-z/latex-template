\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{journalpaper}[2026/01/26 My custom article class]

% ============================================================
% 1. 基础类加载
% ============================================================

% 基于 extarticle，保持 article 的正常使用方式
\LoadClassWithOptions{extarticle}


% ============================================================
% 2. 常用宏包
% ============================================================

% 数学公式与符号
\RequirePackage{amsmath, amssymb}

% 图片
\RequirePackage{graphicx}

% 表格
\RequirePackage{booktabs}

% 参考文献
\RequirePackage{natbib}


% ============================================================
% 3. 页面几何
% ============================================================

% A4 纸张，四边均为 2.5 cm
\RequirePackage[a4paper,
    top=2.5cm,
    bottom=2.5cm,
    left=2.5cm,
    right=2.5cm
]{geometry}


% ============================================================
% 4. 章节标题
% ============================================================

\RequirePackage{titlesec}

% ---- 4.1 编号样式 ----

% 一级标题：1.
\renewcommand\thesection{\arabic{section}.}

% 二级标题：1.1.
\renewcommand\thesubsection{\arabic{section}.\arabic{subsection}.}

% 三级标题：1.1.1.
\renewcommand\thesubsubsection{%
    \arabic{section}.\arabic{subsection}.\arabic{subsubsection}.}

% ---- 4.2 标题格式 ----

% 一级标题：大号、粗体
\titleformat{\section}
    {\normalfont\large\bfseries}{\thesection}{0.6em}{}

% 二级标题：正常字号、粗体
\titleformat{\subsection}
    {\normalfont\normalsize\bfseries}{\thesubsection}{0.6em}{}

% 三级标题：正常字号、斜体
\titleformat{\subsubsection}
    {\normalfont\normalsize\itshape}{\thesubsubsection}{0.5em}{}


% ============================================================
% 5. 图表标题格式
% ============================================================

\RequirePackage[justification=raggedright,singlelinecheck=false]{caption}

% 图片标题：Fig. 1.
\captionsetup[figure]{name=Figure, labelsep=period}

% 表格标题：Table 1.
\captionsetup[table]{labelsep=period}


% ============================================================
% 6. 颜色与引用
% ============================================================

\RequirePackage{xcolor}

% ---- 6.1 颜色定义 ----

% 文献引用颜色
\definecolor{citecol}{RGB}{0,0,255}

% URL 颜色
\definecolor{urlcol}{RGB}{0,0,255}

% 图表引用颜色
\definecolor{linkcol}{RGB}{0,0,255}

% 公式编号颜色
\definecolor{eqcol}{RGB}{0,0,255}


% ---- 6.2 hyperref ----

\RequirePackage{hyperref}

% 设置超链接颜色
\hypersetup{
    colorlinks=true,
    linkcolor=linkcol,
    citecolor=citecol,
    urlcolor=urlcol
}


% ---- 6.3 cleveref ----

\RequirePackage{cleveref}

% ==================== Figure ====================

% 图的名称与单复数形式
\crefname{figure}{Figure}{Figures}

% 单个图
\crefformat{figure}{\textcolor{linkcol}{#2Figure~#1#3}}
\Crefformat{figure}{\textcolor{linkcol}{#2Figure~#1#3}}

% 连续区间
\crefrangeformat{figure}{%
    \textcolor{linkcol}{#3Figures~#1#4}--%
    \textcolor{linkcol}{#5#2#6}%
}
\Crefrangeformat{figure}{%
    \textcolor{linkcol}{#3Figures~#1#4}--%
    \textcolor{linkcol}{#5#2#6}%
}

% 多个离散图
\crefmultiformat{figure}
    {\textcolor{linkcol}{#2Figures~#1#3}}
    { and \textcolor{linkcol}{#2#1#3}}
    {, \textcolor{linkcol}{#2#1#3}}
    {, and \textcolor{linkcol}{#2#1#3}}


% ==================== Table ====================

% 表的名称与单复数形式
\crefname{table}{Table}{Tables}

% 单个表格
\crefformat{table}{\textcolor{linkcol}{#2Table~#1#3}}
\Crefformat{table}{\textcolor{linkcol}{#2Table~#1#3}}

% 多个表格
\crefmultiformat{table}
    {\textcolor{linkcol}{#2Tables~#1#3}}
    { and \textcolor{linkcol}{#2#1#3}}
    {, \textcolor{linkcol}{#2#1#3}}
    {, and \textcolor{linkcol}{#2#1#3}}

% 连续区间
\crefrangeformat{table}{%
    \textcolor{linkcol}{#3Tables~#1#4}--%
    \textcolor{linkcol}{#5#2#6}%
}
\Crefrangeformat{table}{%
    \textcolor{linkcol}{#3Tables~#1#4}--%
    \textcolor{linkcol}{#5#2#6}%
}


% ==================== Equation ====================

% 公式名称与单复数形式
\crefname{equation}{Eq.}{Eqs.}

% 单个公式
\crefformat{equation}{Eq.~#2\textcolor{eqcol}{(#1)}#3}
\Crefformat{equation}{Eq.~#2\textcolor{eqcol}{(#1)}#3}

% 多个公式
\crefmultiformat{equation}
    {Eqs.~#2\textcolor{eqcol}{(#1)}#3}
    { and #2\textcolor{eqcol}{(#1)}#3}
    {, #2\textcolor{eqcol}{(#1)}#3}
    {, and #2\textcolor{eqcol}{(#1)}#3}

% 连续区间
\crefrangeformat{equation}{%
    Eqs.~#3\textcolor{eqcol}{(#1)}#4--%
    #5\textcolor{eqcol}{(#2)}#6%
}
\Crefrangeformat{equation}{%
    Eqs.~#3\textcolor{eqcol}{(#1)}#4--%
    #5\textcolor{eqcol}{(#2)}#6%
}


% ============================================================
% 7. 标题块
% ============================================================

\makeatletter

% 自定义标题、作者和日期的排版
\renewcommand{\maketitle}{%
    \begin{center}

        % 标题
        {\LARGE\bfseries \@title \par}

        % 作者部分
        \ifx\@author\@empty
            % 没有作者 → 不加下面的空白
        \else
            \vspace{2em}
            \@author
        \fi

        % 日期部分
        \ifx\@date\@empty
            % 没有日期 → 不显示
        \else
            \vspace{2.8em}
            {\normalsize \@date\par}
        \fi

    \end{center}

    % 标题块与正文之间的间距
    \vspace{0.4em}
}

\makeatother


% ============================================================
% 8. 摘要与关键词
% ============================================================

% ---- 8.1 摘要 ----

% 自定义摘要环境
\renewenvironment{abstract}{
    \vspace{1.3em}
    \noindent\textbf{Abstract}\par
    \vspace{0.8em}
    \noindent\ignorespaces
}{
    \par
    \vspace{1.3em} % 摘要下方统一留出 1.3em 间距
}


% ---- 8.2 关键词 ----

% 自定义关键词环境
\newenvironment{keywords}{
    \vspace{-0.5em} % 抵消部分上留白，使得摘要与关键词之间保持 0.8em 的合适间距 (1.3em - 0.5em = 0.8em)
    \noindent\textbf{Keywords: }
    \ignorespaces
}{
    \par
    \vspace{1.3em}
}


% ============================================================
% 9. 断行容忍度
% ============================================================

% 增加断行容忍度，减少正文中的 overfull hbox
\emergencystretch=3em