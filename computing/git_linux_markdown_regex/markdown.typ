#import "templateMarkdown.typ": github_markup, headingf, cm_quote, gm_colordot, gm_commit, gm_call, gm_alert, done, plan, chars
#import color: rgb, hsl

#show: github_markup.with()

= Markdown

Markdown is a plain text syntax to write single-page, single-column, left-align Web documents. With several symbols, Markdown marks italic, bold, heading, list, link, image, etc. John Gruber and Aaron Swartz created the #link("https://daringfireball.net/projects/markdown/syntax")[syntax] and the Perl #link("https://daringfireball.net/projects/downloads/Markdown_1.0.1.zip")[code] for text-to-HTML conversion in 2004.

== CommonMark

In 2014, a group of Markdown fans _(John MacFarlane of *Pandoc*, David Greenspan of *Meteor*, Vicent Marti of *GitHub*, Neil Williams of *Reddit*, Benjamin Dumke-von der Ehe of *Stack Overflow / Stack Exchange*, Jeff Atwood of *Discourse*)_ started the CommonMark, a specification of Markdown that available in many Web sites. Its C #link("https://github.com/commonmark/cmark")[code] and #link("https://commonmark.org/help/")[syntax]:

#table(columns:(10em,12em,10em), align:left+horizon,
  table.header([*Result*], [*Method A*], [*Method B*]),

  [roman], [roman],[],
  [_italic_], [\*italic\*], [\_italic\_],
  [*BOLD*], [\*\*BOLD\*\*], [\_\_BOLD\_\_],

  [#headingf(1)[Heading 1]], [\# Heading 1], [Heading 1\ ===],
  [#headingf(2)[Heading 2]], [\#\# Heading 2], [Heading 2\ \-\-\-],
  [#headingf(3)[Heading 3 (up to 6)]], [\#\#\# Heading 3 (up to 6)], [],

  [+ Numbered\
   + List],
  [\1.#str("  ")Numbered\ \2.#str("  ")List],
  [1)#str("  ")Numbered\ 2)#str("  ")List],

  [- Bullet\
   - List],
  [\*#str("  ")Bullet\ \*#str("  ")List],
  [\-#str("  ")Bullet\ \-#str("  ")List],

  [+ Nested\
     - List],
  [\1.#str("  ")Nested\ #str("    ")\*#str("  ")List],
  [1)#str("  ")Nested\ #str("    ")\-#str("  ")List],

  [#cm_quote()[Block Quote]], [>#str("  ")Block Quote], [],

  [`Inline Code`], [\`Inline Code\`], [],

  [```perl
   # Block Code
   print "Hello?"```],
  [\`\`\`perl\ \# Block Code\ print \"Hello?\"\ \`\`\`],
  [\~\~\~perl\ \# Block Code\ print \"Hello?\"\ \~\~\~],

  [#link("https://w.com")[Link]],
  [[Link](#str("https://w.com"))],
  [[Link][1]\ [1]: #str("https://w.com")],

  [https://w.com], [#str("<https://w.com>")], [],

  [#link("https://github.com/dcurtis/markdown-mark#license", image("i.png", width:2em))],
  [#str("![Image](i.png \"CC0 1.0\")")],
  [#str("![Image][2]")\ #str("[2]: i.png \"CC0 1.0\"")],

  [#line(length:100%)], [\-\-\-], [\*\*\*],

  [#link(<c-a>)[Custom Anchor]<c-a>],
  [#str("<a name=\"c-a\"></a>")\ #str("[Custom Anchor](#c-a)")], [],

  [\# Symbol Escape], [\\\# Symbol Escape], [],

  [Next\ Line], [Next\\ Line], [])

== GitHub Markup <g-m>

GitHub is a remote server for Git repositories and a hub to cooperate in writing code or share code. To write at GitHub with more ease, they extend CommonMark by unicode emoji, alert, color dot, table, task list, etc. Its Ruby #link("https://github.com/github/markup")[code] and #link("https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax")[syntax]:

#table(columns:3, align:left+horizon,
  grid(columns:8, ..chars.slice(5)),
  table.cell(colspan:2)[
  :rocket: :v: :eyes: :+1: :clap: :wave: :bird: :parrot:\
  :owl: :ant: :bee: :bug: :ufo: :robot: :magnet: :zap:\
  :fire: :tv: :comet: :star: :art: :tada: :trophy: :gem:],

  gm_alert(0)[Useful even skimming], [> [!NOTE]\ > Useful even skimming], [],
  gm_alert(1)[Helpful for better], [> [!TIP]\ > Helpful for better], [],
  gm_alert(2)[Key to achieve goal], [> [!IMPORTANT]\ > Key to achieve goal], [],
  gm_alert(3)[Problems to avoid], [> [!WARNING]\ > Problems to avoid], [],
  gm_alert(4)[Advice about risks], [> [!CAUTION]\ > Advice about risks], [],

  gm_colordot(rgb("#0969DA")), [\`\#0969DA\`], [],
  gm_colordot(rgb(9,105,218), m:"rgb"), [\`rgb(9,105,218)\`], [],
  gm_colordot(hsl(212deg,92%,45%), m:"hsl"), [\`hsl(212,92%,45%)\`], [],

  table(columns:3, align:(x,y)=>{
    if y == 0 {center
      } else if x == 1 {right
        } else if x == 2 {center
          } else {left}},
    [*Table*], [*right*], [*mid-align*], [0], [0], [0]),
  [| Table | right | mid-align |\
   | \- \- \- | \- \- \- : | : \- \- \- : |\
   | 0 | 0 | 0 |], [],
  
  link(<g-m>)[Auto Anchor],
  [[Auto Anchor](\#github-markup)], [],

  [foot#footnote[note]], [foot[^1]\ [^1]: note], [],

  table.cell(colspan:2)[#link("Issue24") or #link("PullRequest24") #gm_commit()[Commit0abc986] #gm_call()[User]],
  [\#24 0abc986 \@User],

  strike[strikethrough], [\~strikethrough\~], [\~\~strikethrough\~\~],

  [- #done Task\ 
   - #plan List], [\- [x] Task\ \- [ ] List], [\* [x] Task\ \* [ ] List])

== HTML

#link("https://developer.mozilla.org/en-US/docs/Web/HTML")[HyperText Markup Language] is the bricks to build Web sites. By a browser, e.g. Firefox or Yandex, one can download a Web page as a .html file or view a .html file as a Web page. HTML uses many ```html <tag> </tag>``` to marks headings, paragraphs, links, etc. *HTML tags can be used in Markdown.* Some useful ones:

#table(columns:2, align:left+horizon,
  [#underline[underline]], [\<ins\> underline \</ins\>],
  [], [\<!-- comment --\>],
  [#super[super]script], [\<sup\> super \</sup\> script],
  [#sub[sub]script], [\<sub\> sub \</sub\> script],
  [ Fold, Unfold\ Section],
  [\<details open\>\ \<summary\> Fold, Unfold \</summary\>\ Section\ \</details\>])

A bit troublesome, isn't it? *Markdown is exactly a simplification of HTML!* Markdown is the logs to build cabins to live in soon. If you haven't downloaded the Perl code, let's try:

```sh
wget https://daringfireball.net/projects/downloads/Markdown_1.0.1.zip
unzip Markdown_1.0.1.zip
cd Markdown_1.0.1/
./Markdown.pl 'Markdown Readme.text' > mr.html
firefox mr.html
```

== Glossary

/ plain text: characters that only from a computer keyboard(US); #link("https://www.asciitable.com/")[ASCII] characters
/ #link("https://www.perl.org/")[Perl], #link("https://www.c-language.org/about")[C], #link("https://www.ruby-lang.org/")[Ruby]: programming languages
/ #link("https://git-scm.com/")[Git]: a tiny and fast distributed version control system (DVCS) that takes a developing folder as a stream of snapshots for branching
/ repository: a folder that enables a VCS to manage files and their changes
/ unicode: the de facto standard for encoding all (150,000 or so) characters, e.g.\
 ```typ \u{61}\u{62}\u{66}\u{1f34e}\u{1f37a}\u{1f90c}``` => \u{61}\u{62}\u{66}\u{1f34e}\u{1f37a}\u{1f90c}
/ emoji: a subset of unicode that uses pictures to describe things or express emotions
/ issue: a bug report, feature request, layout advice, etc of a repository at GitHub
/ pull request: a request of merging branches at GitHub
/ commit: a snapshot of a Git repository
