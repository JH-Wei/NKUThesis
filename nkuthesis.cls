\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nkuthesis}
              [2016/04/24 v0.1
The LaTeX template for bachelor thesis of NKU]

%%%%%%%%%%%%%%%%%
% class options         
%%%%%%%%%%%%%%%%%

% 模板选项
\newif\ifnku@continum\nku@continumfalse
\newif\ifnku@appnum\nku@appnumfalse
\DeclareOption{continum}{\nku@continumtrue}
\DeclareOption{appnum}{\nku@appnumtrue}

% 选项传递给ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

% 引用ctexbook
\LoadClass[cs4size,a4paper,fancyhdr]{ctexbook}[2007/10/19]

%%%%%%%%%%%%%%%%%
% packages          
%%%%%%%%%%%%%%%%%

\RequirePackage{ifthen}
\RequirePackage{mathrsfs,bm}                          %数学相关
\RequirePackage{amsmath,amssymb,amsfonts,amsthm}      %数学相关
\RequirePackage{fontspec}                             %字体设置
\RequirePackage{geometry}                             %页边距更改
\RequirePackage{fancyhdr}                             %页眉页脚设置
\RequirePackage{titletoc}                             %目录格式
\RequirePackage{titlesec}                             %章节标题
\RequirePackage{graphicx}                             %图片
\RequirePackage[normalsize]{subfigure}                %子图
\RequirePackage[xetex,unicode]{hyperref}              %交叉引用
\RequirePackage[numbers,sort]{natbib}                 %引用格式
\RequirePackage{multirow,tabularx,booktabs,longtable} %复杂表格实现
\RequirePackage{enumitem}                             %列表
%\RequirePackage{tikz}                                 %强大的绘图包，可实现费曼图流程图等等
\RequirePackage{xcolor,listings}                      %代码环境
\RequirePackage{pifont}                               %符号包
\RequirePackage{url}                                  %为电子版提供url支持
\RequirePackage[perpage]{footmisc}                    %注释清零
\RequirePackage{caption}

%%%%%%%%%%%%%%%%%
% format        
%%%%%%%%%%%%%%%%%

%%%%字体%%%%
% 设置英文字体为Times New Roman，需要用XeLaTeX或者LuaLaTeX编译以调用系统字体
\setmainfont{Times New Roman}

%%%%行距%%%%
\renewcommand{\baselinestretch}{1.62}

%%%%页边距%%%%
\newgeometry{
    top=2.54cm, bottom=2.54cm, left=3.17cm, right=3.17cm,
    headsep=5mm,
}
\savegeometry{maingeometry}
\loadgeometry{maingeometry}

%%%%脚注%%%%
\renewcommand{\thefootnote}{\circnum{\arabic{footnote}}}

%%%%目录%%%%
\titlecontents{chapter}[0pt]{\songti\zihao{-3}}{\thecontentslabel\ }{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}
\titlecontents{section}[2em]{\vspace{0.1\baselineskip}\songti\zihao{4}}{\thecontentslabel\ }{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}
\titlecontents{subsection}[4em]{\vspace{0.1\baselineskip}\songti\zihao{4}}{\thecontentslabel\ }{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}
    
 %%%%标题%%%%
\ctexset{
    chapter = {
        name   ={,、},
        number ={\chinese{chapter}},
        format ={\centering\zihao{-3}\heiti},
        afterskip = 20pt,
        beforeskip = 10pt,
    },
    section = {
        name   ={（,）},
        number ={\chinese{section}},
        format ={\zihao{4}\heiti},
    },
    subsection = {
        name   ={,.},
        number ={\arabic{subsection}},
        format ={\zihao{-4}\heiti},
    },
}

\ifnku@continum
    \ctexset{appendix/numbering=true}
\else
    \ctexset{appendix/numbering=false}
\fi
%%%%表题与图题%%%%
\captionsetup[table]{skip=0pt}
\captionsetup[figure]{skip=0pt}
\captionsetup{labelsep=space}

%%%%列表%%%%
\setlist{noitemsep,topsep=0pt,
itemindent=1em,
listparindent=1em
}

%%%%代码环境%%%%

\lstset{
basicstyle=\small\ttfamily,
keywordstyle=\bfseries,
stringstyle=\ttfamily,
numbers=left,           %标号
showstringspaces=false, %不显示中间的空格
frame=lines,            %边框式样
}

%%%%参考文献%%%%
\bibliographystyle{gbt-7714-2015}

%%%%标题%%%%
\renewcommand{\contentsname}{\zihao{3}目~~~~录}
%\renewcommand{\tablename}{表}
\renewcommand{\appendixname}{\zihao{4}附~~~~录}
%\renewcommand\bibname{参\ 考\ 文\ 献}

%%%%编号是否连续%%%%
\ifnku@continum
    \renewcommand{\thefigure}{\arabic{figure}}
    \renewcommand{\thetable}{\arabic{table}}
    \renewcommand{\theequation}{\arabic{equation}}
\fi

%%%%%%%%%%%%%%%%%
% environment      
%%%%%%%%%%%%%%%%%

%摘要环境
\newenvironment{chnabstract}
{
    \newpage
    \cleardoublepage
    \centerline{\heiti \zihao{4} 摘~~~~要}
    \vskip 1cm
    \zihao{-4}
}
{
    \par
    \noindent\heiti\zihao{-4}{关键词：}\songti\nku@chnkeyword
}

\newenvironment{engabstract}
{   
    \newpage
    \cleardoublepage
    \centerline{\zihao{4} \textbf{Abstract}}
    \vskip 1cm
    \zihao{-4}
}
{
\par
\noindent\zihao{-4}\textbf{Keywords：}\songti\nku@engkeyword
}

% 正文环境
\newcommand{\mainbody}{
\mainmatter
%\loadgeometry{maingeometry}
\zihao{-4}
\songti
}

%%%%%%%%%%%%%%%%%
% functions      
%%%%%%%%%%%%%%%%%

% 带圈数字的映射，用\textcircled生成的太丑了
\newcommand\circnum[1]{%
  \ifcase#1\relax
    \raisebox{1.2pt}{\textcircled{\raisebox{-.4pt}{\scalebox{0.8}{#1}}}}
  \or
    \ding{192}
  \or
    \ding{193}
  \or
    \ding{194}
  \or
    \ding{195}
  \or
    \ding{196}
  \or
    \ding{197}
  \or
    \ding{198}
  \or
    \ding{199}
  \or
    \ding{200}
  \or
    \ding{201}
  \else
    \raisebox{1.2pt}{\textcircled{\raisebox{.2pt}{\scalebox{0.65}{#1}}}}
  \fi
}

%%%%%%%%%%%%%%%%%
% variables      
%%%%%%%%%%%%%%%%%

% 作者
\def\nku@thesisauthor{}
\newcommand{\thesisauthor}[1]{%
    \def\nku@thesisauthor{#1}
}
% 年级
\def\nku@grade{}
\newcommand{\grade}[1]{%
    \def\nku@grade{#1}
}
% 学号
\def\nku@studentID{}
\newcommand{\studentID}[1]{%
    \def\nku@studentID{#1}
}
% 学院
\def\nku@school{}
\newcommand{\school}[1]{%
    \def\nku@school{#1}
}
%系别
\def\nku@department{}
\newcommand{\department}[1]{%
    \def\nku@department{#1}
}
% 专业
\def\nku@major{}
\newcommand{\major}[1]{%
    \def\nku@major{#1}
}
% 指导老师
\def\nku@teacher{}
\newcommand{\teacher}[1]{%
    \def\nku@teacher{#1}
}
% 论文标题
\def\nku@thesistitlechn{}
\def\nku@thesistitleeng{}
\newcommand{\thesistitle}[2]{%
    \def\nku@thesistitlechn{#1}
    \def\nku@thesistitleeng{#2}
}
% 中文摘要关键字
\def\nku@chnkeyword{}
\newcommand{\chnkeyword}[1]{%
    \def\nku@chnkeyword{#1}}
% 英文摘要关键字
\def\nku@engkeyword{}
\newcommand{\engkeyword}[1]{%
    \def\nku@engkeyword{#1}}
% 论文署名时间
\def\nku@thesisdateyear{}
\def\nku@thesisdatemonth{}
\newcommand{\thesisdate}[3]{%
    \def\nku@thesisdateyear{#1}
    \def\nku@thesisdatemonth{#2}
    \def\nku@thesisdateday{#3}
}
% 论文结束时间
\def\nku@thesisendyear{}
\def\nku@thesisendmonth{}
\def\nku@thesisendday{}
\newcommand{\thesisend}[3]{%
    \def\nku@thesisendyear{#1}
    \def\nku@thesisendmonth{#2}
    \def\nku@thesisendday{#3}
}
% 双修院系
\def\nku@dualschool{}
\newcommand{\dualschool}[1]{%
    \def\nku@dualschool{#1}
}
% 双修专业
\def\nku@dualmajor{}
\newcommand{\dualmajor}[1]{%
    \def\nku@dualmajor{#1}
}