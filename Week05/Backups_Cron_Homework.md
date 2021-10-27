## Week 5 Homework Submission File: Archiving and Logging Data

Please edit this file by adding the solution commands on the line below
the prompt.

Save and submit the completed file for your homework submission.

\-\--

##\# Step 1: Create, Extract, Compress, and Manage tar Backup Archives

1\. Command to \*\*extract\*\* the \`TarDocs.tar\` archive to the
current directory:

tar xvvf TarDocs.tar

2\. Command to \*\*create\*\* the \`Javaless_Doc.tar\` archive from the
\`TarDocs/\` directory, while excluding the \`TarDocs/Documents/Java\`
directory:

tar czf Javaless_Docs.tar \--exclude=TarDocs/Documents/Java TarDocs

3\. Command to ensure \`Java/\` is not in the new \`Javaless_Docs.tar\`
archive:

tar tvvf Javaless_Docs.tar | grep Java

![grep java](https://github.com/shansen18/BootCamp/blob/eedaa11254ac1140d870105fb0637d3da36c17a0/Week05/screenshots/Making%20sure%20Java%20was%20not%20included%20in%20tar.JPG)

\*\*Bonus\*\*

\- Command to create an incremental archive called
\`logs_backup_tar.gz\` with only changed files to \`snapshot.file\` for
the \`/var/log\` directory:

#### Critical Analysis Question

\- Why wouldn\'t you use the options \`-x\` and \`-c\` at the same time
with \`tar\`? Because -x extracts the tar file and -c creates a new one
tar file. Why create a tarfile at the same time as extracting it?

\-\--

##\# Step 2: Create, Manage, and Automate Cron Jobs

1\. Cron job for backing up the \`/var/log/auth.log\` file:

in sudo\'s crontab I put: \* 6 \* \* 3 tar cvf /auth_backup.tgz
/var/log/auth.log \>/dev/null 2>&1

![cron](https://github.com/shansen18/BootCamp/blob/eedaa11254ac1140d870105fb0637d3da36c17a0/Week05/screenshots/Crontab%20edit%20to%20backup%20authlog.jpg)

\-\--

##\# Step 3: Write Basic Bash Scripts

1\. Brace expansion command to create the four subdirectories:

mkdir -p backups/{freemem,diskuse,openlist,freedisk} the -p creates the
containing folder if it\'s not already there, which on my system it
wasn\'t.

2\. Paste your \`system.sh\` script edits below:

\`\`\`bash

#!/bin/bash

free -h -t \>\~/backups/freemem/free_mem.txt

df -h \| head -n 4 \| tail -n 1 \| awk \'{print \$1,\$2}\'
\>\~/backups/diskuse/disk_usage.txt

na

lsof>\~/openlist/open_list.txt

df -h \| head -n 4 \| tail -n 1 \| awk \'{print \$1,\$3,\$4,\$5,\$6}\'
\>\~/backups/freedisk/free_disk.txt

\`\`\`

![system script](https://github.com/shansen18/BootCamp/blob/eedaa11254ac1140d870105fb0637d3da36c17a0/Week05/screenshots/system_script.JPG)



3\. Command to make the \`system.sh\` script executable:

\*\*Optional\*\*

\- Commands to test the script and confirm its execution:

\*\*Bonus\*\*

\- Command to copy \`system\` to system-wide cron directory:

\-\--

##\# Step 4. Manage Log File Sizes

1\. Run \`sudo nano /etc/logrotate.conf\` to edit the \`logrotate\`
configuration file.

Configure a log rotation scheme that backs up authentication messages to
the \`/var/log/auth.log\`.

- Add your config file edits below:back

\`\`\`bash

/var/log/auth.log

{

rotate 7

weekly

missingok

notifempty

compress

delaycompress

}

cd

\`\`\`

\-\--

![authlog config](https://github.com/shansen18/BootCamp/blob/eedaa11254ac1140d870105fb0637d3da36c17a0/Week05/screenshots/authlog%20_config.JPG)


##\# Bonus: Check for Policy and File Violations

1\. Command to verify \`auditd\` is active:

systemctl is-enabled auditd

2\. Command to set number of retained logs and maximum log file size:

- Add the edits made to the configuration file below:

\`\`\`bash

freq = 7

max_log_file = 35

\`\`\`

![auditd.conf](https://github.com/shansen18/BootCamp/blob/eedaa11254ac1140d870105fb0637d3da36c17a0/Week05/screenshots/auditd.conf%20settings.JPG)


3\. Command using \`auditd\` to set rules for \`/etc/shadow\`,
\`/etc/passwd\` and \`/var/log/auth.log\`:

- Add the edits made to the \`rules\` file below:

\`\`\`bash

-w /etc/shadow -k hashpass_audit -p wra

-w /etc/passwd -k userpass_audit -p wra

-w /etc/auth.log -k authlog_audit -p wra

\`\`\`

![auditd rules](https://github.com/shansen18/BootCamp/blob/eedaa11254ac1140d870105fb0637d3da36c17a0/Week05/screenshots/adding%20new%20audit%20rules.JPG)


4\. Command to restart \`auditd\`:

sudo systemctl restart auditd

5\. Command to list all \`auditd\` rules:

sudo auditctl -l

6\. Command to produce an audit report:

aureport

7\. Create a user with \`sudo useradd attacker\` and produce an audit
report that lists account modifications:

8\. Command to use \`auditd\` to watch \`/var/log/cron\`:

9\. Command to verify \`auditd\` rules:
sudo auditctl -l

[audit veridy](https://github.com/shansen18/BootCamp/blob/eedaa11254ac1140d870105fb0637d3da36c17a0/Week05/screenshots/verify%20audit%20rules.JPG)

\-\--
\-\--

Â© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights
Reserved.
   a