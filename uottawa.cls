%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%          Written by Nicolas Bigaouette               %%
%%                    Fall 2012                         %%
%%            Inherit from ``article'' class            %%
%%              nbigaouette@gmail.com                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Useful guides/links:
%   More Info
%       Most detailed information of formatting
%       http://web5.uottawa.ca/www3/fespfgps/theses/do-en-2point5num1.htm
%   University of Ottawa Thesis LaTeX Template
%       Wail Gueaieb, Ph.D., P.Eng., SMIEEE, Associate Professor
%       http://miram1.site.uottawa.ca/~wgueaieb/site/index.php?id=9
%       Saved in folder ``template''
%   Thesis Style Files
%       Monica Nevins, Associate Professor
%       http://padic.mathstat.uottawa.ca/~mnevins/thesis/
%   Guide for Doctoral thesis
%       http://www.grad.uottawa.ca/Default.aspx?tabid=1373
%   General Regulations
%       http://www.grad.uottawa.ca/Default.aspx?tabid=1807&msId=21


% http://en.wikibooks.org/wiki/LaTeX/Creating_Packages#Creating_your_own_class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uottawa}[2013/05/05 Nicolas Bigaouette]

% ******************************************************************************
% ******************************************************************************
% http://ctan.mirror.rafal.ca/macros/latex/contrib/oberdiek/kvoptions.pdf
% Package's options
\RequirePackage{kvoptions}
\RequirePackage{kvoptions-patch}
\DeclareStringOption[Thesis' title]{title}      % Thesis' title
\DeclareStringOption[Thesis' author]{author}    % Thesis' author
\DeclareStringOption[Ph.D.]{degree}             % Degree name
\DeclareBoolOption{draft}
\DeclareComplementaryOption{final}{draft}
\DeclareBoolOption{linenumbers}
\DeclareComplementaryOption{nolinenumbers}{linenumbers}
\ProcessKeyvalOptions*
\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ``Inherit'' from the article class
\LoadClass[12pt,letterpaper]{article}

% ******************************************************************************
% ******************************************************************************
%        Start of packages inclusion
% ******************************************************************************

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use UTF-8
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bibliography's style
\bibliographystyle{uottawa}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define the margins
\RequirePackage[left=3.25cm,right=2.5cm,top=2.5cm,bottom=2.5cm]{geometry}

% Line spacing
\linespread{1.3}    % ``One and a half''
%\linespread{1.6}    % ``Double''

% AMS math package
\RequirePackage{amsmath}    % Needed for \begin{subequations}...\end{subequations}

\RequirePackage{ifthen}
\RequirePackage{ifpdf}
\ifpdf
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PDF compilation with "pdflatex"
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \RequirePackage[pdftex]{graphicx}
    \def\pdfshellescape{1}
    \pdfcompresslevel=9
    %%%
    % PDF options
    % See http://barrault.free.fr/ressources/rapports/pdflatex/
    \RequirePackage[pdftex,
        draft=false,
        backref=page,
        bookmarks = true,
        bookmarksnumbered = true,
        bookmarksopen = true,
        pdfpagemode = UseOutlines,
        pdfstartview = FitH,
        colorlinks,
        citecolor=blue,urlcolor=blue,linkcolor=black,
        pdfauthor={\uottawa@author},
        pdftitle={\uottawa@title},
        unicode = true,
        plainpages = false,pdfpagelabels
    ]{hyperref}
    % Figure hyperlink to top of figure, not caption
    \RequirePackage[all]{hypcap}

% http://tex.stackexchange.com/questions/15971/bibliography-with-page-numbers
\renewcommand*{\backref}[1]{}
\renewcommand*{\backrefalt}[4]{%
    \ifcase #1 (Not cited.)%
    \or        (Cited on page~#2.)%
    \else      (Cited on pages~#2.)%
    \fi}

\else
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % DVI compilation with "latex"
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \RequirePackage[dvips]{graphicx}
    \newcommand{\url}[1]{{\color{blue}#1}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Include an appendix and put it in the Table of Content
\RequirePackage[toc,page]{appendix}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Change headers and footers, page number location, etc.
\RequirePackage{fancyhdr}
\renewcommand{\headrule}{}  % Disable the header ruler
\newcommand{\pagenumberstyle}{
\lhead{}
\chead{}
\rhead{}
\lfoot{}
\cfoot{}
\rfoot{\vspace{10pt}\thepage}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Allow to include PDF files directly
% See http://mirror.its.dal.ca/ctan/macros/latex/contrib/pdfpages/pdfpages.pdf
% (Need to be _after_ hyperref)
\ifuottawa@draft
\RequirePackage[draft]{pdfpages}
\else
\RequirePackage{pdfpages}
\includepdfset{pagecommand=\pagenumberstyle}   % Include page number too
% Try to use package ``pax'' if available. This package allows extracting
% the links from the original PDF and include them in the new PDF.
\IfFileExists{pax.sty}{%
    \RequirePackage{pax}%
  }{%
    \GenericWarning{uottawa}{%
      LaTeX Warning: Package pax not available, therefore links from included PDFs
      will not be clickable.\MessageBreak
      Install pax-tds from http://www.ctan.org/tex-archive/macros/latex/contrib/pax/
    }%
  }%
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Different kind of section titles
\RequirePackage{titlesec}

% ******************************************************************************
% ******************************************************************************
%        End of packages inclusion
% ******************************************************************************


% Set title and author from arguments to class
\title{\uottawa@title}
\author{\uottawa@author}

% Disable showing the date
\date{}

\setcounter{secnumdepth}{3} % Depth of section numbering
\setcounter{tocdepth}{4}    % Depth of sections to include in Table of Content

% Define deeper levels of sections
\newcommand{\subsubsubsection}[1]{\paragraph{#1}\mbox{}\\}
\newcommand{\subsubsubsubsection}[1]{\subparagraph{#1}\mbox{}\\}

% Multicolumns inside tables
\newcommand{\mc}[3]{\multicolumn{#1}{#2}{#3}}

% Harmonies the figures' width
\newcommand{\figurewidth}{0.95\columnwidth}


% ******************************************************************************
% Allows using ``lineno'' package with line numbers in paragraph before equations
% See http://www.latex-community.org/viewtopic.php?f=4&t=163
% and http://phaseportrait.blogspot.ca/2007/08/lineno-and-amsmath-compatibility.html
\ifuottawa@linenumbers
\RequirePackage{lineno}
\newcommand*\patchAmsMathEnvironmentForLineno[1]{%
    \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
    \expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
    \renewenvironment{#1}%
        {\linenomath\csname old#1\endcsname}%
        {\csname oldend#1\endcsname\endlinenomath}}%
\newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{%
    \patchAmsMathEnvironmentForLineno{#1}%
    \patchAmsMathEnvironmentForLineno{#1*}}%
\AtBeginDocument{%
\patchBothAmsMathEnvironmentsForLineno{equation}%
\patchBothAmsMathEnvironmentsForLineno{align}%
\patchBothAmsMathEnvironmentsForLineno{flalign}%
\patchBothAmsMathEnvironmentsForLineno{alignat}%
\patchBothAmsMathEnvironmentsForLineno{gather}%
\patchBothAmsMathEnvironmentsForLineno{multline}%
}
\linenumbers
\fi


% ******************************************************************************
% ******************************************************************************
%       Define new commands for the different sections
% ******************************************************************************

% Generic sections
\newcommand{\SectionStyleContent}{
    \titleformat
        {\section}
        [display]
        {\normalfont\bfseries\raggedleft\Huge}
        {\vspace*{3cm}\Huge\thesection\\ \line(1,0){300}}
        {10pt}
        {}
        [\vspace*{3cm}]
}
% ******************************************************************************
\newcommand{\SectionStylePre}{
    \titleformat
        {\section}
        [display]
        {\normalfont\bfseries\centering\Huge}
        {}
        {}
        {}
        [\vspace*{1cm}]
}

% ******************************************************************************
% Title page
\newcommand{\CoverPage}{

    \begin{titlepage}
    \begin{center}

        \vfill
        \begin{LARGE}\textbf{{\uottawa@title}}\end{LARGE}

        \vfill
        \begin{large}{\uottawa@author}\end{large}

        \vfill
        Thesis submitted to the \\
        Faculty of Graduate and Postdoctoral Studies \\
        In partial fulfillment of the requirements \\
        For the \uottawa@degree~degree in Physics \\

        \vfill
        Ottawa-Carleton Institute of Physics \\
        Department of Physics \\
        Faculty of Science \\
        University of Ottawa \\
        Ottawa, Canada

        \vfill
        \textcopyright~\uottawa@author, Ottawa, Canada, \the\year
    \end{center}
    \end{titlepage}

    \pagenumbering{roman}                       % Page numbering style
    \rfoot{\pagenumberstyle}
    \pagestyle{fancy}
    \pagenumberstyle

    \newpage                                    % Add a new page

    \SectionStylePre
}


% ******************************************************************************
% Acknowledgements (small sentence)
\newcommand{\SmallAcknowledgements}[1]{
    %\vspace*{5.4cm}                             % Skip some vertical space
    \begin{flushright}{#1}\end{flushright}      % Text right justified

    \thispagestyle{empty}                       % Disable the page number for this page only
    \newpage                                    % Add a new page
}


% ******************************************************************************
% Generic non-numbered section (pre-content)
% Used for Acknowledgements, Summary, Statement of Originality, etc.
\newcommand{\GenericNonNumberedSection}[2]{
    \phantomsection
    \section*{#1}
    \addcontentsline{toc}{section}{#1}          % What appears on the ToC
    #2
    \newpage
}

% ******************************************************************************
% Table of content page
\newcommand{\tocname}{Table of contents}
\newcommand{\lofname}{List of Figures}
\renewcommand{\contentsname}{\tocname} % Rename the heading
\newcommand{\ToC}{
    \phantomsection
    \addcontentsline{toc}{section}{\tocname}    % What appears on the ToC
    \tableofcontents                            % Add the ToC
    \newpage                                    % Add a new page
    \phantomsection
    \addcontentsline{toc}{section}{\lofname}    % What appears on the ToC
    \listoffigures                              % List of figures
    \newpage                                    % Add a new page
}

% ******************************************************************************
% Content
\newcommand{\StartContent}{
    \pagenumbering{arabic}                      % Reset to arabic page numbering

    \SectionStyleContent
}

% ******************************************************************************
% References (generic)
\newcommand{\ReferencesGeneric}[1]{
    \nocite{*}                                  % Include everything in the #1.bib file
    \bibliography{#1}                           % Read the bibliography file
}

% ******************************************************************************
% References (at end of document)
\newcommand{\ReferencesEnd}[1]{
    \newpage                                    % Start a new page
    \renewcommand\refname{References}           % Set the bibliography's title
    \SectionStylePre
    \phantomsection
    \addcontentsline{toc}{section}{References}  % What appears on the ToC
    \label{references}                          % Add a label for referencing the section
    \ReferencesGeneric{#1}
}

% ******************************************************************************
% References (as a section)
\newcommand{\ReferencesSection}[1]{
    \newpage                                    % Start a new page
    \renewcommand\refname{}                     % Clear the bibliography's title (which appears twice)
    \section{References}                        % Add a subsection instead
    \vspace{-170pt}
    \ReferencesGeneric{#1}
}

% ******************************************************************************
% References (as a subsection)
\newcommand{\ReferencesSubsection}[1]{
    \newpage                                    % Start a new page
    \renewcommand\refname{}                     % Clear the bibliography's title (which appears twice)
    \subsection{References}                     % Add a subsection instead
    \ReferencesGeneric{#1}
}

% ******************************************************************************
% Hide subsection number for an included PDF's abstract
% See: http://tex.stackexchange.com/questions/45150/how-to-remove-zero-preceding-section-number
\newcommand{\HidePDFAbstractNumber}{
    \setcounter{subsection}{-1}
    \makeatletter
    \renewcommand{\thesubsection}{
        \ifnum \c@subsection<1 {}                   % Hide subsection 0
        \else  \thesection.\@arabic\c@subsection    % Show everything else as normal
        \fi
    }
    \makeatother
}

% ******************************************************************************
% Hide 2 subsections number for an included PDF
% See: http://tex.stackexchange.com/questions/45150/how-to-remove-zero-preceding-section-number
\newcommand{\HidePDFTwoNumbers}{
    \setcounter{subsection}{-2}
    \makeatletter
    \renewcommand{\thesubsection}{
        \ifnum \c@subsection<1 {}                   % Hide subsection 0
        \else  \thesection.\@arabic\c@subsection    % Show everything else as normal
        \fi
    }
    \makeatother
}
% ******************************************************************************

