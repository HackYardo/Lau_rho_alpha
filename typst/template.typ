#let rainbows(compose) = {
    set text(fill:gradient.linear(..color.map.rainbow))
    box(compose)}

```typ #show label("g"): set text(green)```
#let c(color, t) = {set text(color); t}

/*The report will of course have to comply with the conference's style guide.
- The font should be an 11pt serif font
- The title should be in 17pt and bold
- The paper contains a single-column abstract and two-column main text
- The abstract should be centered
- The main text should be justified
- First level section headings should be 13pt, centered, and rendered in small capitals
- Second level headings are run-ins, italicized and have the same size as the body text
- Finally, the pages should be US letter sized, numbered in the center of the footer and the top right corner of each page should contain the title of the paper*/
#let us_letter(
    paperSize: "us-letter",
    headnote: none,
    footnote: "1 of 1",
    title: none, 
    authors: (), 
    abstract: [], 
    kw: none, 
    compose,) = {
set page(
  paper: paperSize,
  header: align(right+horizon, [#headnote]),
  columns: 2,
  numbering: footnote,)
set par(justify: true)
set text(font: "Libertinus Serif", size: 11pt,)
set heading(numbering:"I.a")
set math.equation(numbering:"(1)")

show link: underline
show regex("(Equation)\s\d+"): set text(blue)
show heading.where(level:1): h => block(width:100%)[
    #set align(center)
    #set text(13pt, weight:"regular")
    #smallcaps(h.body)] /*.title .number .level*/
show heading.where(level:2): h => text(
    size:11pt, weight:"regular", style:"italic", h.body+[.])

let authorNum = authors.len()
let columnNum = calc.min(authorNum, 3)

place(top+center, float:true, scope:"parent", clearance:1em,)[
#text(17pt, title)
#grid(
  columns:(1fr,) * columnNum,
  ..authors.map(author => [
    *#author.name*\
    #author.prof\
    #author.link]))
#par(justify:false)[
    *Abstract*\
    #abstract]
#align(left)[*Key words:* #kw]]
compose}
