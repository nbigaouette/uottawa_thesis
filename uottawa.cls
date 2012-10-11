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


\ProvidesClass{uottawa}[2012/10/10 Nicolas Bigaouette]


% ************************************************************************************
% ************************************************************************************
%   Options to pass to the class
% ************************************************************************************

% \RequirePackage{kvoptions-patch}
\RequirePackage{kvoptions}

% % Enable the ``draft'' option to uottawa's class
% \newcommand{\extraoptions}{}
% \DeclareOption{draft}{\renewcommand{\extraoptions}{,draft}}
% \DeclareStringOption{draft}{\renewcommand{\extraoptions}{,draft}}
% \DeclareBoolOption{draft}
\DeclareBoolOption{draft}
\DeclareComplementaryOption{final}{draft}

\DeclareStringOption{title}
\DeclareStringOption{author}

\ProcessKeyvalOptions*
% ************************************************************************************
% ************************************************************************************

% Load the ``article'' class with the right options
% \LoadClass[12pt,letterpaper\extraoptions]{article}
\LoadClass[12pt,letterpaper]{article}


% Define the margins
\usepackage[left=3.25cm,right=2.5cm,top=2.5cm,bottom=2.5cm]{geometry}

% Line spacing
\linespread{1.3}    % ``One and a half''
%\linespread{1.6}    % ``Double''

\usepackage{ifthen}
\usepackage{ifpdf}
\ifpdf
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PDF compilation with "pdflatex"
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \usepackage[pdftex]{graphicx}
    \def\pdfshellescape{1}
    \pdfcompresslevel=9
    %%%
    % PDF options
    % See http://barrault.free.fr/ressources/rapports/pdflatex/
    \usepackage[pdftex,
        bookmarks = true,
        bookmarksnumbered = true,
        bookmarksopen = true,
        pdfpagemode = UseOutlines,
        pdfstartview = FitH,
        colorlinks,
        citecolor=black,urlcolor=blue,linkcolor=black,
        pdfauthor={\uottawa@author},
        pdftitle={\uottawa@title},
        unicode = true,
        plainpages = false,pdfpagelabels
    ]{hyperref}
\else
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % DVI compilation with "latex"
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \usepackage[dvips]{graphicx}
    \newcommand{\url}[1]{{\color{blue}#1}}
\fi


%%%%
% Voir http://forums.gentoo.org/viewtopic-t-202973-highlight-fonts+latex.html
% \usepackage{mathptmx}
% \usepackage[scaled=.90]{helvet}
% \usepackage{courier}
%%%%

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %                       Page format
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \textheight=21cm
% \textwidth=17.0cm
% \oddsidemargin=0cm
% \evensidemargin=0cm
% \topmargin=0cm
% \headsep=20pt
% \topskip=10pt
% \large
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% % These adjust how LaTeX puts figures onto pages with text. These values
% % reduce the likelihood that a figure will end up by itself on a page.
% \renewcommand{\topfraction}{0.85}
% \renewcommand{\textfraction}{0.1}
% \renewcommand{\floatpagefraction}{0.75}


% \renewcommand{\labelenumi}{\alph{enumi}) }

% Set title and author from arguments to class
\title{\uottawa@title}
\author{\uottawa@author}

% Disable showing the date
\date{}


% ************************************************************************************
% Title page
\newcommand{\CoverPage}{

    \begin{titlepage}
    \begin{center}

        \vspace*{1.85cm}
        \begin{LARGE}\textbf{{\uottawa@title}}\end{LARGE}

        \vspace*{2.1cm}
        \begin{large}{\uottawa@author}\end{large}

        \vspace*{2.55cm}
        Thesis submitted to the \\
        Faculty of Graduate and Postdoctoral Studies \\
        In partial fulfillment of the requirements \\
        For the Ph.D. degree in Physics \\

        \vspace*{3.45cm}
        Department of Physics \\
        Faculty of Science \\
        University of Ottawa \\

        \vspace*{5.42cm}
        \textcopyright~\uottawa@author, Ottawa, Canada, \the\year
    \end{center}
    \end{titlepage}

    \pagenumbering{roman}                       % Page numbering style
    \newpage                                    % Add a new page
    \setcounter{page}{2}                        % Reset counter to 1
}


% ************************************************************************************
% Acknowledgements (small sentence)
\newcommand{\SmallAcknowledgements}[1]{

    \vspace*{5.4cm}                             % Skip some vertical space
    \begin{flushright}                          % Text right justified
        #1
    \end{flushright}

    \thispagestyle{empty}                       % Disable the page number for this page only
    \newpage                                    % Add a new page
}


% ************************************************************************************
% Generic non-numbered section (pre-content)
\newcommand{\GenericNonNumberedSection}[2]{
    \section*{#1}
    \addcontentsline{toc}{section}{#1}    % What appears on the ToC
    #2
    \newpage
}

% ************************************************************************************
% Acknowledgements
\newcommand{\Acknowledgements}[1]{
    \GenericNonNumberedSection{Acknowledgements}{#1}
}

% ************************************************************************************
% Table of content page
\newcommand{\tocname}{Table of contents}
\renewcommand{\contentsname}{\tocname} % Rename the heading
\newcommand{\ToC}{
    \addcontentsline{toc}{section}{\tocname}    % What appears on the ToC
    \tableofcontents                            % Add the ToC
    \newpage                                    % Add a new page
}

% ************************************************************************************
% Content
\newcommand{\StartContent}{
    \pagenumbering{arabic}                      % Reset to arabic page numbering
%     \setcounter{page}{1}                        % Reset counter to 1
}

% ************************************************************************************
% References
\newcommand{\References}[1]{
    \newpage                                    % Start a new page
    \addcontentsline{toc}{section}{References}  % What appears on the ToC
    \label{references}                          % Add a label for referencing the section
    \nocite{*}                                  % Include everything in the #1.bib file
    \bibliographystyle{plain}                   % Bibliography's style
    \bibliography{#1}                           % Read the bibliography file
}
