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
# generate a (KEY.pub, KEY) pair
ssh-keygen -t ed25519 -C "e-Mail"
> Generating public/private key pair ...
# give GitHub the KEY.pub to authorize
cat ~/.ssh/id_ed25519.pub
#   copy => Settings => SSH and GPG keys
# use the same pair on a new device
#   archive to avoid permission too open
cd ~ && tar cpf Archive .ssh/
#   give new device by USB cable
#   extract to ~/, then delete
tar xpfC Archive ~/
shred -u Archive  # better than `rm`
```
= Git
```sh
sudo apt update
sudo apt install git-all
git --version; git -h
git Command -h  # e.g. git init -h
# the first 100 pages of "Pro Git 2nd"
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
# local to remote
# create a new repo at GitHub, optional:
#   readme, license or .gitignore files
git remote add origin \
  git@github.com:User/Repo.git
git remote -v;
git push -u; git branch -vva
# remote to local
git clone git@github.com:User/Repo.git
```
== Daily Use
```sh
# edit File at local
git status; git diff
# when too long:
#   space/b to next/pre page, q to quit
git add -u; git status
git commit -m 'Info'; git log -p -1
git push; git status; git log -3
# edit File at remote
git fetch  # download not merge
git pull  # download and merge
```
== Ignore, Delete, Move, Check
```sh
/a.pdf # ignore a.pdf by Repo/.gitignore
*.pdf  # ig all pdfs
!b.pdf     # not ig b.pdf
A/         # ig the whole A/ folder
A/*.pdf    # ig all pdfs in A/ but A/B/
A/**/*.pdf # ig all pdfs in A/
git rm \*~ # delete all files end with ~
git mv File_from File_to  # move/rename
git diff --check  # check whitespace err
```
== Commit, Tag, Branch
```sh
git commit --amend  # recommit promptly
git tag v2.0 -m '' 0ac6 # tag commit0ac6
git push --tags  # push all tags
git tag -d v2.0  # delete tag at local
git push --delete v2.0 # del at remote
git branch issue10; git switch issue10
git push -u issue10
# handle issue10 and commit
git switch main && git merge issue10
git branch -d issue10
git push --delete issue10
```
== Alias
```sh
git config --global alias.changelog \
'log --pretty="%Cgreen%h %as %Creset%s"'
git config --global alias.countdiff \
"diff --stat 'HEAD@{since.2005}'"
git config --global alias.recent \
"diff --patch-with-stat 'HEAD~1...HEAD'"
nano ~/.gitconfig
[alias]
  last = log -p -1
  graph = log --pretty=\"%h %s\" --graph
# to use a git alias, e.g.
git changelog
git changelog File
```
= SSH to Verify
+ generate a (KEY.pub, KEY) pair;
+ add to GitHub *as a sign key*;
+ enable vigilant mode: Settings => SSH and GPG keys => Flag unsigned commits as unverified
+ enable commit/tag sign in Git (each line of signers is e-Mail KEY.pub):
```sh
nano ~/.gitconfig
[user]
  ...
  signingkey = .ssh/id_ed25519.pub
[commit]
  gpgsign = true
[tag]
  gpgSign = true
[gpg]
  format = ssh
[gpg.ssh]
  allowedSignersFile = .ssh/signers
```
