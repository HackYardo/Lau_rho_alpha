#show link: underline
#show link: l => [#set text(blue); #l]

#show quote: q => par()[#box()[
	#box(rect(width:5pt, height:12pt, fill:gray))
	#q]]

#show raw.where(block:false, lang:"py"): block.with(
	fill: luma(240),
	inset: (x:3pt, y:0pt),
	outset: (y:3pt),
	radius: 2pt,)
#show raw.where(block:true, lang:"py"): block.with(
	fill:luma(240), 
	inset:10pt, 
	radius:4pt,)

= Markdown

Markdown is a fast way to style text. For example:

#table(
  columns: (10em, 12.5em, 15em),
  align: left+horizon,
  table.header([*Result*], [*Method A*], [*Method B*]),
  [plain text], [plain text],[],
  [_italic_], [\*italic\*], [\_italic\_],
  [*BOLD*], [\*\*BOLD\*\*], [\_\_BOLD\_\_],
  [= Heading 1], [\# Heading 1], [Heading 1\ \=\=\=],
  [== Heading 2], [\#\# Heading 2], [Heading 2\ \-\-\-],
  [=== Heading 3 (up to 6)], [\#\#\# Heading 3 (up to 6)], [],
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
  [#quote[Blockquote??]], [> Blockquote], [],
  [```py Inline Code```], [\`Inline Code\`], [],
  [```py
   # Block Code
   print("Hi~")```], [\`\`\`py\
   \# Block Code\
   print(\"Hi\~\")\
   \`\`\`], [```
       # Block Code
       print("Hi~")
       # 4 spaces before
   ```],
  [#link("https://w.com")[Link]], [`[Link](https://w.com)`], [```
   [Link][1]
   [1]: https://w.com```],
  [#link("https://w.com")], [`<https://w.com>`], [],
  [#image("commonmark.png", width:2em)], [`![Image](commonmark.png)`], [```
   ![Image][2]
   [2]: commonmark.png "Creative Commons licensed"```],
  [#line(length:100%)], [\-\-\-], [\*\*\*])


