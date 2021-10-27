# Networking Fundamentals Homework: Rocking your Network!

**Phase 1: "I'd like to Teach the World to Ping"**

For this part, I looked up the easiest way to ping a range of IP
addresses. It was to create a file with all the ip\'s in it and then run
the fping -f (file name). In making the file I had to remove the CITR
range at the end in order to get a response.

![ping range](https://github.com/shansen18/BootCamp/blob/main/week08/screen%20shots/Ping%20results.jpg)

Mitigation against vulnerabilities.

Turn off ping response.

**What layer of the OSI are we dealing with?**

Pinging a computer is working on Layer 3 (Networking Layer) of the OSI
modle.

**Phase 2**: **"Some Syn for Nothin'"**

I used the command sudo nmap -sS 167.172.144.11

![nmap](https://github.com/shansen18/BootCamp/blob/main/week08/screen%20shots/NMAP.jpg)

Mitigation against vulnerabilities.

Filter the port.

**What layer of the OSI are we dealing with?**

Pinging a computer is working on Layer 4

**Phase 3: "I Feel a *DNS* Change Comin' On"**

This part I used the ssh (username)@(ipaddress) command using the
username and password given in the homework file.

I then nano'd the /etc/hosts file to get the ip of the redirect
ipaddress

From the I ran nslookup 98.137.246.8

![host](https://github.com/shansen18/BootCamp/blob/main/week08/screen%20shots/hosts%20file.jpg)
![nslookup](https://github.com/shansen18/BootCamp/blob/main/week08/screen%20shots/nslookup.jpg)

**Mitigation against vulnerabilities.**

Implementing DNSSEC (domain Name system security extension), basically
it authenticates responses to domain name lookup.

**What layer of the OSI are we dealing with?**

The SSH connection, and the DNS are working on the 7th layer which is
the application layer protocol.



**Your Submission: "Its the End of the Assessment as We Know It, and I Feel Fine"**

For this phase, I logged back into the server using the ssh command. I
then moved into the etc folder and ran the ls command, finding the
packetcaptureinfo.txt

I then ran nano packetcaptureinfo and in it was a link to:

<https://drive.google.com/file/d/1ic-CFFGrbruloYrWaw3PvT71elTkh3eF/view>

I then closed out of the terminal and opened the link in the browser and
downloaded it and opened in wireshark

In wireshark, I filtered the packets by using http.request.method ==
\"POST\" as a filter.

![post1](https://github.com/shansen18/BootCamp/blob/main/week08/screen%20shots/post1.png)

![post2](https://github.com/shansen18/BootCamp/blob/main/week08/screen%20shots/post%20packet.jpg)

**Packet Data**

I cleaned up the data from the packet and listed it below.

HTML Form URL Encoded: application/x-www-form-urlencoded

Form item: \"0\<text>\" = \"Mr Hacker\"

Value: Mr Hacker

Form item: \"0\<label>\" = \"Name\"

Value: Name

Form item: \"1\<text>\" = \"Hacker\@rockstarcorp.com\"

Value: Hacker\@rockstarcorp.com

Form item: \"1\<label>\" = \"Email\"

Value: Email

Form item: \"2\<text>\" = \"\"

Value:

Form item: \"2\<label>\" = \"Phone\"

Key: 2\<label>

Value: Phone

Form item: \"3\<textarea>\" = \"Hi Got The Blues Corp! This is a hacker
that works at Rock Star Corp. Rock Star has left port 22, SSH open if
you want to hack in. For 1 Milliion Dollars I will provide you the user
and password!\"

Key: 3\<textarea>

Value: Hi Got The Blues Corp! This is a hacker that works at Rock Star
Corp. Rock Star has left port 22, SSH open if you want to hack in. For 1
Milliion Dollars I will provide you the user and password!



**What layer of the OSI are we dealing with?**

Seeing how we are using wireshark to examine data encapsulated in a
packets, there are multiple answers to this question. However since we
already already captured the packet, and are just examining the data we
are using the Application layer or Layer 7 of the OSI.
