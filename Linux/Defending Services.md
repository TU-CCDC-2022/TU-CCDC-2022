# Securing Drupal (7) (Always backup)
`cp -r /var/www/html /var/www/html2`
# Auto 

* goto Modules > check `update manager` scroll to the buttom and save
* `Home » Administration » Reports » Available updates`

## Manual 
* cd to the install dir `cd /var/www/html`
* download patch `curl https://project.kodesmart.com/Drupal7_Patches/drupal-7.26-to-7.66.patch -o drupal-7.26-to-7.66.patch -k` (change versions)
* `patch -p1 < drupal-7.26-to-7.66.patch` choose the old file
* go to `Home » Administration » Reports` and fix database updates

## Other

* goto people remove sus and change passswords if needed
* goto accounts tick `Visitors, but administrator approval is required` scroll and save
* `Home » Administration » Modules` Install from a URL
* * `https://ftp.drupal.org/files/projects/login_security-7.x-1.9.tar.gz`
* * `https://ftp.drupal.org/files/projects/acl-7.x-1.2.tar.gz`
* * `https://ftp.drupal.org/files/projects/password_policy-7.x-2.0-alpha8.tar.gz`
* * `https://ftp.drupal.org/files/projects/captcha-7.x-1.7.tar.gz`
* * `https://ftp.drupal.org/files/projects/autologout-7.x-4.6.tar.gz`
* * `https://ftp.drupal.org/files/projects/content_access-7.x-1.2-beta3.tar.gz`
* * `https://ftp.drupal.org/files/projects/spamspan-7.x-1.3.tar.gz`
* * `https://ftp.drupal.org/files/projects/hacked-7.x-2.0-beta8.tar.gz`
* * `https://ftp.drupal.org/files/projects/security_review-7.x-1.3.tar.gz` (run)
* make sure authenticated users don't have admin powers 

# Securing SMTP,POP,IMAP

# Securing FTP

# Securing SSH

# Securing DNS

# Securing MYSQL
