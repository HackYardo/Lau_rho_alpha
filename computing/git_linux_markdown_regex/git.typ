#set page(
	flipped:true,
	columns:3,
	header:[You Need the 3 things: Internet, GitHub account, Debian/Windows(WSL)/Android(Termux);\ You Know the 3 areas: Work(outside of Git), Add(buffer zone), Commit(log/push/fetch/merge/pull).])
#set par(justify:true)
#show heading: h => rect(
	height:1.2em, width:100%, stroke:(bottom:0.5pt+luma(220)), inset:0pt, h)

= Keep e-Mail Secret
`GitHub provides noreply e-mails that can use in SSH or Git. To get one: Settings => Emails => Keep my email address private`
= SSH to Identify
```sh
# Generate a (Key.pub, Key) Pair
ssh-keygen -t ed25519 -C "e-Mail"
> Generating public/private key pair ...
# Give GitHub the Key.pub to Authorize
cat ~/.ssh/id_ed25519.pub
#   copy => Settings => SSH and GPG keys
# Use the Same Pair on a New Device
#   archive to avoid permission too open
tar cpf Archive ~/.ssh/
#   give new Device by USB cable
#   extract to ~/, then delete
tar xpfC Archive ~/
shred -u Archive
```
= Git
```sh
sudo apt update
sudo apt install git-all
git --version; git -h
git Command -h  # e.g. git init -h
```
== Config
```sh
git config --global user.name 'Na Me'
git config --global user.email e-Mail
git config --global -l  # ~/.gitconfig
git config -l #global + Repo/.git/config
```
== New Repository and Initial Commit
```sh
git init -b main Repo && cd Repo/
touch File && nano File
# to quit nano: ctrl x => y => enter
git status; git add File; git status
git log; git commit -m 'Init'; git log
```
== Local and Remote
```sh
# Local to Remote
# create a new repo at GitHub, optional:
#   readme, license or .gitignore files
git remote add origin \
  git@github.com:User/Repo.git
git remote -v;
git push -u; git branch -a
# Remote to Local
git clone git@github.com:User/Repo.git
```
== Daily Use
```sh
# edit File at Local
git status; git diff
# when too long:
#   space/b to next/pre page, q to quit
git add -u; git status
git commit -m 'Info'
git status; git log -p -1
git push; git status; git log -3
# edit File at Remote
git fetch  # download not merge
git pull  # download and merge
```
== #link("https://github.com/github/gitignore", text(blue, [Ignore])), Move, Delete
```sh
/a.pdf      # ig a.pdf
*.pdf       # ig all pdfs
!b.pdf      # not ig b.pdf
A/          # ig the whole A/ folder
A/*.pdf     # ig all pdfs in A/ but A/B/
A/**/*.pdf  # ig all pdfs in A/
git mv File_from File_to  # move/rename
git rm File  # delete
```
== Commit, Tag, Branch
Undo, Modify, Delete, Merge, Emoji
```sh
git commit --amend
```
== Alias
```sh
git config --global alias.changelog \
'log --pretty="%h %as %s"'
git config --global alias.countline \
"diff --stat 'HEAD@{since.2005}'"
git config --global alias.recent \
"diff --patch-with-stat 'HEAD~1...HEAD'"
nano ~/.gitconfig
[alias]
	...
  last = log -p -1
  graph = log --pretty=\"%h %s\" --graph
# to use a git alias, e.g.
git changelog
git changelog File
```
= SSH to Verify
+ Generate a (Key.pub, Key) Pair;
+ And to GitHub *as a Sign Key*;
+ Enable Vigilant mode: Settings => SSH and GPG keys => Flag unsigned commits as unverified
+ Enable Commit/Tag Sign in Git:
```sh
git config --global commit.gpgsign true
git config --global tag.gpgsign true
git config --global gpg.format ssh
git config --global user.signingkey \
  .ssh/Key.pub
```
