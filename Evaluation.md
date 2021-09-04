# Eval Notes
[Evaluation Sheet](https://github.com/cabartell/born2beroot/files/7110175/Intra_Projects_Born2beroot_Edit.1.pdf)
connect via SSH; `ssh -p 4242 cbartell@192.168.178.141` and `exit` to quit    

## Project Overview
- **How does a virtual machine work?**    
A virtual machine (VM) is a virtual environment that works like a computer within a computer. It runs on an isolated partition of its host computer with its own resources of CPU power, memory, an operating system (e.g. Windows, Linux, macOS), and other resources

- **Choice of OS**    
Debian - because I've used it before xD

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
- ****    
