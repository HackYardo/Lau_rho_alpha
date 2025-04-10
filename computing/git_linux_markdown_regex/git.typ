#outline()
= Git
== Init
```sh
mkdir project
cd project/
touch readme.md
# edit readme.md
git init
git add -a
git commit -m "first commit"
```
== Local to Remote
```sh
# create a new repo at GitHub
# without readme, license or gitignore files
git remote add origin git@github.com:user/repo.git
git remote -v
git push
```
== Remote to Local
```sh
git clone git@github.com:user/repo.git
```
== Daily Use
```sh
# edit files @local
git add -A
git commit -m "some words"
git push
# edit files @remote
git pull
```
= SSH
== Generating a new SSH key
```sh
ssh-keygen -t ed25519 -C ""
> Generating public/private ALGORITHM key pair.
> Enter a file in which to save the key (/home/YOU/.ssh/id_ALGORITHM):[Press enter]
> Enter passphrase (empty for no passphrase): [Type a passphrase]
> Enter same passphrase again: [Type passphrase again]
```
== Adding your SSH key to the ssh-agent
```sh
eval "$(ssh-agent -s)"
> Agent pid 88888
ssh-add ~/.ssh/id_ed25519
```
== Adding a new SSH key to your GitHub account
```sh
cat ~/.ssh/id_ed25519.pub
```
Copy to GitHub => Settings => SSH and GPG keys
