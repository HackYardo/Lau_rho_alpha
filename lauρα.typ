#set document(
  title:[Lauρα], 
  author:"HackYardo@github.com", 
  description:[my personal library for the forgotten and the remembered], 
  keywords:("book", "cheat-sheet", "knowledge", "note", "pdf", "typst"), 
  date:auto)

#set page(columns:2)
#set par(justify:true)

#place(top+center, float:true, scope:"parent",)[
= Lauρα
_my personal library for the forgotten and the remembered_]

#place(top+left, float:true, scope:"parent",)[
== Choice
Information is in constant need of composing and publishing. Popular ways are:

#let gray = 0%
#let lvA(compose) = {table.cell(fill: blue.lighten(gray), compose)}
#let lvB(compose) = {table.cell(fill: yellow.lighten(gray), compose)}
#let lvC(compose) = {table.cell(fill: red.lighten(gray), compose)}
#table(
  columns: 6,
  align: center,
  table.header([],         [write], [style], [arrange], [view], [print]),
  [paper + pen],           lvA([]), lvA([]), lvB([no ctrl+c,v,f,h]), lvA([]), lvC([via OCR]), 
  [plain text (.txt)],     lvA([]), lvC([none]), lvC([no TOC]), lvA([]), lvB([export .pdf]),
  [Office (.doc .odt)],    lvA([]), lvA([]), lvA([]), lvC([changeable]), lvB([export .pdf]),
  [Markdown (.md)],        lvA([]), lvA([]), lvC([1 page 1 column]), lvC([need parser]), lvC([need tool]),
  [Jekyll, Sphinx (.html)],lvC([need env]), lvB([template]), lvA([]), lvA([]), lvC([via browser]),
  [JupyterBook (myst.md)], lvA([]), lvB([template]), lvB([template]), lvB([need env]), lvB([template]),
  [LaTeX (.pdf)],          lvB([complex]), lvA([]), lvA([]), lvA([]), lvB([need env]),
  [Typst (.pdf)],          lvA([]), lvA([]), lvA([]), lvA([]), lvA([\~30M exe]),)]

So I choose Typst. At my first glance, Typst, as a new open source PDF compiler for rocket science, won't replace classic LaTeX in few years. Meanwhile, we really have to say goodbye to Markdown. ```typ /*As for JupyterBook, a interesting project that converts jupyter notebooks into pdf files, perhaps I can use Typst to implement some of its features such as callout, executable code block with line highlight and result output, cross-ref previews, etc.*/```

== E-Book, Manual, Dictionary
Why not azw3, epub, mobi, chm, mdx?
- They are pretty good but e-thing is virtual-thing. And PDF is the bridge connecting the e-world to the real world.

== Personal Knowledge Manage System
Why not a PKMS? 
+ It supports multimedia formats and online sources, that's not pithy and the compatibility is less. 
+ It's not sci-tech-oriented (text+math+code) usually, one may need code in VSCode, math in LaTeX, text in Office and then pack them all into a PKMS.

== Meta
This file itself is the guide for the whole Lauρα Library. Every chapter would be a stand-alone .typ. And the .gitignore ignores all .pdf.

#outline()

= Typst
== Intro & Install
== As a Typesetting System
=== Replace Markdowm
=== Four Modes: set, math, code, markup
=== Page Layout and Font Format
=== Edit Math Formula
=== Reserved Word, Funcrions, Package
=== Example: US-Letter
== As a Programming Language
=== Example: Calculator
=== Syntax and Style
=== Control Flow
=== Data Structure
=== Module
=== Base Library
=== Standard Library
=== Third Library
= Markdown
== Common Markdown
== GitHub Favoured Markdown
== Jupyter, Julia, Python, R
myst.md(JupyterBook), reStructuredText(Sphinx), rMarkdown(Pandoc)
= Programming Language
== Define and Histroy
== Example: Calculator
== Syntax and Style
== Control Flow
== Data Structure
== Module
== Base Library
The library that can be used without import or download.
== Standard Library
The library that can be used with import and without download.
== Third Library
The library that can be used with import and download.
= Natural Language
== Europe Language Rank[?]
== English
== Greek
= Aerodynamics
= Applied Mathematics
= Artificial Intelligence
