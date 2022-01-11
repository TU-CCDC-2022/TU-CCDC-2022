# Linux Directory

# Changing passwords

* Change root password `passwd root` Disable root `sudo passwd -l root || panic`
* Change other users password if needed
* Add defense account `useradd -ou 0 -g 0 systemctl` `passwd systemctl`
* `su systemctl`

# Take backups

* `wget <script>; chmod +x backup_files.sh; ./backup_files.sh` (without git) || Run `harden/backup_files.sh` script

# Harden
* list services with `systemctl list-units --type=service` || `service --status-all`

## Ubuntu / Debian

* Be aware that `harden_ubuntu.sh` disables some services, make sure you run `systemctl list-units --type=service` || `service --status-all` to check for needed services
* `wget <script>; chmod +x harden_ubuntu.sh; ./harden_ubuntu.sh` (without git)
* Run `harden/harden_ubuntu.sh` script

## CentOS / RHEL

* soon... 

## All distros

* ssh: `wget <script>; chmod +x harden_ssh.sh; ./harden_ssh.sh` (without git) || Run `harden/harden_ssh.sh` script
* iptables: (modify based on installed services) (check useful ports with `netstat -antup`)
* * `wget <script>; chmod +x harden_iptables.sh; ./harden_iptables.sh` (without git) || Run `harden/harden_iptables.sh` script
* * (todo) make script compatible with (CentOS / RHEL)

## Apache2

* check `/var/www/html/index.html` is default before running `harden_apache2.sh`
* `wget <script>; chmod +x harden_apache2.sh; ./harden_apache2.sh` (without git) || Run `harden/harden_apache2.sh` script

## Nginx

* check `/var/www/html/index.html` is default before running `harden_nginx.sh`
* `wget <script>; chmod +x harden_nginx.sh; ./harden_nginx.sh` (without git) || Run `harden/harden_nginx.sh` script

# Check

* Run `linpeas.sh`
* * `wget https://github.com/carlospolop/PEASS-ng/releases/download/refs%2Fpull%2F253%2Fmerge/linpeas.sh; chmod +x linpeas.sh; ./linpeas.sh`

# Monitor

* soon... 
