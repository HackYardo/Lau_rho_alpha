#set document(
  title:[Lauρα], 
  author:"HackYardo@github.com", 
  description:[my personal library for the forgotten and the remembered], 
  keywords:("book", "cheat-sheet", "knowledge", "note"),
  date:auto)

#set page(columns:2)
#set par(justify:true)
#set text(size:10pt)

#let latex = [L#h(-0.3em)#box(move(dy:-0.233em, text(size:0.66em)[A]))#h(-0.1em)T#h(-0.145em)#box(move(dy: 0.233em)[E])#h(-0.135em)X]

#show "LaTeX": latex

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

#let grey = luma(135)

// chapter_progress(color, progressPercent, compose)
#let c(color, p:100, x) = {
  if p == 100 {text(color, x)}
  else {
    let t = string(x)
    let l = int(t.len()*p/100)

    if l <= 0 {l = 1}
    if l > t.len() {l = t.len()}

    text(color, t.slice(0,l))
    t.slice(l)}}

// heading_fake(level, heading)
#let hf(l,h) = text(1.6em-l*0.2em, weight:"bold")[#h\ ]

#let p(align:top+center, x) = place(align, float:true, scope:"parent", x)


#p[
= Lauρα
_my personal library for the forgotten and the remembered_]

#p(align:top+left)[
#hf(2)[Choice]
Information is in constant need of composing and publishing. Popular ways are:]

#p(table(columns:6,
  table.header([],         [write],[style],[arrange],[view],[print]),
  [paper + pen],           [],[],[no ctrl+c,v,f,h],[],c(red)[via OCR],
  [plain text (.txt)],     [],c(red)[none],c(red)[no ToC],[],[export .pdf],
  [Office (.doc .odt)],    [],[],[],c(red)[changeable],[export .pdf],
  [Markdown (.md)], [],[],[1 column],c(red)[need parser],c(red)[need tool],
  [Jekyll, Sphinx (.html)],c(red)[need env],[template],[],[],c(red)[via browser],
  [JupyterBook (myst.md)], [],[template],[template],[need env],[template],
  [LaTeX (.tex $=>$ .pdf)],  [],[],[],[need env],[need env],
  [Typst (.typ $=>$ .pdf)],  [],[],[],c(blue)[instant],c(blue)[\~50M exe]))

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
The Common European Framework of Reference for Languages (CEFR) is an international standard for describing language ability. It is used worldwide to describe learners' language skills on a scale from A1 (beginner) to C2 (mastery).
=== Vocabulary Sheet
antonym synonym thesaurus ref link color
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
  - commit manage: find wrong new one, main branch go back to old one

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
    #label(key)]}
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


= *Part IV: IDEAs*


= Theory
== Software as Book
== thing-time law

#colbreak()

= Project
```md
== a-Tiny-Typst-Tutorial: Be Literary Giant Tonight

**Abstract:** Without satellites, the Earth maybe flat. Without Typst, the game changer, one may never compile PDF from plain text. What if Markdown Syntax + LaTeX Quality + Office WYSIWYG? A Tiny Typst Tutorial will show you the case.

**Key words:** latex-typst encyclopedia book-series Diataxis latin-cjk

=== Intro

<details>
  <summary>One Image Example</summary>
  #set jjs()
</details>
```

Diátaxis Typst Document, clear concise comprehensive, Apache-2.0

$ "Typst" = "Markdown\nSyntax" + #{move(dy:-0.67em, "LaTeX\nQuality")} + "Office\nWYSIWYG" $

=== Usage
?latest version link of github release
```sh
# Download -> Decompress -> Add to PATH
$ wget xxx.tar.xz  # https://typst.app/open-source/#download
$ tar -xf xxx.tar.xz
$ ln -s /path/to/xxx/typst /user/local/bin/typst

# PlainText.typ -> Compile PDF -> View
$ typst compile aTinyTypstTutorial.typ
$ firefox *.pdf
```
=== Table of Contents
0. Why Not LaTeX, Markdown, Word, Jupyter, Quorto, Shpinx?
1. Typst Quickstart (simplified official toturial)
2. Official Reference
3. Non-Latin and CJK
  1. Rome UpCase Bold Italic Underline
4. DIY with Method and Field
5. As a Typesetting System
  0. ref: LaTeX-doc?
  1. Diff: LaTeX, Markdown, Word, ...
  2. [IMPORTANT] font, input method
  3. markup/code/math mode and exchange
6. As a Programming Language
  0. ref: python-doc
  1. Type and Flow
  2. Function and Module
  3. All Built-in Words
  4. Test
  5. Benchmark
  6. Out of Memory
=== outer ref
latex alternative, open source, instant preview, binary cli or online web app

== 1000 month icon
show growth on one paper (A4)
== PDF-Decorating: Web Elements to PDF
event: click, hold, drag, hover, scroll, swipe, type, combine keys
interact:
- navigate: menu, link, button, toggle, pop-up
- form: type box, select dropdown
- media: video, audio clip, image gallery
- respond: slider, carousel, infographic
- feedback: confirmation, error message
- 3d hover or scroll effect
- fuzzy, fade
- social media share
- part page, block area
- quizze
- game
- tutorial
- data collect and statistics, page view, click path
- survey
- chatbot
- customer support
- user gened content
- product demo and try-on
- playful element: bubble, stress ball, spring
- seamless animation and eye-catching visuals
- webpage interaction pattern: F, L
- website interaction flow, user move through
- immerse
- moving object in (background) video
- left/right scroll
- music wave bar par
- geographical map
- like or dislike
- poll
- sign up/in, purchase
chat room with scientist and conquer concept city and field kingdom

avatar, github repo card/mainpage, comment area, gif2frame,
music/movie player buttons/pars, search box, editor card

website:
- social media app: profile, chat room, post column
- blog, news
- e-learning portal
- storytelling site
- online forum
- git repo host
- video website
- photo website
- music website
- shopping mall

== Web-ish cornell note taking template
auto cross-ref, tag, comment area

= PDF and Typst
== Autoly Combine Chapters into a Book
== How Typst Date Function Record Every Time, such as blogs
== table without `[]`
```typ
#let pd-table(it) = {
  vec = regex(it).split
  t = table()
  for elm in vec {
    t.push(elm)}
  return t}
```
== tree/net table of contents of a book
== test: png2gif to see diff
== list item symbol axis
```py
v = typst.version
if v in (0.12.0, 0.14.*),
else if v >= 0.15.0
else  # v < 0.12.0
```
or show item symbol as none?
== html fold block in typst/universe
```md
---
<details>
  <summary>fold</summary>
  block
</details>

---
```

$ "Typst" = "Markdown\nSyntax" + #{move(dy:-0.67em, "LaTeX\nQuality")} + "Office\nWYSIWYG" $

= Idea
== Road as Mirror at Night
== Shape without Spray
In diving games, less spray more score. For a rigid object, what shape will get best score?
