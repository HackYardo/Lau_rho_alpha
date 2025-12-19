#set document(
  title:[Lauρα], 
  author:"HackYardo@github.com", 
  description:[my personal library for the forgotten and the remembered], 
  keywords:("book", "cheat-sheet", "knowledge", "note"),
  date:auto)

#set page(columns:2)
#set par(justify:true)
#set text(size:10pt)
#show "LaTeX": [L#h(-0.3em)#box(move(dy:-0.233em, text(size:0.66em)[A]))#h(-0.1em)T#h(-0.145em)#box(move(dy: 0.233em)[E])#h(-0.135em)X]

// heading_fake(level, heading)
#let hf(l,h) = {text(1.6em-l*0.2em, weight:"bold")[#h\ ]}

#let grey = luma(135)

#let string(content) = {
  if content == none {""}
  else if type(content) == str {content}
  else if type(content) == array {content.map(string).join(", ")}
  else if content.has("text") {content.text}
  else if content.has("children") {
    if content.children.len() == 0 {""}
    else {content.children.map(string).join("")}}
  else if content.has("child") {string(content.child)}
  else if content.has("body") {string(string(content.body))}
  else if content == [] {""}
  else if content == [ ] {" "}
  else if content.func() == ref {"_ref_"}
  else {let offending = content; ""}}

#let c(color, p:100, compose) = {
  if p == 100 {text(color, compose)}
  else {
    let t = string(compose)
    let l = int(t.len()*p/100)

    if l <= 0 {l = 1}
    if l > t.len() {l = t.len()}

    text(color, t.slice(0,l))
    t.slice(l)}}

#place(top+center, float:true, scope:"parent",)[
= Lauρα
_my personal library for the forgotten and the remembered_]

#place(top+left, float:true, scope:"parent",)[
#hf(2)[Choice]
Information is in constant need of composing and publishing. Popular ways are:

#table(
  columns: 6,
  align: center,
  table.header([],         [write],[style],[arrange],[view],[print]),
  [paper + pen],           [],[],[no ctrl+c,v,f,h],[],c(red)[via OCR],
  [plain text (.txt)],     [],c(red)[none],c(red)[no ToC],[],[export .pdf],
  [Office (.doc .odt)],    [],[],[],c(red)[changeable],[export .pdf],
  [Markdown (.md)], [],[],[1 column],c(red)[need parser],c(red)[need tool],
  [Jekyll, Sphinx (.html)],c(red)[need env],[template],[],[],c(red)[via browser],
  [JupyterBook (myst.md)], [],[template],[template],[need env],[template],
  [LaTeX (.tex $=>$ .pdf)],  [],[],[],[need env],[need env],
  [Typst (.typ $=>$ .pdf)],  [],[],[],c(blue)[instant],c(blue)[\~50M exe])]

So I choose Typst. At my first glance, Typst, as a new open source PDF compiler for rocket science, won't replace classic LaTeX in few years. Meanwhile, we really have to say goodbye to Markdown.

#hf(2)[e-Book, Manual, Dictionary]
Why not azw3, djyu, epub, mobi, chm, mdx?
- They are pretty good but e-thing is virtual thing. And PDF is the bridge connecting the e-world to the real world.

#hf(2)[Personal Knowledge Manage System]
Why not a PKMS?
+ It supports multimedia formats and online sources, that's not pithy or compatible.
+ It's not sci-tech-oriented (text+math+code) usually, one may need text in Office, code in VSCode, math in LaTeX, then pack all into a PKMS.

#hf(2)[Meta]
This file is the guide to the Lauρα Library. Every chapter or section is a stand-alone book. To save disk, the .gitignore ignores any .pdf. Color is for states or progress: #c(grey)[pause] wait #c(orange)[next] #c(blue)[draft] #c(purple)[revise] #c(green)[publish]

#outline(title:"Table of Contents", depth:2)
//#pagebreak()

= *Part I: SCIENCE*

= Elementary Science: Scope, Method, Conclusion

= Applied Mathematics
== Single Differential Integral
== Double, Triple, Vector, Tensor
== Vector Space, Matrix Algebra
== Stochastic, Probability, Statistics

= Algorithm
== Aim, Method, Performance
== Flow Chart, Unified Modeling Language
== PseudoCode, Extended Backus-Naur Form

= Artificial Intelligence

= Natural Language, Symbol
== CEFR, English
== #c(orange)[Greek Letter, Math Symbol]
== #c(blue,p:50)[Unicode, Emoji]

= *Part II: COMPUTING*

= Programming Language, Python
== Define, Histroy, Concept, Philosophy
== Syntax, Style, Package, Design Pattern
Core, Base, Standard, Third Party:
- The package that can be used without any prefix.
- The package that can be used without import or download.
- The package that can be used with import and without download.
- The package that can be used with import and download.
== Data Structures and their Algorithms

= Computer and Open Source Fundamentals
== Hardware Structure, Software Layer
== #c(blue,p:5)[Linux], #c(purple)[Git], Regex
- dict
  - nonwill/GoldenDict-OCR: goldendict++, has compiled linux version
  - goldeidict(vanilla): qtwebkit -> qtwebengine
- auto run .sh at startup or at awake from sleep
  - gnome or plasma: systemd actually, need permit
  - systemd: format
  - init.d: format
  - rc.d/rc.local: no rc.d but rc0.d?
  - 3rd lib
- proper font fallback?
- git
  - termux(wsl?): apt => pkg, no git-all(no gitk, git-gui)
  - gitignore: more details from 'Pro Git'
  - stash, squash, cherry-pick, nano rebase to public
  - link of git, gh, self; header footer info at diff page

= Markdown
== #c(green)[CommonMark]
#figure(image("computing/git_linux_markdown_regex/markdown.pdf"))
== #c(blue,p:80)[GitHub Markup (GitHub Favoured Markdown)]
auto-anchor
== #c(orange)[JupyterBook MyST]
myst.md(JupyterBook), reStructuredText(Sphinx), rMarkdown(Pandoc)\
JupyterBook is a interesting project that converts jupyter notebooks into pdf files, perhaps I can use Typst to implement some of its features such as callout, executable code block with line highlight and result output, cross-ref previews, etc.
== HyperText Markup Language

= Portable Document Format, Typst
Intro & Install
== As a Typesetting System
=== Replace Markdowm
=== Four Modes: markup, set, math, code
=== Page Layout and Font Format
=== Math Formula
=== Reserved Word, Function, Package
=== Example: US-Letter
== As a Programming Language
```typ
#let heading-numbering = "1.1"
#set heading(numbering: heading-numbering)
#show heading: it => {
  let key = lower(string(it).replace(" ", "-"))
  return [
    #it
    #v(-1em)
    #figure(
      kind: "heading",
      numbering: (..numbers) => numbering(heading-numbering, ..(counter(heading).get())),
      supplement: "Section",
    )[]
    #label(key)
  ]
}
```
= *Part III: CREATIONs*

= Aerodynamics Trajectory
= Natural Object Shape Equation
= Light Reflect in a Closed Mirror
= Angular Velocity Law: Moon Follow
= Visual: Circular and Flux Theorem
= Data Visual, Plot, Web-UI
== #c(grey)[VastGo, Plotly.js, Dash.jl]
== VastBaduk, NiceGUI.py
= Multi-Player Conway Game
= Quick-Cool Water Cup, Cooking, Fire
= Garden, Landscape
