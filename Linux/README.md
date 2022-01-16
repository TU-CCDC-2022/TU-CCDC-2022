# Linux Directory

# Create user

* check `cat /etc/skel`
* `adduser sysboss` 
* `usermod -aG sudo sysboss`
* On your vm `ssh-copy-id sysboss@ip` `ssh-copy-id root@ip`

# Changing passwords

* Change root password `passwd root` Disable root `sudo passwd -l root || panic`
* Change other users password if needed

# Prepare script

* `git clone https://github.com/TU-CCDC-2022/TU-CCDC-2022.git`
* `cd TU-CCDC-2022/Linux/harden`
* `chmod +x *`

# Take backups

* Run `harden/backup_files.sh` script || `wget https://raw.githubusercontent.com/TU-CCDC-2022/TU-CCDC-2022/main/Linux/harden/backup_files.sh; chmod +x backup_files.sh; ./backup_files.sh` (without git)

# Harden
* list services with `systemctl list-units --type=service` || `service --status-all`

## Ubuntu / Debian

* Be aware that `harden_ubuntu.sh` disables some services, make sure you run `systemctl list-units --type=service` || `service --status-all` to check for needed services
* dowload the `allowed_suid_list.txt` (WITHOUT THIS YOU WILL BE LOCKED OUT)
* Run `harden/harden_ubuntu.sh` script
* `wget wget https://raw.githubusercontent.com/TU-CCDC-2022/TU-CCDC-2022/main/Linux/harden/harden_ubuntu.sh; chmod +x harden_ubuntu.sh; ./harden_ubuntu.sh` (without git)
* chmod +s `which sudo` (for insurance)
 
## CentOS / RHEL

* soon... 

## All distros

* ssh: Run `harden/harden_ssh.sh` script || `wget https://raw.githubusercontent.com/TU-CCDC-2022/TU-CCDC-2022/main/Linux/harden/harden_ssh.sh; chmod +x harden_ssh.sh; ./harden_ssh.sh` (without git)  
* iptables: (modify based on installed services) (check useful ports with `netstat -antup`)
* * Run `harden/harden_iptables.sh` script || `wget https://raw.githubusercontent.com/TU-CCDC-2022/TU-CCDC-2022/main/Linux/harden/harden_iptables.sh; chmod +x harden_iptables.sh; ./harden_iptables.sh` (without git)
* * (todo) make script compatible with (CentOS / RHEL)
* Stigs: Run `harden/apply_linux_stig.sh` script || `wget https://raw.githubusercontent.com/TU-CCDC-2022/TU-CCDC-2022/main/Linux/harden/apply_linux_stig.sh; chmod +x apply_linux_stig.sh; ./apply_linux_stig.sh` (without git)  
* Lock Files: Run `harden/lock_down_files.sh` script || `wget https://raw.githubusercontent.com/TU-CCDC-2022/TU-CCDC-2022/main/Linux/harden/lock_down_files.sh; chmod +x lock_down_files.sh; ./lock_down_files.sh` (without git) 
* Networking: Run `harden/harden_networking.sh` script || `wget https://raw.githubusercontent.com/TU-CCDC-2022/TU-CCDC-2022/main/Linux/harden/harden_networking.sh; chmod +x harden_networking.sh; ./harden_networking.sh` (without git) 

## Apache2

* check `/var/www/html/index.html` is default before running `harden_apache2.sh`
* `wget https://raw.githubusercontent.com/TU-CCDC-2022/TU-CCDC-2022/main/Linux/harden/harden_apache2.sh; chmod +x harden_apache2.sh; ./harden_apache2.sh` (without git) || Run `harden/harden_apache2.sh` script

## Nginx

* check `/var/www/html/index.html` is default before running `harden_nginx.sh`
* `wget https://raw.githubusercontent.com/TU-CCDC-2022/TU-CCDC-2022/main/Linux/harden/harden_nginx.sh; chmod +x harden_nginx.sh; ./harden_nginx.sh` (without git) || Run `harden/harden_nginx.sh` script

# Checks

* Run `harden/check_ssh_config.sh`
* Run `harden/check_system_config.sh`
* Run `harden/linpeas.sh`
* * `wget https://github.com/carlospolop/PEASS-ng/releases/download/refs%2Fpull%2F253%2Fmerge/linpeas.sh; chmod +x linpeas.sh; ./linpeas.sh`

# Monitor

* Watch all establised connection every 1 sec (Let it run on a pane)
* * `watch -n 1 "ss -anpt | grep IP subnet | grep ESTAB"` (Grab attackers IP) (-v is to exculde your IP)
* * example : `watch -n 1 "ss -anpt | grep 10.10.10 | grep ESTAB"` 
* Check commands in realtime
* * `tail -f /var/log/auth.log | grep -v 'sid:<ID of watch command>\|sid:<other ID to exclude.'`
* * example `tail -f /var/log/auth.log | grep -v 'sid:2073'`
* Grab Network Traffic
* * If in GUI just use wireshark
* * OR Grab from tcpdump (Takes a lot of memory if left for long) (any bruteforce will x1000 the size)
* * * `sudo nohup tcpdump -i interface -s 0 -w net.pcap &` example `sudo nohup tcpdump -i ens33 -s 0 -w net.pcap &`
* Check files modified 
* * `find / -type f -mmin -30 -ls 2>/dev/null | grep -v '/sys\| /proc\| /run'` => look for sus files
* Check apache logs
* * `grep "flag" /var/log/apache2/access.log` || /var/log/apache2/error.log`
* Watch system timers `watch -d systemctl list-timers`

# Search and Destroy
* check all processes (parent and child) `ps -eaf --forest`
* * kill sus process example (python3 -c ....|| bash -c ...)
* * * `kill <pid>` example `kill 16414`
* use pid from above to check history and for persistence
* * grep 'sid:<pid>' /var.log/auth.log
* * grep 'timestamp' -B 10 -A 10 /var.log/auth.log
* Check current working dir in logs e.g `cwd:/path`
* Open network capture in wireshark => `CTRL + f` => `change display filter to string and Packet list to bytes`