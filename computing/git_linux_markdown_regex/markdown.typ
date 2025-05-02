#import color: rgb, hsl
#let done = emoji.checkmark.box
#let plan = emoji.square.green

#set par(justify: true)

#set heading(numbering: "I.i")
#show heading: h => {h.body}

#show link: l => {
  show link: underline
  set text(blue)
  l}

// quote_block(attribution, sentence)
#let qb(a:none, s) = box(rect(
  stroke: (left: 0.5em + luma(240)),
  quote(block:true, quotes:false, attribution:a, s)))

#show raw.where(block:false, lang:"py"): block.with(
	fill: luma(240),
	inset: (x:3pt, y:0pt),
	outset: (y:3pt),
	radius: 2pt,)
#show raw.where(block:true, lang:"perl"): block.with(
	fill:luma(240), 
	inset:10pt, 
	radius:4pt,)
#show raw.where(block:true, lang:"sh"): block.with(
  fill:luma(240),
  inset:10pt,
  radius:4pt,)

// heading_ignore(heading, level)
#let hi(h, l) = {heading(outlined:false, bookmarked:false, level:l)[#h]}
/* height = 0pt in outline() or PDF bookmark actually, does not understand the structure of ToC, so u'd better use a fake heading instead*/
// heading_fake(heading, level)
#let hf(h, l) = {text(1.6em-l*0.2em, weight:"bold")[#h]}

// color_point(color, model)
#let cp(c, m:"hex") = {
  rect(fill:luma(240))[
    #if m == "rgb" [rgb#[#c.components(alpha:false).map(i => int(i*2.55/1%))].text
    ] else if m == "hsl" [hsl#[#c.components(alpha:false)].text
      ] else [#c.to-hex()]
    #box()[
      #circle(radius:0.3em, fill:c)]]}

= Markdown

Markdown is a plain text syntax to write single-page, single-column, left-align Web documents. With several symbols, Markdown marks up italic, bold, heading, list, link, image, etc. John Gruber and Aaron Swartz created the #link("https://daringfireball.net/projects/markdown/syntax")[syntax] and a Perl #link("https://daringfireball.net/projects/downloads/Markdown_1.0.1.zip")[script] for text-to-HTML conversion in 2004.

== CommonMark

In 2014, a group of Markdown fans _(John MacFarlane of *Pandoc*, David Greenspan of *Meteor*, Vicent Marti of *GitHub*, Neil Williams of *Reddit*, Benjamin Dumke-von der Ehe of *Stack Overflow / Stack Exchange*, Jeff Atwood of *Discourse*)_ started the CommonMark, a strongly defined, highly compatible specification of Markdown that available in many Web sites. Its C #link("https://github.com/commonmark/cmark")[script] and #link("https://commonmark.org/help/")[syntax]:

#table(
  columns: (10em, 13em, 15em),
  align: left+horizon,
  table.header([*Result*], [*Method A*], [*Method B*]),
  [text], [text],[],
  [_italic_], [\*italic\*], [\_italic\_],
  [*BOLD*], [\*\*BOLD\*\*], [\_\_BOLD\_\_],
  [#hf([Heading 1], 1)], [\# Heading 1], [Heading 1\ \=\=\=],
  [#hf([Heading 2], 2)], [\#\# Heading 2], [Heading 2\ \-\-\-],
  [#hf([Heading 3, (up to 6)], 3)], [\#\#\# Heading 3 (up to 6)], [],
  [+ Numbered\ 
   + List], [```md 
   1. Numbered
   2. List```], [```md 
   1) Numbered
   2) List```],
  [- Bullet\
   - List],[```md
   * Bullet
   * List```],[```md
   - Bullet
   - List```],
  [+ Nested\
     - List], [```md
   1. Nested
     - List```], [```md
   1) Nested
     * List```],
  [#qb()[Block Quote]], [`> Block Quote`], [],
  [```py Inline Code```], [\`Inline Code\`], [],
  [```perl
   # Block Code
   print "Hello?"```], [\`\`\`perl\
   \# Block Code\
   print \"Hello?\"\
   \`\`\`], [\~\~\~perl\
   \# Block Code\
   print \"Hello?\"\
   \~\~\~],
  [#link("https://w.com")[Link]], [`[Link](https://w.com)`], [```
   [Link][1]
   [1]: https://w.com```],
  [https://w.com], [`<https://w.com>`], [],
  [#link("https://github.com/dcurtis/markdown-mark#license")[#image("i.png", width:2em)]], [`![Image](i.png "CC0 1.0")`], [```
   ![Image][2]
   [2]: i.png "CC0 1.0"```],
  [#line(length:100%)], [\-\-\-], [\*\*\*],
  [#link(<c-a>)[Custom Anchor]<c-a>], [`<a name="c-a"></a>`\ `[Custom Anchor](#c-a)`], [],
  [\# Symbol Escape], [`\# Symbol Escape`], [],
  [Next\ Line], [`Next\ Line`], [])

== GitHub Markup

GitHub is a popular remote server for Git repositories. To write at GitHub with more ease, they extend CommonMark by tables, task lists, alarts, etc. Its Ruby #link("https://github.com/github/markup")[script] and #link("https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax")[syntax]:

#table(columns:3, align:left+horizon,
  [#strike[strikethrough]], [`~strikethrough~`], [`~~strikethrough~~`],
  [#cp(rgb("#0969DA"))], [\``#0969DA`\`], [],
  [#cp(rgb(9,105,218), m:"rgb")], [\``rgb(9,105,218)`\`], [],
  [#cp(hsl(212deg,92%,45%), m:"hsl")], [\``hsl(212,92%,45%)`\`], [],
  [Section Link??], [`[Section Link](#github-markup)`], [],
  [foot#footnote[note]], [`foot[^1]`\ `[^1]: note`], [],
  [#done Task\ #plan List??], [`- [x] Task`\ `- [ ] List`], [],
  [], [`#issue_or_pullRequests`, `commit`,\  `@people_or_team`, `:emoji:`], [],)

== HTML

#link("https://developer.mozilla.org/en-US/docs/Web/HTML")[HyperText Markup Language] is the bricks to structure Web sites. By a browser, e.g. Firefox or Yandex, one can download a Web page as a .html file or view a .html file as a Web page. HTML uses many `<tag> </tag>` to marks up headings, paragraphs, links, etc. *HTML tags can be used in Markdown.* Some useful ones:

#table(columns:2, align:left+horizon,
  [], [`<!-- comment -->`],
  [#underline[underline]], [`<ins> underline </ins>`],
  [#super[super]script], [`<sup> super </sup> script`],
  [#sub[sub]script], [`<sub> sub </sub> script`],)

A bit troublesome, isn't it? *Markdown is exactly the simplification of HTML!* If you haven't downloaded the Perl script, let's try:

```sh
wget https://daringfireball.net/projects/downloads/Markdown_1.0.1.zip
unzip Markdown_1.0.1.zip
cd Markdown_1.0.1/
./Markdown.pl 'Markdown Readme.text' > mr.html
firefox mr.html
```

== Glossary

/ plain text: characters that only from computer keyboard; #link("https://www.asciitable.com/")[ASCII] characters
/ #link("https://www.perl.org/")[Perl], #link("https://www.c-language.org/about")[C], #link("https://www.ruby-lang.org/")[Ruby]: programming language
/ #link("https://git-scm.com/")[Git]: a tiny and fast distributed version control system with features like cheap local branching, convenient staging areas, and multiple workflows
