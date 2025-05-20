/*Three Templates: CommonMark, GitHub Markup, Jupyter MyST
- These templates try to be concise and direct.
- Only Typst itself is used, and values as default as possible.

The CommonMark Template:
(Source: https://commonmark.org/help/)
- All links/anchors are underlined and blue;
- Every block/inline code is inside a gray rectangle;
- Every block quote is indented and a gray bar at the left.

The GitHub Markup Template:
(Source: https://docs.github.com/en/get-started/writing-on-github/)
- All features of the CommonMark template;
- Every heading is underlined with a 100% width gray line;
- All headings have Auto Anchors;
- Alarts: Note, Tip, Important, Warning, Caution;
- Color Dots;
- Task Lists;

Bootstrap:
- Accordion, Button Group, Navs & Tabs, Pagination, Progress
- Alerts
- Card
- Dialog, Toast
- Offcanvas
- Validation*/

/*------------ Fix: heading() demos break Table of Contents ------------*/
// heading_ignore(level, heading)
#let headingi(l, h) = heading(outlined:false, bookmarked:false, level:l, h)
/* height = 0pt actually, breaks ToC structure, so fake instead*/
// heading_fake(level, heading)
#let headingf(l, h) = text(1.6em-l*0.2em, weight:"bold", h)

/*------------ the CommonMark template ------------*/
#let commonmark(compose) = {
  set par(justify: true)

  show link: l => text(blue, underline(l))
  show ref: r => text(blue, underline(r))

  show raw.where(block:false): box.with(
    fill: luma(240),
    inset: (x:3pt, y:0pt),
    outset: (y:3pt),
    radius: 2pt,)
  show raw.where(block:true, lang:regex("(perl)")): block.with(
    fill:luma(240),
    inset:10pt,
    radius:4pt,)

  compose}

// commonmark quote(attribution, sentence)
#let cm_quote(a:none, s) = box(rect(
  stroke: (left: 0.5em + luma(240)),
  quote(block:true, quotes:false, attribution:a, s)))

// unicode emoji characters for Git, see also `git.typ`
#let chars_git = (
  [\u{1f389}], [\u{1f381}], [\u{1f4dc}],
  [\u{1f48E}], [\u{26a1}], [\u{1f3a8}], [\u{1f426}],
  [\u{1f41b}], [\u{1f41c}], [\u{1fAB0}], [\u{1f41d}], [\u{1f6f8}])
// unicode emoji characters for GitHub
#let chars = (
  [\u{f05a}], [\u{f0eb}], [\u{f11e}], [\u{f071}], [\u{f06a}],
  [\u{1f680}], [\u{270c}], [\u{1f440}], [\u{1f44d}],[\u{1f3c6}],
  [\u{1f3a8}], [\u{26a1}], [\u{1f99c}], [\u{1f916}], [...],
  [\u{f14a}], [\u{f096}])

/*------------ the GitHub Markup template ------------*/
#let github_markup(compose) = {
  show: commonmark.with()

  set heading(numbering: "I.i")
  show heading: h => rect(height:1.2em, width:100%, inset:0pt,
    stroke:(bottom:0.5pt+luma(220)), h.body)

  show regex("(@User)"): r => link("http://gh.c/", text(black, underline([*#r*])))
  show regex("(\[x\])"): text(blue, chars.at(-2))
  show regex("(\[ \])"): text(blue, chars.at(-1))

  compose}

// alert(index, info)
#let colrs = (blue, olive, purple, orange, red)
#let symls = chars.slice(0,5)
#let kinds = ([Note], [Tip], [Important], [Warning], [Caution])
#let gm_alert(index, info) = {
  let colr = colrs.at(index)
  let titl = text(colr, [#symls.at(index) #kinds.at(index)])
  box(rect(
    stroke:(left: 0.2em + colr),
    quote(block:true, quotes:false, [#titl\ #info])))}

#let done = text(blue, chars.at(-2))
#let plan = chars.at(-1)

// color_dot(color, model)
#let gm_colordot(c, m:"hex") = {
  rect(fill:luma(240))[
    #if m == "rgb" [
      rgb#[#c.components(alpha:false).map(i => int(i*2.55/1%))].text
    ] else if m == "hsl" [hsl#[#c.components(alpha:false)].text
    ] else [#c.to-hex()]
    #box(circle(radius:0.3em, fill:c))]}

// commit(checksum)
#let gm_commit(c) = box(rect(inset:2pt, fill:luma(240),
  underline(text(blue, c))))

// call(user)
#let gm_call(u) = box(rect(inset:2.5pt,
  stroke:(bottom:0.5pt+luma(0)), text(black, [*\@**#u*])))
