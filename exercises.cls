% Author: A. Hardeman

% ===================================================================================== %

% The commands in here can be \renewcommand'd by the user in their main document.
% This allows for extra customization by the user. The default values are defined here.

% The color in which the amounts of points are printed:
\newcommand\ptscolor{\color{blue}}

% Colors used for tcolorboxes (solution boxes and 'instructions' boxes):
\newcommand\colback{green!7}
\newcommand\coltitle{blue!50!black}
\newcommand\colbacktitle{blue!5}
\newcommand\colborder{blue}

% The title of the 'instructions' box
\newcommand\instructionsboxtitle{Instructions}

% The title of solution boxes
\newcommand\solutionboxtitle{Solution}

% Color of a \QAuthor mention
\newcommand\QAuthorcolor{blue!20!white}

% ===================================================================================== %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exercises}[2024/11/18 Class to typeset a document containing exercises and solutions]

% One can pass the 'answers' option to the class to show answers
\DeclareOption{answers}{\PassOptionsToClass{answers}{exam}}
\ProcessOptions\relax
\LoadClass{exam}

\RequirePackage{parskip}
\RequirePackage{tikz}\usetikzlibrary{decorations.pathmorphing}
\RequirePackage{tcolorbox}\tcbuselibrary{skins,breakable}
\RequirePackage{mlmodern}
\RequirePackage{needspace}
\RequirePackage[T1]{fontenc}
\RequirePackage{geometry}\geometry{a4paper,left=25mm,right=25mm,top=40mm,bottom=30mm}

\newcommand{\red}[1]{\textcolor{red}{#1}}
\newcommand{\blue}[1]{\textcolor{blue}{#1}}
\newcommand{\green}[1]{\textcolor{green!70!black}{#1}}

% To print a question author's name in the bottom-right of the solution box
\newcommand{\QAuthor}[1]{\null\hfill{\footnotesize\color{\QAuthorcolor}#1}}

% Page header
\pagestyle{head}
\runningheader{\headerleft}{\headermiddle}{\headerright}
\runningheadrule
\extraheadheight{-.25in}

% University logo in top-left corner of page (can tweak the offsets)
\RequirePackage{eso-pic}
\newsavebox{\logo}
\savebox{\logo}{\includegraphics[width=4cm]{logo}}
\AddToShipoutPicture{\put(\LenToUnit{0.6cm},\LenToUnit{\paperheight-1.6cm}){\usebox\logo}}


% Nice boxes!
\newtcolorbox{nicebox}[2]{
	% this box is inspired by the example on page 412 of the manual for tcolorbox version 6.4.1
	% https://ctan.org/pkg/tcolorbox?lang=en
	enhanced,
	breakable,
	skin first=enhanced,
	skin middle=enhanced,
	skin last=enhanced,
	tile,
	colback=\colback,coltitle=\coltitle,colbacktitle=\colbacktitle,
	center title,
	toprule=1.25mm,bottomrule=1.25mm,
	extras={
			borderline west={0.2mm}{0mm}{\colborder,decorate,dotted,shorten <=0.5mm,shorten >=0.5mm},
			borderline east={0.2mm}{0mm}{\colborder,decorate,dotted,shorten <=0.5mm,shorten >=0.5mm},
		},
	extras unbroken and first={
			borderline north={0.25mm}{0.5mm}{\colborder,decoration={zigzag,amplitude=0.5mm},decorate}
		},
	extras unbroken and last={
			borderline south={0.25mm}{0.5mm}{\colborder,decoration={zigzag,amplitude=0.5mm},decorate}
		},
	% the following overlay options are adapted from user194703's answer here:
	% https://tex.stackexchange.com/questions/545320/how-to-more-visibly-indicate-that-a-tcolorbox-has-broken
	overlay first={%
			\path[font=\small\itshape] (frame.south) node (cont) {(continued)};
			\draw[\colborder!50,decoration={zigzag,amplitude=0.5mm},decorate]
			(frame.south west) -- (cont.west)
			(frame.south east) -- (cont.east);
		},
	overlay middle={%
			\path[font=\small\itshape] (frame.north) node (cont) {(continued)};
			\draw[\colborder!50,decoration={zigzag,amplitude=0.5mm},decorate]
			(frame.north west) -- (cont.west)
			(frame.north east) -- (cont.east);
			\path[font=\small\itshape] (frame.south) node (cont2) {(continued)};
			\draw[\colborder!50,decoration={zigzag,amplitude=0.5mm},decorate]
			(frame.south west) -- (cont2.west)
			(frame.south east) -- (cont2.east);
		},
	overlay last={%
			\path[font=\small\itshape] (frame.north) node (cont) {(continued)};
			\draw[\colborder!50,decoration={zigzag,amplitude=0.5mm},decorate]
			(frame.north west) -- (cont.west)
			(frame.north east) -- (cont.east);
		},
	title={#1},
	grow to left by={#2},
	parbox=false % to mimic \usepackage{parskip} inside the box
}

% Custom solution boxes
\renewenvironment{TheSolution}{
	% grow solution boxes 6mm to the left, so that they appear to be
	% in the middle of the page (not impacted by question indentation)
	\begin{nicebox}{\solutionboxtitle}{6mm}
		}{
	\end{nicebox}
}

% Instruction box, at the top of the page
\newenvironment{instructions}{
	\begin{center}
		\begin{minipage}{0.93\textwidth}
			\begin{nicebox}{\instructionsboxtitle}{0mm}
				\begin{center}
					}{
				\end{center}
			\end{nicebox}
		\end{minipage}
	\end{center}
	\vspace{8mm}
}

% Question format
\renewcommand\bonuspoint@sing{point, bonus}
\renewcommand\bonuspoint@plur{points, bonus}
\newcommand\ptsfmt{%
	\if@placepoints%
		\ {\ptscolor(total \thepoints)}%
	\fi%
}
\pointformat{\ptscolor(\thepoints)}
\bonuspointformat{\ptscolor(\thepoints)}
\qformat{\textbf{Question \thequestion\ptsfmt. \hfill}}
\bonusqformat{\textbf{Question \thequestion\ptsfmt. \hfill}}

% Todo command
\newcommand{\todo}{The solution is not written out yet.}

% Make sure there's no page break between a question 'title' and the question itself
\let\beginoldquestions\questions
\let\endoldquestions\endquestions
\renewenvironment{questions}{%
	\beginoldquestions%
	\let\oldquestion\question%
	\def\question{\needspace{1cm}\oldquestion}%
}{%
	\endoldquestions%
}
