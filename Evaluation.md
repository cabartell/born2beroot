# Eval Notes
[Evaluation Sheet](https://github.com/cabartell/born2beroot/files/7110175/Intra_Projects_Born2beroot_Edit.1.pdf)    
connect via SSH; `ssh -p <port> <user>@<ip>` and `exit` to quit    
ThisPr0jectSucks!

## Project Overview
- **How does a virtual machine work?**    
A virtual machine (VM) is a virtual environment that works like a computer within a computer. It runs on an isolated partition of its host computer with its own resources of CPU power, memory, an operating system (e.g. Windows, Linux, macOS), and other resources

- **Choice of OS**    
Debian - because I've used it before xD My friend said CentOS is a PITA

- **Basic differences between CentOS and Debian**    

- **The purpose of VMs**    
- **Difference between aptitude and apt**    
- **What is APPArmor?**    

## Simple Setup
- **No graphical environment at launch**    
- **Password will be requested before connecting to machine**    
- **Check UFW**    
```
sudo ufw status
```
- **Check SSH**    
```
sudo service ssh status
```
- **Check OS**    
```
cat /etc/os-release
```

## User
- **Check user exists and is in groups sudo and user42**    
```
groups cbartell
```
- **create new user**    
```
sudo adduser <username>
```
- **add group**
```
sudo addgroup evaluating
```
- **add new user to group**
```
sudo adduser <username> evaluating
```
- **check**
```
groups <username>
```
- **find the password rules**
```
sudo cat /etc/pam.d/common-password
```
## Hostname and partitions

- **check hostname**
```
sudo hostnamectl
```
- **change hostname**
```
hostnamectl set-hostname [YOUR NEW HOSTNAME]
```
- **reboot**
```
sudo reboot
```
- **change hostname back**
- **check partitions**
```
lsblk
```
- **What is LVM, how does it work?**
LVM stands for Logical Volume Management. It is a system of managing logical volumes, or filesystems, that is much more advanced and flexible than the traditional method of partitioning a disk into one or more segments and formatting that partition with a filesystem.    
A **Volume Group** is a named collection of physical and logical volumes. Typical systems only need one Volume Group to contain all of the physical and logical volumes on the system    

**Physical Volumes** correspond to disks; they are block devices that provide the space to store logical volumes    

**Logical volumes** correspond to partitions: they hold a filesystem. Unlike partitions though, logical volumes get names rather than numbers, they can span across multiple disks, and do not have to be physically contiguous.    

## SUDO
- **check sudo is installed**
```
$ apt-cache policy sudo
```
- **add new user to sudo**
```
adduser <username> sudo
```
- **find the sudo rules**
```
sudo cat /etc/sudoers.d/config
```
- **check sudo log**
```
sudo cat /var/log/sudo/log
```

## UFW
- **check UFW is installed**
- **check UFW is working**
- **what is UFW and what's it good for?**
- **List active rules in UFW. A rule for port 4242 must exist**
Port 68 = Bootstrap Protocol
```
ss -tunlp
```
```
sudo /usr/sbin/ufw status
```
- **add new rules to open port 8080**   
```
sudo ufw allow 8080
```
- **check the new rule is added by listing active rules**   
```
sudo /usr/sbin/ufw status
```
- **delete the new rule for port 8080**   
```
sudo ufw delete <rulenumber>
```

## SSH
- **Check SSH service is installed**   
```
apt-cache policy openssh-server
```
- **check it's working**   
```
sudo service ssh status
```


