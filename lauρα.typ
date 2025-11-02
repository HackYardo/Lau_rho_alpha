#set document(
  title:[Lauρα], 
  author:"HackYardo@github.com", 
  description:[my personal library for the forgotten and the remembered], 
  keywords:("book", "cheat-sheet", "knowledge", "note", "pdf", "typst"), 
  date:auto)

#set page(columns:2)
#set par(justify:true)

#let c(color, p:100%, compose) = {
  text(color.transparentize(100%-p), compose)}
#let grey = luma(135)

#place(top+center, float:true, scope:"parent",)[
= Lauρα
_my personal library for the forgotten and the remembered_]

#place(top+left, float:true, scope:"parent",)[
== Choice
Information is in constant need of composing and publishing. Popular ways are:

#table(
  columns: 6,
  align: center,
  table.header([],         [write], [style], [arrange], [view], [print]),
  [paper + pen],           [],[],[no ctrl+c,v,f,h],[],c(red)[via OCR],
  [plain text (.txt)],     [],c(red)[none],c(red)[no ToC],[],[export .pdf],
  [Office (.doc .odt)],    [],[],[],c(red)[changeable],[export .pdf],
  [Markdown (.md)], [],[],[1 column],c(red)[need parser],c(red)[need tool],
  [Jekyll, Sphinx (.html)],c(red)[need env],[template],[],[],c(red)[via browser],
  [JupyterBook (myst.md)], [],[template],[template],[need env],[template],
  [LaTeX (.tex $=>$ .pdf)],  [complex],[],[],[],[need env],
  [Typst (.typ $=>$ .pdf)],  [],[],[],[],c(blue)[_\~50M exe_])]

So I choose Typst. At my first glance, Typst, as a new open source PDF compiler for rocket science, won't replace classic LaTeX in few years. Meanwhile, we really have to say goodbye to Markdown. #c(grey)[As for JupyterBook, a interesting project that converts jupyter notebooks into pdf files, perhaps I can use Typst to implement some of its features such as callout, executable code block with line highlight and result output, cross-ref previews, etc.]

== e-Book, Manual, Dictionary
Why not azw3, djyu, epub, mobi, chm, mdx?
- They are pretty good but e-thing is virtual thing. And PDF is the bridge connecting the e-world to the real world.

== Personal Knowledge Manage System
Why not a PKMS?
+ It supports multimedia formats and online sources, that's not pithy and less compatible.
+ It's not sci-tech-oriented (text+math+code) usually, one may need code in VSCode, math and text in LaTeX, then pack all into a PKMS.

== Meta
This file is the guide to the Lauρα Library. Every chapter or section is a stand-alone book. And the .gitignore ignores any .pdf to save disk. Color for states: #c(grey)[pause] wait #c(orange)[next] #c(blue)[draft] #c(lime)[revise] #c(green)[publish]

#outline(title:"Table of Contents")
#pagebreak()

= Aerodynamics

= Algorithm

= Applied Mathematics

= Applied Physics

= Artificial Intelligence

= Computer and Open Source Fundamentals
Intro
== Hardware Structure
== Software Programming
== Free Open Source Software
=== Operating System: Linux, Distro
=== Version Control System: Git
=== Multimedia: Firefox, FFmpeg, VLC

= Idea
== Conway Game PK
== Thermal electric energy, air conditioner

= Markdown
== #c(green)[CommonMark]
== #c(blue,p:80%)[GitHub Markup (GitHub Favoured Markdown)]
== Jupyter, Julia, Python, R
myst.md(JupyterBook), reStructuredText(Sphinx), rMarkdown(Pandoc)
== HyperText Markup Language

= Natural Language, Symbol
== CEFR, English
== Greek Letter, Math Symbol
== Unicode, Emoji

= Portable Document Format, Typst
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
=== Third Party Library

= Programming Language
== Elementary Concept
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
== Third Party Library
The library that can be used with import and download.
== Junior Middle Concept
== Senior Middle Concept
== Advanced Concept
