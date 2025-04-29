#import "template.typ": us_letter

#show: us_letter.with(
    paperSize: "a4",
    headnote: [_compose science faster_],
    footnote: "1 of 1",
    title: [A Tiny Typst Tutorial], 
    authors: ((
        name: "Ya Tienna",
        prof: "Markdown User",
        link: link("https://github.com/HackYardo")[HackYardo\@github.com],),), 
    abstract: [Typst is a open-source markup language for scientific writing. It can edit math formulas, typeset & output PDFs and preview changes via incremental compilation. Compare to LaTeX, it's much easier to learn and use. Martin Haug and Laurenz Mädje made it in Berlin, 2019.\
    At 2025Q1, its GitHub #link("https://github.com/typst/typst", [main repo]) is written in 85.6% Rust, 13.8% Typst and has 39k stars.], 
    kw: [markup, compiler, typesetting],)

#place(top+left, float:true, scope:"parent", clearance:0.5em,)[
#grid(columns:(1fr,0.75fr), gutter:10pt,[
= Example #emoji.rocket
A #link("https://www.britannica.com/science/Fibonacci-number")[*Fibonacci* sequence] is defined by:
$F_n=F_(n-1)+F_(n-2)$.
- It can also be expressed in _closed form:_
$ F_n = round(1/sqrt(5) phi.alt^n),
quad phi.alt = (1+sqrt(5))/2 $<eq1>

#let count = 10
#let nums = range(1, count+1)
#let fib(n) = (
  if n <= 2 {1}
  else {fib(n - 1) + fib(n - 2)})

+ With @eq1, the first #count are:
#align(center, table(
  columns: count,
  ..nums.map(n => $F_#n$),
  ..nums.map(n => str(fib(n))),))

```typ
/*To gen this example:*/
#set page(paper:"us-letter", columns:2)
#set text(11pt, font: "Libertinus Serif")
#set par(justify:true)
#set math.equation(numbering:"(1)")
#show link: underline
#show regex("(Equation)\s\d+"): set text(blue)
#show heading: h => [ #set align(center)
    #set text(13pt, weight:"regular")
    #smallcaps(h.body)]
```],[
```typ
= Example #emoji.rocket
A #link("https://www.britannica.com/science/Fibonacci-number")[*Fibonacci* sequence] is defined by:
$F_n=F_(n-1)+F_(n-2)$.
- It can also be expressed in _closed form:_
$ F_n = round(1/sqrt(5) phi.alt^n),
quad phi.alt = (1+sqrt(5))/2 $<eq1>

#let count = 10
#let nums = range(1, count+1)
#let fib(n) = (
  if n <= 2 {1}
  else {fib(n - 1) + fib(n - 2)})

+ With @eq1, the first #count are:
#align(center, table(
  columns: count,
  ..nums.map(n => $F_#n$),
  ..nums.map(n => str(fib(n))),))
// the end
```])
#line(length:100%)]
== Key Points
#align(center, table(columns:2, 
    [rule], [#text(red)[set] typesetting rules],
    [code], [```typ #call reserved words/functions```],
    [math], [```typ $ "edit math formulas" $```],
    [markup], [\/\/  \/\*...\*\/  \=  \*...\*  \_...\_  \<...\> \@ \- \+],))
== Get Started
```sh
wget githubRelease
tar xvf typstFile.tar.xz
cd typstDir/
./typst compile your.typ  # gen your.pdf
# or autoly recompile on changes:
./typst watch your.typ  
```

= Contents
#outline(title:none)

= User Guide

There are four important things of Typst: *set/show* layout/format tool and 3 modes(*markup, math, code*). In most cases, you're in markup mode. And to call reserved words or functions inside markup mode, add a *\#* special symbol: 
- ```typ #image("glacier.jpg", width: 62%)```
#image("glacier.jpg", width: 62%)

== Set/Show and Syntax
Whatever you set/show, they will autoly apply to the content behind.

- Show sth whenever some words appear:
```typ
#show "dolor": l => box()[
  #box(image("glacier.jpg", height:1em)) 
  #l]
```
#show "dolor": l => box()[#box(image("glacier.jpg", height:1em)) #l]
The calls to the first box function and the image function did not require a leading \# because they were not embedded directly in markup. When Typst expects code instead of markup, the leading \# is not needed to access functions, keywords[?], and variables. This can be observed in parameter lists, function definitions, and code blocks.

- A special syntax for passing content to a function:
```typ
#text(font:"New Computer Modern", [
    = Intro
    #lorem(6)])
// the same to
#text(font:"New Computer Modern")[
    = Intro
    #lorem(6)]
```

== Code
There are many hands-on and useful functions.
- To gen table of contents, use outline().
    - ```typ #outline(title:none)```
- To cite sources @omarova-libra @un-hdr @foia, use bibliography() or cite():
    - ```typ #bibliography("cite.yml")```

*Whenever you don't know a function, go to:* @api

== Markup
Use special symbols (_synta sugar_) to layout/format.
```typ
/*
the 1st paragraph

the 2nd paragraph _(a blank line before)_
*Bold*, _italics_
= for level-1 heading, == for level-2, and so on
+ for numbered list and - for bulleted list
//one_line_comment and /*multiple lines comment*/ 
To ref a image, heading[?] or equation, attach a label <id> and then @id
#image() can not ref, use #figure() instead
*/
```
Syntax sugar v.s. Typst internally call functions:
```typ
= Intro
// the same to
#heading[Intro]
```
To markup within functions, use square brackets (called _content block_).
```typ
#figure(image("glacier.jpg", width: 50%),
    caption: [Typst supports images in the formats: _jpg, JPEG, GIF, SVG_.],) 
```
#figure(image("glacier.jpg", width: 50%),
    caption: [Typst supports images in the formats: _jpg, JPEG, GIF, SVG_.],)

== Math
```typ $rho v = (Q-C)/A$``` inline math equation  $rho v = (Q-C)/A$
, two spaces for non-inline ```typ $ 6beta + sum_(i=0)^nabla Q_i (alpha^i-epsilon)/2 $```
$ 6beta + sum_(i=0)^nabla Q_i (alpha^i-epsilon)/2 $
calligraphic letter and modified symbol ```typ $ cal(A) arrow.squiggly vec(a,b,c)^T $```:
$ cal(A) arrow.squiggly vec(a,b,c)^T $
the symbol out of math mode and in markup mode ```typ #sym.arrow.squiggly```: #sym.arrow.squiggly

== LaTex, PageSetup, Tables
```typ
#figure(
    table(
        columns: (auto, auto, auto),
        //inset: 10pt,
        align: horizon,
        table.header([], [*Volume*], [*Parameters*],),
        "cylinder",
        $ pi h (D^2 - d^2) / 4 $,[
            $h$: height \
            $D$: outer radius \
            $d$: inner radius],
        "tetrahedron",
        $ sqrt(2) / 12 a^3 $,
        [$a$: edge length]),
    caption: [the diff between cylinder and tetrahedron],) <t-1>
See @t-1 for more.
```
#figure(
    table(
        columns: (auto, 1fr, 1.5fr),
        inset: 10pt,
        align: horizon,
        table.header([], [*Volume*], [*Parameters*],),
        "cylinder",
        $ pi h (D^2 - d^2) / 4 $,[
            $h$: height \
            $D$: outer radius \
            $d$: inner radius],
        "tetrahedron",
        $ sqrt(2) / 12 a^3 $,
        [$a$: edge length]),
    caption: [the diff between cylinder and tetrahedron],) <t-1>
See @t-1 for more.
```typ
#set table(
  stroke: none,
  gutter: 0.2em,
  fill: (x, y) =>
    if x == 0 or y == 0 { gray },
  inset: (right: 1.5em),)

#show table.cell: it => {
  if it.x == 0 or it.y == 0 {
    set text(white)
    strong(it)} 
  else if it.body == [] {
    // Replace empty cells with 'N/A'
    pad(..it.inset)[_N/A_]} 
  else {it}}

#let a = table.cell(fill: green.lighten(60%),)[A]
#let b = table.cell(fill: aqua.lighten(60%),)[B]

#table(
  columns: 4,
  [], [Exam 1], [Exam 2], [Exam 3],
  [John], [], a, [],
  [Mary], [], a, a,
  [Robert], b, a, b,)
```
#set table(
  stroke: none,
  gutter: 0.2em,
  fill: (x, y) =>
    if x == 0 or y == 0 { gray },
  inset: (right: 1.5em),)

#show table.cell: it => {
  if it.x == 0 or it.y == 0 {
    set text(white)
    strong(it)} 
  else if it.body == [] {
    // Replace empty cells with 'N/A'
    pad(..it.inset)[_N/A_]} 
  else {it}}

#let a = table.cell(fill: green.lighten(60%),)[A]
#let b = table.cell(fill: aqua.lighten(60%),)[B]

#table(
  columns: 4,
  [], [Exam 1], [Exam 2], [Exam 3],
  [John], [], a, [],
  [Mary], [], a, a,
  [Robert], b, a, b,)

= API <api>
- Func image(_path_, width: _value_)
    - String: "dir/file.jpg"
    - Ascii: 24%, 12cm, 0.6in
- Func figure(_contentFigure_, caption: _things_)
    - Return: image()
    - Ascii or Block: ascii, [ascii, markup, func, etc]
- Func bibliography(_path_)
    - import lib to ref by ```typ @id``` and auto gen a ref section
    - String: "dir/cite.yml", "dir/cite.bib"
- Func cite(_source_)
    - ```typ #cite(<id>)``` is the same as ```typ @id```
    - Label: ```typ <id>```, ```typ <glacier-melt>```
- Func page(paper:_size_, margin:(x:_marginHorizontal_, y: _marginVertical_))
    - String: "a4", "us-letter"
    - Dict: (_key_:_value_)
        - Ascii: x, y, left, right, top, bottom
        - Ascii: 1.8cm, 1.5in
- Func text(font:_fontFamily_, size:_fontSize_)
    - String: "New Computer Modern"
    - Ascii: 10pt, default 11pt
- Func par(justify:_flag_, leading:_lineSpacing_)
    - Bool: true, false
    - Ascii: 0.52em, relative size of font
- Func align(_ways_, _things_)
    - Ascii: center+bottom, left+horizon, start, end, right, top
    - Ascii or Block: ascii, [ascii, markup, \#image()]
- Func lorem(_number_)
    - gen some placeholder text from Lorem Ipsum
    - Int: 6, 12, 24
- Func document(title:, author:, description:, keywords:, date:)
    - Block: [], none
    - Array(String)
    - Block: [], none
    - Array(String)
    - Retuen: datetime(), auto, none
- Func datetime(year:, month:, day:, hour:, minute:, second:)
    - Int for all
- Func place(_align_, float:_flag_, scope:_layer_, clearance:_zoom_, _things_)
    - Ascii: top+center
    - Bool: true, false
    - String: "parent"
    - Ascii: 2em
    - Block: [ascii, markup, image(), graph(), par()]
- Func v([TODO])
- Keyword \#set _Func(arg:value)_
    - set parameters values of a function for all future uses
- Keyword \#show "_compose_": _var_ => _func(var, do_sth)_
    - do sth to wherever the text appears  
    - Ascii
    - Ascii
    - Func
- Type Compose: 
    - plain text for writting
    - e.g. Lorem ipsum dolor sit amet, consectetur.
- Type Markup:
    - special symbol for typesetting
    - e.g. \=, \+, \-, \_, \@, \#
- Type Ascii:
    - plain text for functions and not be enclosed
    - e.g. 6in, 12cm, 3.6%, 11pt, 1fr, 2em, top, dir/file.jpg
    - Type Bool: true, false
    - Type Number:
        - Type Int: 2, 24, 36
        - Type Float: 0.2, 2.4, 3.65
- Type String: "ascii"
- Type Label: \<ascii\>
- Type Dict: (ascii:ascii)
- Type Keyword: set, show, let
- Type Func: image(), figure(), page(), par(), text()
- Type Return: return of func()
- Type Block: [ascii, markup, func, etc]

#bibliography("cite.yml")
