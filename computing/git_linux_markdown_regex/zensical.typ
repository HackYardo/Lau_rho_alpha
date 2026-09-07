#import "@preview/pdf-decorating:0.1.1": *

#show: cm-raw; #show: gm-heading
#set page(columns:2)

= Zensical
It's a markdown to html compiler and use python markdown syntax.
Compare to CommonMark, its unique syntax:

1. icon in toc (rocket show in toc (#emoji.rocket Get started) but not page):
```md
---
icon: lucide/rocket
---

# Get started
```
2. admonitions: note abstract info tip success question warning failure danger bug example quote
```md
!!! note

    This is a **note** admonition.
```
3. details summary
```md
??? info "Click to expand for more info"

    Default close, `???+` to default open.
    Great for FAQs or long explanations.
```
4. tab group
#raw("=== \"Python\"

    ``` python
    print(\"Hello from Python!\")
    ```

=== \"Rust\"

    ``` rs
    println!(\"Hello from Rust!\");
    ```")
5. code
  - inline with syntax highlight ``` `#!python print("Hello, Python!")` ```
  - block
    - default with copy button and hover highlight line button
    - can set highlight line
    - can ref content in comment
#raw("``` python hl_lines=\"2\" title=\"Code blocks\"
def greet(name):
    print(f\"Hello, {name}!\") # (1)!

greet(\"Python\")
```

1.  > Go to [documentation](https://zensical.org/docs/authoring/code-blocks/#code-annotations)

    Code annotations allow to attach notes to lines of code.")
6. diagrams
#raw("``` mermaid
graph LR
  A[Start] --> B{Error?};
  B -->|Yes| C[Hmm...];
  C --> D[Debug];
  D --> B;
  B ---->|No| E[Yay!];
```")
7. github-ish:
 - footnote with hover info
 - icon and emoji, :sparkles: :rocket: :tada: :memo: :eyes:
 - task list
 - table
 - line break by end 2 spaces or a blank line
 - nest quote with >>
8. tooltip (hover info) with anchor, hover title with link or image
```
[Hover me][example]

  [example]: https://example.com "I'm a tooltip!"

[Link with title](https://example.com "Hover title")
![Image with title](image.jpg "Image title")
```
9. formatting
```
- ==This was marked (highlight)==
- ^^This was inserted (underline)^^
- ~~This was deleted (strikethrough)~~
- H~2~O sub script
- A^T^A up script
- ++ctrl+alt+del++ keyboard key
```
#set page(columns:1)
10. mathjax
```css
$$
\cos x=\sum_{k=0}^{\infty}\frac{(-1)^k}{(2k)!}x^{2k}
$$

!!! warning "Needs configuration"
    Note that MathJax is included via a `script` tag on this page and is not
    configured in the generated default configuration to avoid including it
    in a pages that do not need it. See the documentation for details on how
    to configure it on all your pages if they are more Maths-heavy than these
    simple starter pages.

<script id="MathJax-script" src="https://unpkg.com/mathjax@3/es5/tex-mml-chtml.js"></script>
<script>
  window.MathJax = {
    tex: {
      inlineMath: [["\\(", "\\)"]],
      displayMath: [["\\[", "\\]"]],
      processEscapes: true,
      processEnvironments: true
    },
    options: {
      ignoreHtmlClass: ".*|",
      processHtmlClass: "arithmatex"
    }
  };

  document$.subscribe(() => {
    MathJax.startup.output.clearCache()
    MathJax.typesetClear()
    MathJax.texReset()
    MathJax.typesetPromise()
  })
</script>
```
