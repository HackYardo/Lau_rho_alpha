= Linux
Intro, Distro, Install
== Path, Folder(Directory), File
- ~ 
- . 
- .. 
- /
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
== Package and Source Mirror
```sh
apt  # manage standard?? package
apt-get
dpkg  # install third party pacakge
dnf  # apt of CentOS, Fedora, RHEL
rpm
yum
pacman
```
== Bash Shell
```sh
ls -p | grep -v /  # not list folders
find . -maxdepth 1 -type f  # only list files
# the above two maybe different
```
