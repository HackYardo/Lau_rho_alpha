= a Tiny Typst Tutorial

= from official tutorial
text
= Heading
+ numbered
+ list
  - unnumbered
  - list
#figure(image("path/to/i.png", width:60%), caption:[see _i.png_])<i>
See @i
// Enter/Exit a mode: # [] $$
// Which are referenceable?
//   must numbering?
/* content type, string type:
  content can be string, or function call, markup, etc, but in contrast not*/
@one-title-of-bib-work
#bibliography("works.bib")
$inline math sum_(delta=0)^nabla alpha/vec(epsilon, a_i, b_2)$
$ block math "some string" $
// math functions -> ref/math
// math notations -> ref/sym

#text(font:"New Computer Modern")[
  = Heading
  text]
#set text(font:"New Computer Modern")  // set func default value for later call
= Heading
text
/* ref/func: which are settable
text: font, size, color
page: size, margin, column, header, footer
par: justify, line space
heading: appearance, numbering
document: metadata, e.g. title, author*/
#set page(paper:"a4", margin:(x:1.8cm, y:1.6cm))
#set text(font:"New Computer Modern", sizeL10pt)
#set par(justify:true, leading:0.6em)
#set heading(numbering:"1.a")
= lorem
== #lorem(6)
#align(center+bottom)[
  #image()
  *bold* roman _italic_]
`= h == #heading[h]`
#show "artosflow": x => {
  box(image("af.svg", height:0.6em))
  x}
here is artosflow

conference guideline:
- font: serif 11pt
- title: bold 17pt
- paper:us-letter center-num-footer top-right-title-herder
  single-column abstract, two-column main text
- center abstract
- main text justify
- heading
  - lv1: 13pt center small-capital
  - lv2: run-in italic 11pt
#page(paper:"us-letter", numbering:"1", header:align(right)[this is a header])
#par(columns:2, justify:true)
#text(font:"Libertinus Serif", size:11pt)
#show heading.where(level:1): set text(size:13pt, )
#show title: {set text(size:17pt); set align(center); set block(below:1.2em)}
#title[This is a Title]
#grid(columns:(1fr,)*2,
  align(center)[First Author\ Institute\ #link("mailto:first@inst.itute")],
  align(center)[Second Author\ Institute\ #link("mailto:second@inst.itute")])
#align(center)[
  #set par(justify:false)
  *Abstract*\
  #lorem(12)]  // set in [content block] not affect otter, i.e. other contents
#place()[this is abstract]
#lorem(36)

== Introduce

=== Short Example

== Mode

=== Set/Show Rule

=== Markup

=== Math Equation

=== Code and Function

== Long Example

== API
