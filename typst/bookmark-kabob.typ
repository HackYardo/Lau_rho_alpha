#!/usr/bin/env -S typst c
/* font: "New Computer Modern Math"
optional, Typst CLI built-in

all unicode: (0, 10ffff)
invalid unicode: (d800, dfff)
private use area: (e000, f8ff)

r, b, i = roman, bold, italic
u, l = uppercase, lowercase

English b i bi letters: 0x1d5d4, 0x1d66f

Greek b i bi letters: 0x1d6a8, 0x1d74f

Arabic b numbers: 0x1d7ce, 0x1d7d7

unicode data
language: (
  r u range,
  r l range,
  b start, diff of u l move to r,
  b i bi switch length, b u length) */

#let D = (
  en: (
    0x41, 0x5b,
    0x61, 0x7b,
    0x1d5d4, 6,
    52, 26),
  el: (
    0x391, 0x3aa,
    0x3b1, 0x3ca,
    0x1d6a8, 6,
    58, 26),
  ar: (
    0x30, 0x3a,
    0x00, 0x00,
    0x1d7ce, 0x00,
    0x00, 0x00))

#let style(string, b-i) = {
  let new = ""
  let hex = 0x00
  for chr in string {
    hex = str.to-unicode(chr)
    if hex in range(0x61, 0x7b) {
      new = new + str.from-unicode(hex + 0x1d5d4 - 0x41 + 52 * b-i - 6)}
    else if hex in range(0x41, 0x5b) {
      new = new + str.from-unicode(hex + 0x1d5d4 - 0x41 + 52 * b-i)}
    else if hex in range(0x391, 0x3aa) {
      new = new + str.from-unicode(hex + 0x1d6a8 - 0x391 + 58 * b-i)}
    else if hex in range(0x3b1, 0x3ca) {
      new = new + str.from-unicode(hex + 0x1d6a8 - 0x391 + 58 * b-i - 6)}
    else if hex in range(0x30, 0x3a) and b-i != 0x01 {
      new = new + str.from-unicode(hex + 0x1d7ce - 0x30)}
    else {
      new = new + chr}}
  return new}

#let kabob(string) = {
  let i = string.at(0)
  let j = string.at(1)
  let string = string.trim(regex("[*_]"), at:start)
  if i + j in "_*_" {
    strong(emph(style(string, 0x02)))}
  else if i == "_" {
    emph(style(string, 0x01))}
  else if i == "*" {
    strong(style(string, 0x00))}
  else {
    string}}

#let ascii(chr) = {
  let hex = str.to-unicode(chr)
  if hex in range(0x1d5d4, 0x1d670) {
    hex = hex + 1 - 0x1d5d4
    let quo = calc.quo(hex, 52)
    let u-l = calc.quo(calc.rem(hex, 52), 26)
    hex = hex - quo * 52 + u-l * 6 + 0x41 -1}
  else if hex in range(0x1d6a8, 0x1d74f) {
    hex = hex + 1 - 0x1d6a8
    let quo = calc.quo(hex, 58)
    let u-l = calc.quo(calc.rem(hex, 58), 26)
    hex = hex - quo * 58 + u-l * 6 + 0x391 -1}
  else if hex in range(0x1d7ce, 0x1d7d8) {
    hex = hex - 0x1d7ce + 0x30}
  else {hex = hex + 0}
  return str.from-unicode(hex)}

#let bobak(compose) = {
  let all = "[\u{1d5d4}-\u{1d7ff}]"
  show heading: h => {
    show regex(all): r => ascii(r.text)
    h}
  show outline.entry: e => {
    show regex(all): r => ascii(r.text)
    e}
  compose}

#show: bobak  // take outline and heading back home

#outline()

= #kabob("*Part I: Markdown")
= Chapter 1. CommonMark
= #kabob("_Chapter 2. HTML, CSS")

= #kabob("*Part II: Programming")
= Chapter 3. Python
= Chapter 4. #kabob("_POSIX Shell")

= #kabob("*Μερος Γ: ΠΔΦ")
= Κεφαλαιο 5. ΛαΤεΧ
= #kabob("*_Κεφαλαιο 6.") #kabob("*Τγρςτ")

bookmark-kabob: Bold and italic heading styles in PDF readers' bookmarks.
1. When reading e-books, bookmarks of PDF viewers are more useful than outlines (Tables of Contents), which can't float and are on some constant PDF pages. 
2. If too many headings to read, it would be better to style them. 
3. However, the bold or italic styles in outlines are not in sync with bookmarks'.

That's the blank this package fills in.

clarify outline toc | utility book \
//<hr />
Usage with ?eg.png | Status | Test | LICENSE
//---

- Tricky math forms used, only English Sans and Greek Serif letters usable.
- The package is font-independent, just pick the fonts you favor.
- Why "str" rather than \[content\]?
  - Strings don't disturb external functions or show rules.
- Why `_*Some Heading*_` won't be bold-italic in bookmarks (e.g. Document outline of PDF.js)?
  - Bookmarks can't be changed by Typst's emph(), strong(), show emph, etc.
- Why `#show: bobak`?
  - Outline and heading, as well as bookmark, be changed by `kabob()`, bobak takes them back home.
