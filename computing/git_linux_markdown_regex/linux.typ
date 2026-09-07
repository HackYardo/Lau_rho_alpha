#set page(flipped:false, columns:2)
#set par(justify:true, leading:0.5em, spacing:1em)
#set text(size:9pt)
#show heading: h => rect(
  height:1.2em, width:100%, stroke:(bottom:0.5pt+luma(220)), inset:0pt, h)

= Linux
== Intro, Distro, Install
*Operating System (OS) is the platform software that* run on computer, phone, pad, server, car navigator, home automation devices, etc. It *enables user to control hardware*, e.g. turn on/off wifi network, tune sound volume or screen luminance. The usual OS are Apple iOS/Mac, GNU/Linux Debian/Ubuntu/Arch/Fedora/Redhat/OpenSUSE, Google Android, Microsoft Windows.

#table(columns:5,
  [OS], [Desktop/Mobile], [Speed], [Users], [Price],
  [Apple iOS/Mac], [DM], [1], [design], [])

Some OS are ready to use, some are not. To use iOS, just buy their phone; to use Debian visually, you also need desktop software like GNU Gnome or KDE Plasma. As Debian is text only OS, no graphical user interface (GUI).

Web pages, multimedia images/songs/films and slide/sheet/word documents are common files no matter what OS is, but different OS has different structure and application software usually. So when you choose OS, make sure which OS your team, school or company use.

/ OS, operating system: example of plantform software
/ planform software: enable user to control hardware
/ desktop software: make text only OS visual
/ APP, application software: provide specialized features

== Most Common Files/Commands Tree View

== Path, Folder(Directory), File[Link]
- \~
- . 
- .. 
- \-
- \/
  - Start with
  - Middle
  - End with
```sh
cd ~/
pwd
ls
mkdir Folder/
cd Folder/
pwd
touch FileA FileB
ls
ls -ashbl
rm FileB
ls
cp FileA FileA2
ls
du -hd1
mv FileA2 FileC
ls
nano FileA
# write lines of sentences in nano...
# to quit nano: ctrl x => y => enter
cat FileA
more FileA
less FileA
wc FileA
cd ..
ls Folder/
ln Folder/FileA fileA
ln -s Folder/FileA fileA
ls -ashbl
cp -r Folder/ Folder_backup/
rm -r Folder/
mv Folder_backup/ Folder2/
ls
```
=== Permission
```sh
cd ~/
ls *.py
touch run.py
nano run.py
```
```py
#!/usr/bin/python3
# shebang to execute script like program
# must be first line of a script

# or current env python3:
##!/usr/bin/env python3

# with python3 cli optoins:
#!/usr/bin/env -S python3 -i

print("You typed: " + input("Please type: "))
```
```sh
python3 run.py
./run.py
chmod +x run.py
./run.py
chmod -x run.py
./run.py
```
=== Date, Size, ...
```sh
cd ~/
ls -ashbl
du -hd2 --exclude=*.pdf
```
== Source Mirror of Packages, Android Layer
```sh
cd /etc/apt/
cat sources.list
cd sources.list.d/
ls
apt  # manage standard?? package
apt-get
dpkg  # install third party pacakge
dnf  # apt of CentOS, Fedora, RHEL
rpm
yum
pacman
```
=== Android, Waydroid, Debian Backports
```sh
# add a new file /etc/apt/sources.list.d/debian-backports.sources
Types: deb deb-src
URIs: http://deb.debian.org/debian
Suites: trixie-backports
Components: main
Enabled: yes
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg

# run commands
sudo apt update
sudo apt install waydroid
```
== Packages: install, check, update, remove
```sh
# Git Version Control System
sudo apt install git-all
git -v

# gh, GitHub CLI
# install, valid, test

# IDLE, Integrated Development Environment for Python
sudo apt install python3-full
idle

# Firefox Web Browser
sudo apt install firefox-esr
firefox

# VLC Multimedia Player
sudo apt install vlc
vlc

# Rust Programming Language
$ curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
rustc --version

# Cargo, Build System and Package Manager of Rust
# ship with Rust
cargo --version

# Typst PDF Compiler
# as a package of rust-cargo
cargo install --locked typst-cli
typst -V
typst

# as itself
wget Typst.tar.xz  # from https://typst.app/open-source/#download
tar -xf Typst.tar.xz
cd Typst/
sudo ln -s path/to/Typst/typst /usr/local/bin/
typst -V
typst
```
```sh
# if xxx is intro by apt
sudo apt update -y
sudo apt full-upgrade

sudo apt remove xxx
sudo apt autoremove

# Rust
rustup update

rustup toolchain list
rustup toolchain uninstall xxx
rustup self uninstall

# Typst
# as a package of rust-cargo
cargo install --locked typst-cli
# as itself
typst update
```
== Font, Input Method, Dictionary
```sh
# Apply a Downloaded Font
cd /usr/share/fonts/
sudo mkdir download
cd download/
sudo wget 'https://.../xxx.ttf'
apt show fontconfig
fc-list  # or
typst fonts

# Fcitx5 Input Method
sudo apt install fcitx5
fcitx5-configtool

# GoldenDict-ng Dictionary Lookup Program
sudo apt install glodendict
goldendict

# Apply a Downloaded Dictionary
cd ~/Downloads/
mkdir dict
cd dict
wget 'https://.../xxx.mdx'
goldendict
  # Edit -> Dictionaries
    # Sources -> Files -> Add...
    # OK
```
== Python
=== Script
```sh
mkdir Script
cd Script/
touch script.py
nano script.py
```
```py
#!/usr/bin/env python3
```
```sh
python3 script.py  # or
cd ..
python3 Script/
```
=== Separate Folder (Virtual Environment)
```sh
mkdir Project
cd Project/
python3 -m venv .venv
source .venv/bin/activate
which python3  # .venv/bin/python3
python3 -m pip install PkgName
# do something
deactivate
which python3  # /usr/bin/ or /usr/local/bin/
```
= Bash
```sh
ls -p | grep -v /  # not list folders
find . -maxdepth 1 -type f  # only list files
# the above two maybe different
```
= How-to
== Globally Install Newer Python Beside APT Python
At Debian, python and its packages are managed by apt, they maybe old. If newer are needed:
```sh
wget 'https://www.python.org/ftp/python/3.a.b/Python-3.a.b.tar.xz'
sha256sum Python-  # 'Tap' to autoly complete
# compare the number to the one at www.python.org/downloads/release/python-3ab/
tar -xf Python-  # 'Tap'
cd Python-  # 'Tap'

# if install newer IDLE editor too
sudo apt install build-essential libreadline-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev

./configure
make
sudo make altinstall  # bin/ and lib/ in /usr/local/
python3 -VV  # output: Python 3.a.b ...

idle3  # if newer IDLE installed

# to install newer packages
python3 -m pip install PkgName  # ~/.local/lib/python3.a/site-packages/
python3 -m ensurepip --upgrade  # if no pip

# to remove
sudo make altinstall uninstall

# to find where python are
which python3  # /usr/local/bin/ is by make altinstall
which python3.x  # /usr/bin/ is by apt
which python3.y  # ~/.local/bin/ is by pypx
which python3.z  # ~/.local/share/ is by uv

# to check binary execute information, e.g.
file /usr/local/bin/py*

# to know packages that depend on which python
apt-cache rdepends python3
apt-cache rdepends python3.x
# and so on ...

# if apt warn/err with python3
sudo apt install --reinstall python3-full
```
== Prevent .sh Print
```sh
#!/bin/bash

echo "some output"
$ some output

echo "some output" > output.txt
  # > redirect stdout
  # if output.txt not exist, create
  # if output.txt exist, overwrite
cat output.txt

echo "some output" >> output.txt
  # >> redirect stdout
  # if output.txt not exist, create
  # if output.txt exist, append
cat output.txt

echo "some output" > /dev/null

echo "some output" > /dev/null 2>&1
  # 1 stdout, 2 stderr
  # 2>&1 redirect stderr to stdout

exec > /dev/null 2>&1
  # prevent print of the entire .sh script
```
== Auto Run .sh at Startup, or at Awake from Sleep
== Install a New Version of Python and Pip
== Convert a Non-English .html into Text Only
ctrl h with regex
```regex
[a-z</>,;"\?!^#&\|\(\)\{\}\[\]\\+_.=-]|(\n{2,})|(^\s*$)
```
= Fix Error
== Permission denied, not in the sudoers file
```sh
su
# password of su

visudo
# append a line:
<user_name> ALL=(ALL) ALL

usermod -aG sudo <user_name>

# ctrl d to quit su

sudo apt install apt  # try if fine
# password of sudo of <user_name>

# su: run command as the root
# sudo: run command as a superuser
  # the passwords of su and sudo are set during installing a linux distro
```
