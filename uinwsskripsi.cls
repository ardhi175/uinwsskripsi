\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uinwsskripsi}[2021/02/14 v2.0 class skripsi FST UIN Walisongo Semarang]

%-----------------------------------------
% created by MMF Vlogs 
% YT   : https://youtube.com/c/MMFVlogs
% Blog : https://mmfvlogs.blogspot.com
%-----------------------------------------

\RequirePackage[english,bahasa]{babel}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\RequirePackage{graphicx,latexsym}


\usepackage{caladea}
\usepackage{amsmath,amssymb,latexsym,graphicx}
\usepackage{tabularx}

%\usepackage[colorlinks=true,linkcolor=blue]{hyperref}

\newif\if@singlesp
\newif\if@doublesp
\newif\if@onehalfsp
\DeclareOption{satuspasi}{\@singlesptrue\@doublespfalse\@onehalfspfalse}
\DeclareOption{duaspasi}{\@singlespfalse\@doublesptrue\@onehalfspfalse}
\DeclareOption{satusetengahspasi}{\@singlespfalse\@onehalfsptrue\@doublespfalse}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{skripsi,satusetengahspasi,indonesia}
\ProcessOptions
\LoadClass[a5paper,11pt,openright]{report}

%-----------------------------------------------------
% Setting bibliografi
%-----------------------------------------------------
\RequirePackage{natbib}
%\bibliographystyle{plainnat}
\usepackage{url}
%\newcommand{\bibTitle}[1]{''#1''}

\renewcommand\@biblabel[1]{#1} % No brackets for the references
\renewenvironment{thebibliography}[1]
      {\chapter*{\refname}%
       \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
       \list{\@biblabel{\@arabic\c@enumiv}}%
            {\settowidth\labelwidth{\@biblabel{#1}}%
             \leftmargin\labelwidth
             \advance\leftmargin20pt% change 20 pt according to your needs
             \advance\leftmargin\labelsep
             \setlength\itemindent{-20pt}% change using the inverse of the length used before
             \@openbib@code
             \usecounter{enumiv}%
             \let\p@enumiv\@empty
             \renewcommand\theenumiv{\@arabic\c@enumiv}}%
       \sloppy
       \clubpenalty4000
       \@clubpenalty \clubpenalty
       \widowpenalty4000%
       \sfcode`\.\@m}
      {\def\@noitemerr
        {\@latex@warning{Empty `thebibliography' environment}}%
       \endlist}
\renewcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
%-----------------------------------------------------

\RequirePackage{nomencl}%
\renewcommand{\nomname}{\nomenclaturename}%
\makeglossary%

\RequirePackage[tableposition=above,format=hang,labelsep=period]{caption}

\usepackage{geometry}
 \geometry{
 a5paper,
 total={108mm,170mm},
 left=20mm,
 top=20mm,
 twoside, 
 bindingoffset=5mm
% showframe
 }

%------------------------------------------------------------
%The form of page numbering
%------------------------------------------------------------
\pagestyle{myheadings}
\markright{}

%------------------------------------------------------------
%Define page numbering in the first chapter
%------------------------------------------------------------
\def\ps@chapterheading{%
  \let\@evenhead\@empty\let\@oddhead\@empty
  \def\@oddfoot{{\slshape\rightmark}\hfil\thepage\hfil}% ditambahi \hfil setelah \thepage biar simetris
  \def\@evenfoot{\hfil\thepage\hfil\slshape\leftmark}% ditambahi \hfil sebelum \thepage biar simetris
  }

%------------------------------------------------------------
%Redefine chapter and sections
%------------------------------------------------------------
\setcounter{secnumdepth}{3}
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@Roman\c@chapter}
\renewcommand \thesection {\@Alph\c@section.}
\renewcommand\thesubsection   {\@arabic\c@subsection.}
\renewcommand\thesubsubsection{\@alph\c@subsubsection.}\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@arabic\c@chapter}}
\renewcommand{\chapter}{\cleardoublepage\thispagestyle{chapterheading}%
  \global\@topnum\z@ %Prevents figures from going at top of page
  \@afterindenttrue %Indent the 1st paragraph
  \secdef\@chapter\@schapter}
\renewcommand{\@makechapterhead}[1]{%
  {\parindent \z@ \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \large\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 5\p@
    \fi
    \interlinepenalty\@M
    \large \bfseries #1\par\nobreak
    \vskip 20\p@
    }}
\renewcommand{\@makeschapterhead}[1]{%
  {\parindent \z@ \centering \normalfont
    \interlinepenalty\@M \large \bfseries #1\par\nobreak \vskip 20\p@ }}
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\normalsize\bfseries}}%\centering
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\parindent}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand{\paragraph}{\subparagraph}

%------------------------------------------------------------
%Mengganti istilah
%------------------------------------------------------------
\def\captionsbahasa{%
\def\prefacename{KATA PENGANTAR}%
\def\contentsname{DAFTAR ISI}%
\def\listfigurename{DAFTAR GAMBAR}%
\def\listtablename{DAFTAR TABEL}%
\def\listappendixname{DAFTAR LAMPIRAN}%
\def\nomenclaturename{DAFTAR LAMBANG DAN SINGKATAN}%
\def\abstractname{ABSTRAK}%
\def\partname{BAGIAN}%
\def\chaptername{BAB}%
\def\appendixname{Lampiran}%
\def\refname{DAFTAR PUSTAKA}%
%\def\bibname{DAFTAR PUSTAKA}%
\def\indexname{Indek}%
\def\figurename{Gambar}%
\def\tablename{Tabel}%
\def\pagename{Halaman}%
}

%English
\def\captionsenglish{%
\def\prefacename{PREFACE}%
\def\contentsname{CONTENTS}%
\def\listfigurename{LIST OF FIGURES}%
\def\listtablename{LIST OF TABLES}%
\def\listappendixname{LIST OF APPENDICES}%
\def\nomenclaturename{NOMENCLATURE}%
\def\abstractname{ABSTRACT}%
\def\partname{PART}%
\def\chaptername{CHAPTER}%
\def\appendixname{APPENDIX}%
\def\refname{REFERENCES}%
\def\bibname{REFERENCES}%
\def\indexname{Index}%
\def\figurename{Figure}%
\def\tablename{Table}%
\def\pagename{Page}%
}

%---------------------------------
%Mengatur dengan tocloft
%---------------------------------

\usepackage{tocloft}

\newcommand{\listappendicesname}{DAFTAR LAMPIRAN}
\newlistof[lampiran]{appendices}{apc}{\listappendicesname}
\newcommand{\appendices}[1]{%
\refstepcounter{appendices}
\cleardoublepage\newpage\par\noindent\textbf{Lampiran \theappendices. #1}\vspace{1cm} 
\addcontentsline{apc}{appendices}{\protect\numberline{\theappendices}#1}\par}

\renewcommand{\cfttoctitlefont}{\hfil \bfseries\large}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftbeforetoctitleskip}{-0.25in} 

\renewcommand{\cftloftitlefont}{\hfil \bfseries\large}
\renewcommand{\cftafterloftitle}{\hfil}
\renewcommand{\cftbeforeloftitleskip}{-0.25in} 

\renewcommand{\cftlottitlefont}{\hfil \bfseries\large}
\renewcommand{\cftafterlottitle}{\hfil}
\renewcommand{\cftbeforelottitleskip}{-0.25in} 

\renewcommand{\cftapctitlefont}{\hfil \bfseries\large}
\renewcommand{\cftafterapctitle}{\hfil}
\renewcommand{\cftbeforeapctitleskip}{-0.25in} 

\renewcommand{\cftchapdotsep}{2}
\renewcommand{\cftsecdotsep}{2}
\setlength{\cftchapnumwidth}{3.5em}
\setlength{\cftbeforechapskip}{1pt}
\setlength{\cftsecindent}{0pt}
\renewcommand{\cftchappresnum}{BAB }

\renewcommand{\cftfigpresnum}{Gambar\; }
\renewcommand{\cftfigaftersnum}{\quad\quad\quad}
\renewcommand{\cftfigaftersnumb}{}
\renewcommand{\cftfigdotsep}{\cftnodots}
\setlength{\cftfignumwidth}{6.5em}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}

\renewcommand{\cftafterloftitle}{%
\\[1cm] \phantom{aaaa}{\normalfont\bfseries Gambar}\hfill{\normalfont\bfseries Judul} \hfill{\normalfont\bfseries Halaman}}
\setlength{\cftafterloftitleskip}{0.5cm}

\renewcommand{\cftafterlottitle}{%
\\[1cm] \phantom{aaaa}{\normalfont\bfseries Tabel}\hfill{\normalfont\bfseries Judul} \hfill{\normalfont\bfseries Halaman}}
\setlength{\cftafterlottitleskip}{0.5cm}

\renewcommand{\cfttabpresnum}{Tabel\; }
\renewcommand{\cfttabaftersnum}{\quad\quad\quad}
\renewcommand{\cfttabaftersnumb}{}
\renewcommand{\cfttabdotsep}{\cftnodots}
\setlength{\cfttabnumwidth}{6.5em}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}

\renewcommand{\cftafterapctitle}{%
\\[1cm]\mbox{}\hfill{\normalfont\bfseries Halaman}}
\setlength{\cftafterapctitleskip}{0.5cm}

\renewcommand{\cftappendicespresnum}{Lampiran\; }
\renewcommand{\cftappendicesaftersnum}{\quad\quad\quad}
\renewcommand{\cftappendicesaftersnumb}{}
\renewcommand{\cftappendicesdotsep}{\cftnodots}
\setlength{\cftappendicesnumwidth}{6.5em}
\renewcommand{\theappendices}{\arabic{appendices}}

%------------------------------------------------------------]
%Mendefinisikan parameter masukan
%------------------------------------------------------------
\gdef\@universityind{Universitas Islam Negeri Walisongo}
%\gdef\@programind{}
\gdef\@universityeng{Universitas Islam Negeri Walisongo}
%\gdef\@programeng{}
\gdef\@city{Semarang}
\gdef\@university{Universitas Islam Negeri Walisongo}
\gdef\@faculty{Fakultas Sains dan Teknologi }
\newcommand{\headdept}[1]{\gdef\@headdept{#1}}
\newcommand{\@headdept}{}
\newcommand{\titleind}[1]{\gdef\@titleind{#1}}
\newcommand{\@titleind}{}                        
\newcommand{\titleinddua}[1]{\gdef\@titleinddua{#1}}    %--------------------
\newcommand{\@titleinddua}{}                            %--------------------
\newcommand{\titleindtiga}[1]{\gdef\@titleindtiga{#1}}  %--------------------
\newcommand{\@titleindtiga}{}                           %--------------------
\newcommand{\titleeng}[1]{\gdef\@titleeng{#1}}
\newcommand{\@titleeng}{}
\newcommand{\titleengdua}[1]{\gdef\@titleengdua{#1}}     %xxxxxxxxxxxxxxxxxxxxxxx
\newcommand{\@titleengdua}{}                             %xxxxxxxxxxxxxxxxxxxxxxx
\newcommand{\titleengtiga}[1]{\gdef\@titleengtiga{#1}}   %xxxxxxxxxxxxxxxxxxxxxxx
\newcommand{\@titleengtiga}{}                            %xxxxxxxxxxxxxxxxxxxxxxx
\newcommand{\fullname}[1]{\gdef\@fullname{#1}}
\newcommand{\@fullname}{}
\newcommand{\idnum}[1]{\gdef\@idnum{#1}}
\newcommand{\@idnum}{}
\newcommand{\deptind}[1]{\gdef\@deptind{#1}}
\newcommand{\@deptind}{}
\newcommand{\depteng}[1]{\gdef\@depteng{#1}}
\newcommand{\@depteng}{}
\newcommand{\tanggalpengesahan}[1]{\gdef\@tanggalpengesahan{#1}}
\newcommand{\@tanggalpengesahan}{\number\day~\ifcase\month\or
    Januari\or Pebruari\or Maret\or April\or Mei\or Juni\or
    Juli\or Agustus\or September\or Oktober\or Nopember\or Desember\fi
    \space \number\year}
\newcommand{\pembimbingpertama}[1]{\gdef\@pembimbingpertama{#1}}
\newcommand{\@pembimbingpertama}{}
\newcommand{\nippembimbingpertama}[1]{\gdef\@nippembimbingpertama{#1}}
\newcommand{\@nippembimbingpertama}{}
\newcommand{\pembimbingkedua}[1]{\gdef\@pembimbingkedua{#1}}
\newcommand{\@pembimbingkedua}{}
\newcommand{\nippembimbingkedua}[1]{\gdef\@nippembimbingkedua{#1}}
\newcommand{\@nippembimbingkedua}{}
\newcommand{\degreeind}[1]{\gdef\@degreeind{#1}}
\newcommand{\@degreeind}{Sarjana S-1}
\newcommand{\degreeeng}[1]{\gdef\@degreeeng{#1}}
%\newcommand{\@degreeeng}{}
\newcommand{\submitdate}[1]{\gdef\@submitdate{#1}}
\newcommand{\@submitdate}{}
\newcommand{\pengujipertama}[1]{\gdef\@pengujipertama{#1}}%
\newcommand{\@pengujipertama}{}
\newcommand{\nippengujipertama}[1]{\gdef\@nippengujipertama{#1}}%
\newcommand{\@nippengujipertama}{}
\newcommand{\pengujikedua}[1]{\gdef\@pengujikedua{#1}}%
\newcommand{\@pengujikedua}{}
\newcommand{\nippengujikedua}[1]{\gdef\@nippengujikedua{#1}}%
\newcommand{\@nippengujikedua}{}
\newcommand{\thirdexaminer}[1]{\gdef\@thirdexaminer{#1}}%
\newcommand{\@thirdexaminer}{}
\newcommand{\tahunterbitskripsi}[1]{\gdef\@tahunterbitskripsi{#1}}
\newcommand{\@tahunterbitskripsi}{}
\newcommand{\tanggalnotabimbingsatu}[1]{\gdef\@tanggalnotabimbingsatu{#1}}
\newcommand{\@tanggalnotabimbingsatu}{}
\newcommand{\tanggalnotabimbingdua}[1]{\gdef\@tanggalnotabimbingdua{#1}}
\newcommand{\@tanggalnotabimbingdua}{}
\newcommand{\tanggalpernyataankeaslian}[1]{\gdef\@tanggalpernyataankeaslian{#1}}
\newcommand{\@tanggalpernyataankeaslian}{}
\newcommand{\jurusan}[1]{\gdef\@jurusan{#1}}
\newcommand{\@jurusan}{}
\newcommand{\prodi}[1]{\gdef\@prodi{#1}}
\newcommand{\@prodi}{}
\newcommand{\pengujiketiga}[1]{\gdef\@pengujiketiga{#1}}
\newcommand{\@pengujiketiga}{}
\newcommand{\nippengujiketiga}[1]{\gdef\@nippengujiketiga{#1}}
\newcommand{\@nippengujiketiga}{}
\newcommand{\pengujikeempat}[1]{\gdef\@pengujikeempat{#1}}
\newcommand{\@pengujikeempat}{}
\newcommand{\nippengujikeempat}[1]{\gdef\@nippengujikeempat{#1}}
\newcommand{\@nippengujikeempat}{}
\newcommand{\katakunci}[1]{\gdef\@katakunci{#1}}
\newcommand{\@katakunci}{}
\newcommand{\gelarsarjana}[1]{\gdef\@gelarsarjana{#1}}
\newcommand{\@gelarsarjana}{}
\newcommand{\filepustaka}[1]{\gdef\@filepustaka{#1}}
\newcommand{\@filepustaka}{}
\newcommand{\fileabstrak}[1]{\gdef\@fileabstrak{#1}}
\newcommand{\@fileabstrak}{}
\newcommand{\filekatapengantar}[1]{\gdef\@filekatapengantar{#1}}
\newcommand{\@filekatapengantar}{}

%------------------------------------------------------------
%Halaman Sampul Berbahasa Indonesia
%------------------------------------------------------------
\def\coverbaru{%
  \thispagestyle{empty}%
  \pagenumbering{roman}
  \setcounter{page}{1}
    \begin{center}
      \begin{singlespace}
      \parbox{\linewidth}              
      {\begin{center}
       		\MakeUppercase{\large\normalfont\bfseries\@titleind}\\    
       		\end{center}
      }\par\nobreak %\MakeUppercase
      \vspace{0.3cm}      
      \MakeUppercase{\normalfont Skripsi}\\
      \vspace{0.3cm}
      \parbox{\linewidth}
      {\begin{center}
      	Diajukan untuk Memenuhi Sebagian Syarat Guna Memperoleh\\
      	Gelar Sarjana \@gelarsarjana\\
      	dalam Ilmu \@prodi 
      \end{center}}\par\nobreak %\MakeUppercase
      \vfill
       \includegraphics[height=3.45cm,width=2.5cm]{Logo_uin_walisongo.png}
       \vfill
       {\normalfont
        Oleh : \MakeUppercase{\bfseries\@fullname}\\
        NIM : \@idnum}\\
       \vspace{0.5cm}
       {\normalfont 
         
         \MakeUppercase{\normalfont\@faculty}\\
         \MakeUppercase{\normalfont\@university}\\
         \MakeUppercase{\normalfont\@city}\\
         %\vspace{0.5cm}
         {\normalfont\bfseries\@tahunterbitskripsi}}\\
      \end{singlespace}
      \end{center}
      \addcontentsline{toc}{chapter}{HALAMAN JUDUL}
      
%\addtocounter{page}{-1}
}  

%------------------------------------------------------------
%Approval Page
%------------------------------------------------------------
\def\halamanpengesahan{%
   \setlength{\topmargin}{-2.2cm}
  %\setlength{\oddsidemargin}{1.0cm}
  %\setlength{\evensidemargin}{1.0cm}  
   %\thispagestyle{empty}
    %
   %\setlength{\topmargin}{-2.5cm}
   % {\color{blue}
    \cleardoublepage\newpage\thispagestyle{empty}
    %\setlength{\headheight}{0pt}
    %\setlength{\voffset}{-2.2cm}
    %\setlength{\hoffset}{-1cm}
    %\setlength{\oddsidemargin}{1.0cm}
    %\setlength{\evensidemargin}{1.0cm}
 \begin{singlespace} 
 \noindent
 \begin{minipage}[c]{2cm}
 \includegraphics[width=1.2cm,height=2cm]{Logo_uin_walisongo.png}
 \end{minipage}
\begin{minipage}[c]{.8\textwidth}
\begin{center}
{\normalfont
KEMENTERIAN AGAMA R.I.\\
UNIVERSITAS ISLAM NEGERI WALISONGO\\
\textbf{FAKULTAS SAINS DAN TEKNOLOGI}\\
Jl. Prof. Dr. Hamka (Kampus II) Ngaliyan Semarang\\
Telp. 024-7601295 Fax. 7615387}
\end{center}
\end{minipage}

\noindent
\hrulefill
\hrulefill

{\centering\textbf{PENGESAHAN}\par}

\noindent Naskah skripsi berikut ini :\vspace{0.1cm}

\noindent
\begin{tabularx}{\linewidth}{@{}lcp{8.5cm}@{}}
Judul & : & \textbf{\@titleind} \\
Penulis & : & \@fullname \\
NIM & : & \@idnum \\
Jurusan & : & \@jurusan \\
%Program Studi & : & \@prodi
\end{tabularx}\vspace{0.1cm}

\noindent Telah diujikan dalam sidang \textit{tugas akhir} oleh Dewan Penguji \@faculty  UIN Walisongo dan dapat diterima sebagai salah satu syarat memperoleh gelar sarjana dalam Ilmu \@prodi.

\hspace{5.5cm} \@city, \@tanggalpengesahan
%\vfill
\begin{center}
DEWAN PENGUJI
\end{center}

\noindent
\begin{minipage}[c]{0.48\textwidth}
\begin{center}
Penguji I,\\[1cm]
\textbf{\@pengujipertama}\\[0pt]
NIP : \@nippengujipertama\\[.1cm]
Penguji III,\\[1cm]
\textbf{\@pengujiketiga}\\
NIP : \@nippengujiketiga\\[.1cm]
Pembimbing I,\\[1cm]
\textbf{\@pembimbingpertama}\\
NIP : \@nippembimbingpertama
\end{center}
\end{minipage}\hfill
\begin{minipage}[c]{0.48\textwidth}
\begin{center}
 Penguji II,\\[1cm]
 \textbf{\@pengujikedua}\\
NIP : \@nippengujikedua\\[.1cm]
Penguji IV,\\[1cm]
\textbf{\@pengujikeempat}\\
NIP : \@nippengujikeempat\\[.1cm]
Pembimbing II,\\[1cm]
\textbf{\@pembimbingkedua}\\
NIP : \@nippembimbingkedua
\end{center}
\end{minipage}

\end{singlespace}

\addcontentsline{toc}{chapter}{PENGESAHAN}

}

%------------------------------------------------------------
%Halaman Nota Pembimbing I
%------------------------------------------------------------
\def\halamannotabimbingsatu{%
   %\setlength{\topmargin}{-2.2cm}
  %\setlength{\oddsidemargin}{1.0cm}
  %\setlength{\evensidemargin}{1.0cm}  
   %\thispagestyle{empty}
    %
   %\setlength{\topmargin}{-2.2cm}
   % {\color{blue}
    \cleardoublepage\newpage\thispagestyle{empty}
    %\setlength{\headheight}{0pt}
    %\setlength{\voffset}{-2.0cm}
    %\setlength{\hoffset}{-1cm}
    %\setlength{\oddsidemargin}{1.0cm}
    %\setlength{\evensidemargin}{1.0cm}
 \begin{singlespace} 
 \begin{center}\textbf{NOTA DINAS}\end{center}  
 
 \hfill Semarang, \@tanggalnotabimbingsatu\\[1cm]
 %Kepada\\
 Yth. Ketua Program Studi \@prodi\\
 \@faculty\\	 
 UIN Walisongo Semarang\\[.5cm]
 \noindent\textit{Assalamu'alaikum warahmatullahi wabarakatuh}\\[.5cm]
 Dengan ini diberitahukan bahwa saya telah melakukan bimbingan, arahan dan koreksi naskah skripsi dengan:\\[.2cm]
\noindent
\begin{tabularx}{\textwidth}{@{}lcp{8.5cm}}
Judul & : & \@titleind\\
Nama  & : & \@fullname\\
NIM   & : & \@idnum\\
Jurusan & : & \@jurusan\\
%Program Studi & : & \@prodi\\
\end{tabularx}

\vspace{.2cm}
\noindent Saya memandang bahwa naskah skripsi tersebut sudah dapat diajukan kepada Fakultas Sains dan Teknologi UIN Walisongo untuk diujikan dalam Sidang Munaqasyah.\\

\noindent\textit{Wassalamu'alaikum warahmatullahi wabarakatuh}\\[1cm]

\begin{tabular}{p{4.5cm}c}
& Pembimbing I,\\
& \\
& \\
& \\
& \textbf{\@pembimbingpertama}\\
& NIP : \@nippembimbingpertama
\end{tabular}

 \end{singlespace}
 \addcontentsline{toc}{chapter}{NOTA PEMBIMBING I}

}
%------------------------------------------------------------
%Halaman Nota Pembimbing II
%------------------------------------------------------------
\def\halamannotabimbingdua{%
   %\setlength{\topmargin}{-2.2cm}
  %\setlength{\oddsidemargin}{1.0cm}
  %\setlength{\evensidemargin}{1.0cm}  
   %\thispagestyle{empty}
    %
   %\setlength{\topmargin}{-2.2cm}
   % {\color{blue}
    \cleardoublepage\newpage\thispagestyle{empty}
    %\setlength{\headheight}{0pt}
    %\setlength{\voffset}{-2.0cm}
    %\setlength{\hoffset}{-1cm}
    %\setlength{\oddsidemargin}{1.0cm}
    %\setlength{\evensidemargin}{1.0cm}
 \begin{singlespace} 
 \begin{center} \textbf{NOTA DINAS}\end{center}
 
 \hfill Semarang, \@tanggalnotabimbingdua\\[1cm]
 %Kepada\\
 Yth. Ketua Program Studi \@prodi\\
 \@faculty \\
 UIN Walisongo Semarang\\[.5cm]
 \noindent\textit{Assalamu'alaikum warahmatullahi wabarakatuh}\\[.5cm]
 Dengan ini diberitahukan bahwa saya telah melakukan bimbingan, arahan dan koreksi naskah skripsi dengan:\\[.2cm]
\noindent
\begin{tabularx}{\textwidth}{@{}lcp{8.5cm}@{}}
Judul & : & \@titleind\\
Nama  & : & \@fullname\\
NIM   & : & \@idnum\\
Jurusan & : & \@jurusan\\
%Program Studi & : & \@prodi\\
\end{tabularx}

\vspace{.2cm}
\noindent Saya memandang bahwa naskah skripsi tersebut sudah dapat diajukan kepada \@faculty UIN Walisongo untuk diujikan dalam Sidang Munaqasyah.\\

\noindent\textit{Wassalamu'alaikum warahmatullahi wabarakatuh}\\[1cm]

\begin{tabular}{p{4.5cm}c}
& Pembimbing II,\\
& \\
& \\
& \\
& \textbf{\@pembimbingkedua}\\
& NIP : \@nippembimbingkedua
\end{tabular}

 \end{singlespace}
 \addcontentsline{toc}{chapter}{NOTA PEMBIMBING II}
 
}
%------------------------------------------------------------
% Halaman Pernyataan
%------------------------------------------------------------
\def\halamanpernyataan{%
  \cleardoublepage\newpage\thispagestyle{empty}%
   \setlength{\voffset}{0cm}
   %\setlength{\hoffset}{0cm}
   %\setlength{\headheight}{12pt}
   %\setlength{\topmargin}{-0.9cm}
   %\setlength{\oddsidemargin}{1.46cm}
   %\setlength{\evensidemargin}{1.46cm}
    \begin{singlespace} 
  \begin{center}
  {\normalfont\large\bfseries\expandafter{PERNYATAAN KEASLIAN}}
  \par\nobreak
  \end{center}
  \vspace{0.5cm}
\noindent Yang bertanda tangan di bawah ini :\\[.4cm]
\noindent\begin{tabular}{lcl}
Nama & : &\@fullname \\
NIM  & : & \@idnum \\
Jurusan/Program Studi & : & \@jurusan / \@prodi
\end{tabular}

\vspace{0.4cm}    
\noindent menyatakan bahwa skripsi yang berjudul :

{\begin{center}\MakeUppercase{\normalfont\bfseries\@titleind}\end{center}}

\noindent secara keseluruhan adalah hasil penelitian/karya saya sendiri, kecuali bagian tertentu yang dirujuk sumbernya. 

\vspace{1.5cm}
\begin{tabular}{p{4.5cm}c}
&\@city,\space\@tanggalpernyataankeaslian\\
&Pembuat pernyataan,\\
&\\
&\\
&\\
&\\
&\\
&\\
&\space\@fullname\\
& NIM :\space\@idnum
\end{tabular}
\vfill
 \end{singlespace} 
\addcontentsline{toc}{chapter}{PERNYATAAN KEASLIAN}

}

%------------------------------------------------------------
% Halaman Persembahan
%------------------------------------------------------------
\def\acknowledment{%
  \cleardoublepage\thispagestyle{chapterheading}%
\null\vfill%Force the content of acknowledment to bottom page 
\addcontentsline{toc}{chapter}{Halaman Persembahan}
}

%------------------------------------------------------------
% Motto
%------------------------------------------------------------
\def\motto{%
  \cleardoublepage\clearpage\thispagestyle{chapterheading}%
\null\vfill%Force the content of acknowledment to bottom page 
\addcontentsline{toc}{chapter}{Halaman Motto}
}

%------------------------------------------------------------
% Kata Pengantar
%------------------------------------------------------------
\def\katapengantar{%
  \cleardoublepage\chapter*{\prefacename}%
  \input{\@filekatapengantar}
\addcontentsline{toc}{chapter}{KATA PENGANTAR}
}

%------------------------------------------------------------
% Nomenclature
%------------------------------------------------------------
\def\lambang{%
  \cleardoublepage\thispagestyle{chapterheading}%
  \printglossary%
\addcontentsline{toc}{chapter}{\nomenclaturename}
\halamankosong

}

%------------------------------------------------------------
% Daftar Isi
%------------------------------------------------------------
\def\daftarisi{%
	\cleardoublepage\thispagestyle{chapterheading}%
	%\setlength{\topmargin}{-3.4cm}
	\begin{singlespace}
	\addcontentsline{toc}{chapter}{\contentsname}
	\tableofcontents           								\end{singlespace}
	
}

%------------------------------------------------------------
% Daftar Gambar
%------------------------------------------------------------

\def\daftargambar{%
	\cleardoublepage\thispagestyle{chapterheading}%
	\addcontentsline{toc}{chapter}{\listfigurename}
	\listoffigures	
	
}

%------------------------------------------------------------
% Daftar Tabel
%------------------------------------------------------------

\def\daftartabel{%
	\cleardoublepage\thispagestyle{chapterheading}%
	\addcontentsline{toc}{chapter}{\listtablename}
	\listoftables	
}

%------------------------------------------------------------
% Daftar Lampiran
%------------------------------------------------------------
\def\daftarlampiran{%
	\cleardoublepage\thispagestyle{chapterheading}%
	\addcontentsline{toc}{chapter}{\listappendicesname}
	\listofappendices
}

%------------------------------------------------------------
% Lampiran
%------------------------------------------------------------
\def\lampiran{%
	\appendix 
	\cleardoublepage
	\addcontentsline{toc}{chapter}{Lampiran-lampiran}
	\addtocontents{toc}{\setcounter{tocdepth}{-1}}
	\renewcommand{\theequation}{L\theappendices.\arabic{equation}}
}

%------------------------------------------------------------
% Daftar Pustaka
%------------------------------------------------------------
\def\daftarpustaka{%
	\cleardoublepage\thispagestyle{chapterheading}%
	\addcontentsline{toc}{chapter}{\refname}
	\begin{thebibliography}{1}
		\input{\@filepustaka}
	\end{thebibliography}	
}

%------------------------------------------------------------
% Halaman Kosong
%------------------------------------------------------------

\def\halamankosong{%
	\clearpage
	\thispagestyle{empty}
	\phantom{a}
	%\vfill
	%{\centering This page intentionally left blank \par}
	%\vfill
	%\addtocounter{page}{-1}
}

%------------------------------------------------------------
% Redefine Abstract in Indonesian
%------------------------------------------------------------
\def\abstrak{%
  \cleardoublepage\thispagestyle{chapterheading}%
  {\parindent \z@ \normalfont
   \begin{center}	   
   {\large\textbf{\abstractname}} 
   \end{center}
   \vspace{.2cm}
   }
   \begin{singlespace}
  %{\centering\section*{\abstractname}}%
  %\vskip 20\p@
  %\addcontentsline{toc}{chapter}{\abstractname}
%} 
%\def\endabstractind{
   \input{\@fileabstrak}
\vspace{0.3cm}\noindent\textbf{\emph{Kata kunci}} : \@katakunci\par\vfil\null\end{singlespace}%
}

\AtBeginDocument{%
\if@doublesp%
	\doublespacing%
\else\if@singlesp%
	\singlespacing%
\else
	\onehalfspacing%
\fi%
}

\renewcommand*\theequation{\textup{\arabic{chapter}.\arabic{equation}}}

%\AtBeginDocument{%
%\if@langindo%
%\selectlanguage{bahasa}%
%\else
%\selectlanguage{english}%
%\fi
%}

\endinput
