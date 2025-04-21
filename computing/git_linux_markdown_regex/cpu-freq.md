# The One-Stop Solution to Low CPU Frequency
*ThrottleStop, the Linux way*

## Why?
When CPU be limited and runs at a low frequency, e.g. 0.4 or 0.8 GHz, it takes tanks of time to fix... ...if your OS is not Windows and can not run [ThrottleStop](https://www.techpowerup.com/download/techpowerup-throttlestop/).
So I combine all the solutions together to save your time, here it is:

## 1. Some Hardware Wrong?
Power Supply, Battery, Fan, Wind Tube, etc

## 2. Remove Static Electricity
- Unplug ALL Supplies
- Then Hold Down PowerKey for 60 sec

## 3. Reset and Update BIOS
- Click PowerKey and Hold Down F2 to Enter BIOS to Reset it
- Go to OEM(Acer Asus Dell...) Official Site to Update BIOS

## 4. Set CPU Frequency
```shell
$ sudo update -y
$ sudo apt install linux-cpupower -y
$ sudo cpupower frequency-set -r -d 0.4GHz -u 1.6GHz -g powersave
```
Max Frequency == Base Frequency, perhaps better

## 5. Set Successfully?
```shell
$ watch -n1 "grep \"^[c]pu MHz\" /proc/cpuinfo"
```
## 6. Secure Boot Disable? (Ready for MSR)
```shell
$ sudo apt install mokutil -y
$ sudo mokutil --sb-state
```
## 6.5. Disable Secure Boot in BIOS

## 7. Reset CPU (Disable BD PROCHOT) via MSR
```shell
$ sudo apt install msr-tools -y
$ sudo modprobe msr
$ sudo rdmsr -a -d 0x1FC  # 2359389
$ sudo wrmsr 0x1FC 2359388
```

## 8. Everything Fine?
```shell
$ sudo apt install powerstat cpu-x -y
$ sudo powerstat -R
# [ctrl c] to get Watts' Summary and quit
$ sudo cpu-x
```

## Put in one file for fast operation
```shell
$ touch fixCPU.sh
$ nano fixCPU.sh
# edit in nano
sudo modprobe msr
sudo wrmsr 0x1FC 2359388
sudo cpupower frequency-set -r -d 0.4GHz -u 1.6GHz -g powersave
watch -n1 "grep \"^[c]pu MHz\" /proc/cpuinfo"
# [ctrl x] to exit nano
# [y] to save modified buffer 
# [enter] to write in Linux-ish Format 
$ chmod +x fixCPU.sh
```
After every boot, don't forget `./fixCPU.sh`.

## Thanks To:
[Antonio Prcela, Roman Makarov](https://github.com/kitsunyan/intel-undervolt/issues/17) |
[Divyanshu Verma](https://github.com/DivyanshuVerma/throttlestop-linux) |
[Debian, Arch Wiki](https://wiki.debian.org/CpuFrequencyScaling)
