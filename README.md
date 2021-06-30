# Born2beRoot

## Prerequisites
The VM is setup with partitions correctly and is working


## Setting up *sudo* 

### Install *sudo*
From root, Install *sudo* with
```
$ apt install sudo
```
Check if *sudo* was installed successfully with
```
$ apt-cache policy sudo
```

### Add user to *sudo* group
Add `<username>` to *sudo* group with
```
$ adduser <username> sudo  
```
if `adduser` command does not work, you may need to add it to PATH like so
```
PATH=$PATH:/usr/sbin/
```
Check users in *sudo* group with
```
$ getent group sudo  
```
Now `reboot`and login.
Now you can use `sudo` instead if switching to root. 

## Setting up SSH

### Install & Configure SSH
Install *openssh-server* with
```
$ sudo apt install openssh-server
```
Check if installation was successful with `apt-cache policy openssh-server`.

Configure *ssh* with
```
$ sudo nano /etc/ssh/sshd_config
```
Replace `#Port 22` with `Port 4242` to only allow connections through port 4242 
Set `#PermitRootLogin` to `no` 

To disable *ssh* login as root. 
Check *ssh* status with `sudo service ssh status`. 

## Set up UncomplicatedFireWall (UFW)

### Install UFW
Install *ufw* with
```
$ sudo apt install ufw
```
Check the installation success with `dpkg -l | grep ufw`. 
Enable UFW:
```
$ sudo ufw enable
```

### Configure UFW
Allow *ssh* connections through Port 4242:
```
$ sudo ufw allow 4242
```
Verify UFW status: `sudo ufw status`.

## Password Policy

### Set Expiration
Change the policy with
```
$ sudo nano /etc/login.defs
```
Set `PASS_MAX_DAYS` to `30` to let passwords expire every 30 days
Set `PASS_MIN_DAYS` to `2` to enforce two days between password changes.

### Define Strength
Install the *libpam-pwquality* package with
```
$ sudo apt install libpam-pwquality
```
Check if the installation was successful 
```
$ dpkg -l | grep libpam-pwquality
```
Open the password strength policy with
```
$ sudo nano /etc/pam.d/common-password
```
and set 
```
password        requisite                       pam_pwquality.so retry=3
```
to
```
password        requisite                       pam_pwquality.so retry=3 maxrepeat=3 minlen=10 ucredit=-1 dcredit=-1 reject_username difok=7 enforce_for_root
```

## Setting User Groups

### Creating a new group
Create group *user42* with
```
$ sudo addgroup user42
```

### Add a user to group
Add user to *user42* with
```
$ sudo adduser <username> user42
```
Check the group with `getent group user42`.

