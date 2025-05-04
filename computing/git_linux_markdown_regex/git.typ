#set page(columns:3, flipped:true)//height:21.0cm, width:29.7cm)
#set par(justify:true)
#show heading: h => rect(
	height:1.2em, width:100%, stroke:(bottom:0.5pt+luma(220)), inset:0pt, h)

= Keep E-mail Secret
` GitHub provides noreply e-mails that can be used in SSH keys or Git Commits. To get one: GitHub Setting => Emails => Keep my email email addresses private `
= SSH to Identify
+ Generate a Key
	```sh
	ssh-keygen -t ed25519 -C 'User@github.com'
	> Generating public/private ALGORITHM key pair.
	> Enter a file in which to save the key (/home/YOU/.ssh/id_ALGORITHM):[Press enter]
	> Enter passphrase (empty for no passphrase): [Type a passphrase]
	> Enter same passphrase again: [Type passphrase again]
	```
+ Add to Agent
	```sh
	eval "$(ssh-agent -s)"
	> Agent pid 88888
	ssh-add ~/.ssh/id_ed25519
	```
+ Add to GitHub
	```sh
	cat ~/.ssh/id_ed25519.pub
	# copy to => GitHub Settings => SSH and GPG keys
	```
- Use a New Device
	```sh
	# copy ~/.ssh/ to the new device ~/
	```
= Git
```sh
sudo apt install git-all
git --version
git -h
```
== Config
```sh
git config --global user.name=Name
git config --global user.email=Email
git config -l
git config --global -l
```
The Name and Email are for git commit. Any letters are valid, but be sure to #link("https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/managing-contribution-settings-on-your-profile/why-are-my-contributions-not-showing-up-on-my-profile#your-local-git-commit-email-isnt-connected-to-your-account")[inform] GitHub.
== Init
```sh
mkdir project
cd project/
touch readme.md
nano readme.md
# to quit nano: ctrl x => y => enter 
git init
git add -A
git commit -m 'init commit'
git status && git log
```
== Local to Remote
```sh
# create a new repo at GitHub, optional:
#   readme, license or gitignore files
git remote add origin git@github.com:User/Repo.git
git remote -v
git push
git branch -a
```
== Remote to Local
```sh
git clone git@github.com:User/Repo.git
git pull
git branch -a
```
== Daily Use
```sh
# edit File at local
git rm File  # delete File
git mv File_from File_to
# move or rename
git status && git diff
# when too long:
#`space` to next page, `q` to quit
git add -A
git commit -m 'info'
git status && git log -p -1
git push
git status && git log -3
# edit File at remote
git pull
```
== Aliases
```sh
git config --global alias.changelog 'log --date=short --pretty=format:"%h %ad %s"'
git config --global alias.graph 'log --pretty="%h %s" --graph'
git config --global alias.recent "diff --patch-with-stat 'HEAD~1...HEAD'"
git config --gloabl alias.last 'log -p -1'
git config --global alias.countline "diff --stat 'HEAD@{since.2005}'"
# to use a git alias, e.g.
git changelog
git changelog File
```
== Branch
== Commit: Undo, Modify, Delete, Merge, Emoji
```sh
git commit --amend
```
== Tagging
== Fetch Pull
