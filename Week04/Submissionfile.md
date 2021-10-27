## Week 4 Homework Submission File: Linux Systems Administration

##\# Step 1: Ensure/Double Check Permissions on Sensitive Files

1\. Permissions on \`/etc/shadow\` should allow only \`root\` read and
write access.

- Command to inspect permissions: ls -l shadow from the /etc folder

- Command to set permissions (if needed): sudo chmod 600 shadow

![chmod shadow](https://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/ls_shadow.png)

2\. Permissions on \`/etc/gshadow\` should allow only \`root\` read and
write access.

- Command to inspect permissions: ls -l gshadow from the etc folder

- Command to set permissions (if needed): sudo chmod 600 gshadow

![chmod gshadow](https://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/ls_gshadow.png)


3\. Permissions on \`/etc/group\` should allow \`root\` read and write
access, and allow everyone else read access only.

- Command to inspect permissions: ls -l group from the etc folder

- Command to set permissions (if needed): sudo chmod 644 group

![chmod groups](https://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/ls_group.png)

4\. Permissions on \`/etc/passwd\` should allow \`root\` read and write
access, and allow everyone else read access only.

- Command to inspect permissions: ls -l passwd done from the etc folder

- Command to set permissions (if needed): sudo chmod 644 passwd

![chmod passwdhttps://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/ls_passwd.png)


##\# Step 2: Create User Accounts

1\. Add user accounts for \`sam\`, \`joe\`, \`amy\`, \`sara\`, and
\`admin\`.

- Command to add each user account (include all five users):

sudo useradd sam

sudo useradd joe

sudo useradd amy

sudo useradd sara

sudo useradd admin

![user add](https://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/usseradd.png)

2\. Ensure that only the \`admin\` has general sudo access.

- Command to add \`admin\` to the \`sudo\` group: sudo usermod -aG sudo
admin

![user mod](https://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/usermod.png)

![user mod results](https://github.com/shansen18/BootCamp/blob/main/Week04/Images/usermod_results.png)


##\# Step 3: Create User Group and Collaborative Folder

- Command to add group: sudo addgroup engineers

![addgroup](https://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/addgroup.png)



2\. Add users \`sam\`, \`joe\`, \`amy\`, and \`sara\` to the managed
group.

- Command to add users to \`engineers\` group (include all four users):

sudo usermod -aG engineers sam

sudo usermod -aG engineers joe

sudo usermod -aG engineers amy

sudo usermod -aG engineers sara

![usermod](ttps://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/usermod_sam.png)

3\. Create a shared folder for this group at \`/home/engineers\`.

- Command to create the shared folder: sudo mkdir /home/engineers

![mkdir](https://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/mkdir_engineer.png)

4\. Change ownership on the new engineers\' shared folder to the
\`engineers\` group.

- Command to change ownership of engineer\'s shared folder to engineer
group: sudo chgrp engineers engineer from the home file.

Sudo chown :engineers engineers

![chown](https://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/sudo_chown.png)

##\# Step 4: Lynis Auditing

1\. Command to install Lynis: apt-get install lynis

![aptget](https://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/install_lynis.png)

2\. Command to see documentation and instructions: man lynis

3\. Command to run an audit: sudo lynus audit system

4\. Provide a report from the Lynis output on what can be done to harden
the system.

- Screenshot of report output:

![hardening1](https://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/hardening1.png)
![Hardening2](https://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/hardening2.png)
![Hardening3](https://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/hardening3.png)
![Hardening4](https://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/hardening4.png)
![Hardening5](https://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/hardening5.png)



##\# Bonus

1\. Command to install chkrootkit: sudo apt install chkrootkit

2\. Command to see documentation and instructions: man chkrootkit

3\. Command to run expert mode: sudo chkrootkit -x

4\. Provide a report from the chrootkit output on what can be done to
harden the system.

- Screenshot of end of sample output:

![chkrootkit](https://github.com/shansen18/BootCamp/blob/a0bc7165e908c8f968eb13453f87fcc543894c95/Week04/Images/chkrootkit.png)

\-\--

Â© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights
Reserved.
