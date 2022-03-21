%
%  Copyright 2016-2022 Wen Wang <wangwen1192@outlook.com>
%
%  This work may be distributed and/or modified under the
%  conditions of the LaTeX Project Public License, either version 1.3
%  of this license or (at your option) any later version.
%  The latest version of this license is in
%    http://www.latex-project.org/lppl.txt
%  and version 1.3 or later is part of all distributions of LaTeX
%  version 2005/12/01 or later.
%
%  This work has the LPPL maintenance status `maintained'.
%
%  The Current Maintainer of this work is Wen Wang <wangwen1192@outlook.com>.
%
%  This work consists of the files thesis-uestc.cls, thesis-uestc.bst.
%


ENTRY
{
  author
  title
  publisher
  journal
  address
  year
  date
  pages
  translator
  booktitle
  institution
  country
  url
  volume
  number
  type
  id
  note
  language
  eprint
}
{}
{label}

STRINGS { s t}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

INTEGERS{ l }
FUNCTION{ string.length }
{
    #1 'l :=
    {duplicate$ duplicate$ #1 l substring$ = not}
        {l #1 + 'l :=}
    while$
    pop$ l
}

FUNCTION {get.last.chr}
{
  duplicate$ string.length
  duplicate$ #0 = {
    pop$
  } {
    #1 substring$
  } if$
}

FUNCTION {trim.start}
{
  {duplicate$ #1 #1 substring$ " " =} {
    #2 global.max$ substring$
  } while$
}

FUNCTION {trim.end}
{
  {duplicate$ get.last.chr " " =} {
    duplicate$ string.length #1 -
    #1 swap$ substring$
  } while$
}

FUNCTION {trim}
{
  trim.start
  trim.end
}

FUNCTION {bbl.etal}
{ "et~al" }

FUNCTION {bbl.deng}
{ "等" }

FUNCTION {bib.begin}
{
    "\begin{thebibliography}{\bstlabelmark}"
    write$ newline$
    "\interlinepenalty=10000"
    write$ newline$
    "\setlength{\itemsep}{0bp}\setlength{\parskip}{0pt}\small"
    write$
    newline$
}

FUNCTION {bib.end}
{
    "\end{thebibliography}"
    write$
    newline$
}

FUNCTION {bibitem.begin}
{
    "\bibitem{" cite$ *
    "} " *
    write$
}

FUNCTION {bibinfo.check}
{ swap$
  duplicate$ missing$
    {
      pop$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ pop$
        }
        { swap$
          pop$
        }
      if$
    }
  if$
}

INTEGERS { nameptr namesleft numnames }


STRINGS  { bibinfo}

FUNCTION {format.names}
{ 'bibinfo :=
  duplicate$ empty$ 'skip$ {
  's :=
  "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{f.~}{vv~}{ll}{, jj}"
      format.name$
      bibinfo bibinfo.check
      't :=
      nameptr #1 >
        {
          nameptr #3
          #1 + =
          numnames #3
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            {
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              "," *
              t "others" =
                {
                  " " * bbl.etal *
                }
                { " " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  } if$
}

FUNCTION {format.chinese.names}
{ 'bibinfo :=
  duplicate$ empty$ 'skip$ {
  's :=
  "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{f.~}{vv~}{ll}{, jj}"
      format.name$
      % bibinfo bibinfo.check
      't :=
      nameptr #1 >
        {
          nameptr #3
          #1 + =
          numnames #3
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            {
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              "others" t =
              'skip$
              { "," * }
              if$
              t "others" =
                {
                  " " * bbl.deng *
                }
                { " " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  } if$
}

FUNCTION {format.authors}
{
  language missing$
    { author "author" format.names }
    {
      language "zh" =
        { author "author" format.chinese.names }
        { author "author" format.names }
      if$
    }
  if$
}

FUNCTION {format.title}
{
    title "t" change.case$
}

FUNCTION {format.publisher}
{
    publisher
}

FUNCTION {format.booktitle}
{
    booktitle
}


FUNCTION {format.journal}
{
    journal
}

FUNCTION {format.address}
{
    address
}

FUNCTION {format.year}
{
    year
}

FUNCTION {format.date}
{
    date
}

FUNCTION {format.country}
{
    country
}

FUNCTION {format.type}
{
    type
}

FUNCTION {format.id}
{
    id
}

STRINGS{replace find text}
INTEGERS{find_length}
FUNCTION{find.replace}
{
    'replace :=
    'find :=
    'text :=
    find string.length 'find_length :=
    ""
        { text empty$ not }
        { text #1 find_length substring$ find =
            {
                replace *
                text #1 find_length + global.max$ substring$ 'text :=
            }
            {
                text #1 #1 substring$ *
                text #2 global.max$ substring$ 'text :=
            }
        if$
    }
    while$
}

FUNCTION {format.pages}
{
    pages "--" "-" find.replace
    " " "" find.replace
}

FUNCTION {format.institution}
{
    institution
}

FUNCTION {format.url}
{
    "\url{" url *
    "}" *
}
FUNCTION {add.period}
{
    ". " write$
}

FUNCTION {add.comma}
{
    ", " write$
}

FUNCTION {book}
{
    bibitem.begin
    format.authors write$ add.period
    format.title "[M]" * write$ add.period
    translator missing$
    'skip$
    {
        "(" translator "translator" format.names *
        ")" * write$
        add.period
    } if$
    address missing$
    'skip$
    {
        format.address write$ ": " write$
    } if$
    format.publisher write$ add.comma
    format.year write$
    pages missing$
    'skip$
    {
        add.comma
        format.pages write$
    } if$
    "." write$
    newline$
}

FUNCTION {incollection}
{
    book
}

FUNCTION {conference}
{
    bibitem.begin
    format.authors write$ add.period
    format.title "[C]" * write$ add.period
    journal missing$
    {
        format.booktitle write$
    } {
        format.journal write$
    } if$

    add.comma
    address missing$
    'skip$
    {
        format.address write$ add.comma
    } if$
    format.year write$ add.comma
    format.pages write$
    "." write$
    newline$
}

FUNCTION {proceedings}
{
    conference
}

FUNCTION {inproceedings}
{
    conference
}

FUNCTION {article}
{
    bibitem.begin
    format.authors write$ add.period
    format.title "[J]" * write$ add.period
    format.journal write$ add.comma
    format.year write$
    
    volume missing$ {
      pages missing$ 'skip$
      {
        add.comma
        format.pages write$
      } if$
    }
    { add.comma
      number missing$ { volume write$ }
      {
        volume "(" * number *
        ")" * write$
      } if$
      pages missing$ 'skip$ { ": " format.pages * write$ } if$
    } if$
    "." write$
    newline$
}

FUNCTION {thesis}
{
    bibitem.begin
    format.authors write$ add.period
    format.title "[D]" * write$ add.period
    address missing$
    'skip$
    {
        format.address write$ ": " write$
    } if$
    format.institution write$ add.comma
    format.year write$ add.comma
    format.pages write$
    "." write$
    newline$
}

FUNCTION {masterthesis}
{
    thesis
}

FUNCTION {phdthesis}
{
    thesis
}

FUNCTION {newspaper}
{
    bibitem.begin
    format.authors write$ add.period
    format.title "[N]" * write$ add.period
    journal missing$
    {
        format.booktitle write$
    } {
        format.journal write$
    } if$
    add.comma

    format.date write$
    "." write$
    newline$
}

FUNCTION {techreport}
{
    bibitem.begin
    format.authors write$ add.period
    format.title "[R]" * write$ add.period
    address missing$
    'skip$
    {
        format.address write$ ": " write$
    } if$
    format.institution write$ add.comma
    format.date write$
    "." write$
    newline$
}

FUNCTION {patent}
{
    bibitem.begin
    format.authors write$ add.period
    format.title "[P]" * write$ add.period
    format.country write$ add.comma
    format.type write$ add.comma
    format.id write$ add.comma
    format.date write$
    "." write$
    newline$
}

FUNCTION {standard}
{
    bibitem.begin
    format.institution write$ add.period
    format.id write$ add.period
    format.title "[S]" * write$ add.period
    format.address write$ ": " write$
    format.publisher write$ add.comma
    format.date write$
    "." write$
    newline$
}

FUNCTION {digital}
{
    bibitem.begin
    format.authors write$ add.period
    format.title write$
    "[" format.type * "]" * write$ add.period
    format.date write$ add.comma
    format.url write$
    "." write$
    newline$
}

FUNCTION {misc}
{
    bibitem.begin
    format.authors write$ add.period
    format.title write$
    "[J]. CoRR abs/" eprint * write$ add.comma
    format.year write$
    "." write$
    newline$
}

FUNCTION {onlynote}
{
    bibitem.begin
    note write$
    "." write$
    newline$
}

READ

EXECUTE {bib.begin}

ITERATE {call.type$}

EXECUTE {bib.end}
