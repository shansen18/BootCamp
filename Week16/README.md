## Week 16 Homework Submission File: Penetration Testing 1

#### Step 1: Google Dorking


- Using Google, can you identify who the Chief Executive Officer of Altoro Mutual is:

  Karl Fitzgerald

- How can this information be helpful to an attacker:
  
  A name is a great place to start when doing recon. From there one can gather more information such as Linkedin information, any information on facebook, twitter and other social media accounts. One can even get a address, and phone number. This creates a profile of the CEO which can help identify vectors of attack and also potential passwords. 


#### Step 2: DNS and Domain Discovery

Enter the IP address for `demo.testfire.net` into Domain Dossier and answer the following questions based on the results:

  1. Where is the company located:
   Sunnyvale, CA

  2. What is the NetRange IP address:
  	65.61.137.117


  3. What is the company they use to store their infrastructure:
  	Rackspace

  4. What is the IP address of the DNS server:
    65.61.137.64 -65.61.137.127

#### Step 3: Shodan

- What open ports and running services did Shodan find:
Port 80/TCP Port 443/TCP, Port 8080/TCP

#### Step 4: Recon-ng

- Install the Recon module `xssed`. 
- Set the source to `demo.testfire.net`. 
- Run the module. 

use recon/domains-vulnerabilities/xssed


Is Altoro Mutual vulnerable to XSS: 
Yes, demo.testfire.net appears to be vulnerable to XSS based on recon-ng. 

![loadrecon](https://github.com/shansen18/BootCamp/blob/d4348fcf0f79e669ebb3d1948b923f38479c7b90/Week16/images/ReconNG.JPG)

![testfire_vuln](https://github.com/shansen18/BootCamp/blob/d4348fcf0f79e669ebb3d1948b923f38479c7b90/Week16/images/testfire_vulns.JPG)

### Step 5: Zenmap

Your client has asked that you help identify any vulnerabilities with their file-sharing server. Using the Metasploitable machine to act as your client's server, complete the following:

- Command for Zenmap to run a service scan against the Metasploitable machine: 
 
- Bonus command to output results into a new text file named `zenmapscan.txt`:

- Zenmap vulnerability script command: 

- Once you have identified this vulnerability, answer the following questions for your client:
  1. What is the vulnerability:
    vsFTPd version 2.3.4 backdoor


  2. Why is it dangerous: As the exploit name says this is a backdoor into the system. It appears as a smiley face. Using this exploit gives you root privilages in the victims computer, as shown in the picture below.



  3. What mitigation strategies can you recommendations for the client to protect their server: Update and patch the server, this is an old exploit, and aparrently was fixed within a day. 

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.  

