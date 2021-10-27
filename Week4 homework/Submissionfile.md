## Week 4 Homework Submission File: Linux Systems Administration

##\# Step 1: Ensure/Double Check Permissions on Sensitive Files

1\. Permissions on \`/etc/shadow\` should allow only \`root\` read and
write access.

- Command to inspect permissions: ls -l shadow from the /etc folder

- Command to set permissions (if needed): sudo chmod 600 shadow

![chmod shadow](Images\ls_shadow.png)

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

![](Pictures/1000000000000387000000DBCEA9A0F8.png){width="6.9217in"
height="1.6756in"}

2\. Ensure that only the \`admin\` has general sudo access.

- Command to add \`admin\` to the \`sudo\` group: sudo usermod -aG sudo
admin

![](Pictures/10000000000002AC00000031644CEB76.png){width="6.9217in"
height="0.4925in"}

![](Pictures/1000000000000294000000450DBBFC31.png){width="6.8717in"
height="0.7154in"}

##\# Step 3: Create User Group and Collaborative Folder

![](Pictures/100000000000029300000037FB735C4F.png){width="6.861in"
height="0.5693in"}1. Add an \`engineers\` group to the system.

- Command to add group: sudo addgroup engineers

2\. Add users \`sam\`, \`joe\`, \`amy\`, and \`sara\` to the managed
group.

- Command to add users to \`engineers\` group (include all four users):

sudo usermod -aG engineers sam

sudo usermod -aG engineers joe

sudo usermod -aG engineers amy

sudo usermod -aG engineers sara

![](Pictures/10000000000002A90000005043D7E38D.png){width="6.9217in"
height="0.8098in"}

3\. Create a shared folder for this group at \`/home/engineers\`.

- Command to create the shared folder: sudo mkdir /home/engineers

![](Pictures/10000000000003690000001EEAE140CF.png){width="6.9217in"
height="0.2339in"}

4\. Change ownership on the new engineers\' shared folder to the
\`engineers\` group.

- Command to change ownership of engineer\'s shared folder to engineer
group: sudo chgrp engineers engineer from the home file.

Sudo chown :engineers engineers

![](Pictures/10000000000002E10000001826EF48CE.png){width="6.922in"
height="0.222in"}

##\# Step 4: Lynis Auditing

1\. Command to install Lynis: apt-get install lynis

![](Pictures/10000000000006F00000010BDCD85929.png){width="6.9217in"
height="1.1618in"}

2\. Command to see documentation and instructions: man lynis

3\. Command to run an audit: sudo lynus audit system

4\. Provide a report from the Lynis output on what can be done to harden
the system.

- Screenshot of report output:

![](Pictures/10000000000006E300000355769643FD.png){width="6.9217in"
height="3.4291in"}![](Pictures/10000000000006540000032882E8E676.png){width="6.9217in"
height="3.45in"}![](Pictures/10000000000006BD0000018397FEAB6C.png){width="6.9217in"
height="1.55in"}![](Pictures/10000000000006F20000015C610A4958.png){width="6.9217in"
height="1.3516in"}

![](Pictures/100000000000068E00000358B3EC3138.png){width="6.9217in"
height="3.5291in"}

##\# Bonus

1\. Command to install chkrootkit: sudo apt install chkrootkit

2\. Command to see documentation and instructions: man chkrootkit

3\. Command to run expert mode: sudo chkrootkit -x

4\. Provide a report from the chrootkit output on what can be done to
harden the system.

- Screenshot of end of sample output:

![](Pictures/1000000000000429000000DE006875B4.png){width="6.9217in"
height="1.4398in"}

\-\--

Â© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights
Reserved.
