#set page(flipped:false, columns:2)
#set par(justify:true)
#show heading: h => rect(
  height:1.2em, width:100%, stroke:(bottom:0.5pt+luma(220)), inset:0pt, h)

= Linux
== Intro, Distro, Install
*Operating System (OS) is the platform software that* run on computer, phone, pad, server, car navigator, home automation devices, etc. It *enables user to control hardware*, e.g. turn on/off wifi network, tune sound volume or screen luminance. The usual OS are Apple iOS/Mac, GNU/Linux Debian/Ubuntu/Arch/Fedora/Redhat/OpenSUSE, Google Android, Microsoft Windows. \
Some OS are ready to use, some are not. To use iOS, just buy their phone; to use Debian visually, you also need desktop software like GNU Gnome or KDE Plasma. As Debian is text only OS, no graphical user interface (GUI). \
Different OS have different structure and application software usually. So when you choose OS, make sure which OS your team, school or company use.
/ operating system (OS): example of plantform software; plantform software
/ planform software: enable user to control hardware
/ desktop software: make text only OS visual
/ application software (APP): supply specialized features
== Path, Folder(Directory), File
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
ls
mkdir Folder/
cd Folder/
touch FileA FileB
ls
rm FileB
ls
nano FileA
# to quit nano: ctrl x => y => enter
cd ..
ls Folder/
rm -r Folder/
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
== Source Mirror of Packages
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
== Packages: install, check, update, remove
```sh
# Git Version Control System
sudo apt install git-all
git -v

# IDLE, Integrated Development Environment for Python
sudo apt install python3-full
idle
idle xxx.py

# Rust Programming Language
$ curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
rustc --version

# Cargo, Build System and Package Manager of Rust
# ship with Rust
cargo --version

# Firefox Web Browser
sudo apt install firefox-esr
firefox
firefox xxx.html

# VLC Multimedia Player
sudo apt install vlc
vlc
vlc xxx.mp4
```
```sh
# if xxx is intro by apt
sudo apt update -y
sudo apt upgrade  # or
sudo apt full-upgrade

sudo apt remove xxx
sudo apt autoremove

# Rust
rustup updadte
rustup self uninstall
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
= Bash
```sh
ls -p | grep -v /  # not list folders
find . -maxdepth 1 -type f  # only list files
# the above two maybe different
```
= How-to
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
