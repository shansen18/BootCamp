## Unit 11 Submission File: Network Security Homework

### Part 1: Review Questions

#### Security Control Types

The concept of defense in depth can be broken down into three different
security control types. Identify the security control type of each set
of defense tactics.

1\. Walls, bollards, fences, guard dogs, cameras, and lighting are what
type of security control?

Answer:

For this exercise I would say that they are physical. However I would
also view them as preventative, because a normal criminal would see
those and find another target.

2\. Security awareness programs, BYOD policies, and ethical hiring
practices are what type of security control?

Answer:

The question answered it, it's the policies, procedures, and awareness.

3\. Encryption, biometric fingerprint readers, firewalls, endpoint
security, and intrusion detection systems are what type of security
control?

Answer:

These are all part of the internal network.

#### Intrusion Detection and Attack indicators

1\. What's the difference between an IDS and an IPS?

Answer:

IDS is an intrusion detection system, as it's name says it detects and
alerts to an intrusion. The alert then should be acted upon by a person.

IPS is an intrusion prevention system. The prevention system then
decides to allow or deny the incoming packets.

2\. What\'s the difference between an Indicator of Attack and an
Indicator of Compromise?

Answer:

Based on what I have been able to find is that the IOA (indicator of
attack) is data that points to an attach and also gathered during the
attack, that is used to mitigate the attack or stop it all together.

The IOC (Indicator of compromise) is the digital forensic data gathered
after the attack. This data can by security professionals to help them
find possible vectors for breaches, and fix them, or implement better
monitoring policies.

#### The Cyber Kill Chain

Name each of the seven stages for the Cyber Kill chain and provide a
brief example of each.

1\. Stage 1: Reconnaissance, gathering data about the target

2\. Stage 2: Weaponization. Creating the exploit

3\. Stage 3: Delivery, delivering the exploit or payload

4\. Stage 4: Exploitation, using the exploit to run the code

5\. Stage 5: Installation, installing the payload on the system

6\. Stage 6: Command and Control. Gaining control of the victims

7\. Stage 7: Actions on objectives, this is where you do what you set
out to do.

#### Snort Rule Analysis

Use the Snort rule to answer the following questions:

Snort Rule #1

\`\`\`bash

alert tcp \$EXTERNAL_NET any -\> \$HOME_NET 5800:5820 (msg:\"ET SCAN
Potential VNC Scan 5800-5820\"; flags:S,12; threshold: type both, track
by_src, count 5, seconds 60;
reference:url,doc.emergingthreats.net/2002910;
classtype:attempted-recon; sid:2002910; rev:5; metadata:created_at
2010_07_30, updated_at 2010_07_30;)

\`\`\`

1\. Break down the Sort Rule header and explain what is happening.

Answer: Alert for all inbound tcp packets on ports 5800 to 5820 from an
external source

2\. What stage of the Cyber Kill Chain does this alert violate?

Answer: Reconnaissance

3\. What kind of attack is indicated?

Answer: To me this alert would indicate that someone might be scanning
the VNC ports to see if they can perform a VNC exploit.

Snort Rule #2

\`\`\`bash

alert tcp \$EXTERNAL_NET \$HTTP_PORTS -\> \$HOME_NET any (msg:\"ET
POLICY PE EXE or DLL Windows file download HTTP\";
flow:established,to_client; flowbits:isnotset,ET.http.binary;
flowbits:isnotset,ET.INFO.WindowsUpdate; file_data; content:\"MZ\";
within:2; byte_jump:4,58,relative,little; content:\"PE\|00 00\|\";
distance:-64; within:4; flowbits:set,ET.http.binary; metadata:
former_category POLICY;
reference:url,doc.emergingthreats.net/bin/view/Main/2018959;
classtype:policy-violation; sid:2018959; rev:4; metadata:created_at
2014_08_19, updated_at 2017_02_01;)

\`\`\`

1\. Break down the Sort Rule header and explain what is happening.

Answer: alerts for inbound traffic from an external systems http ports
to the internal network.

2\. What layer of the Defense in Depth model does this alert violate?

Answer: Delivery

3\. What kind of attack is indicated?

Answer: Downloading of malware

Snort Rule #3

\- Your turn! Write a Snort rule that alerts when traffic is detected
inbound on port 4444 to the local network on any port. Be sure to
include the \`msg\` in the Rule Option.

Answer:

alert tcp \$EXTERNAL_NET any-\> \$HOME_NET 4444 (msg:\"Potential exploit
on port 4444\")

### Part 2: \"Drop Zone\" Lab

#### Log into the Azure \`firewalld\` machine

Log in using the following credentials:

\- Username: \`sysadmin\`

\- Password: \`cybersecurity\`

#### Uninstall \`ufw\`

Before getting started, you should verify that you do not have any
instances of \`ufw\` running. This will avoid conflicts with your
\`firewalld\` service. This also ensures that \`firewalld\` will be your
default firewall.

\- Run the command that removes any running instance of \`ufw\`.

\`\`\`bash

Sudo ufw disable

sudo apt -y remove ufw

\`\`\`

![disable ufw](https://github.com/shansen18/BootCamp/blob/9b56f408d3a242161cc1027d8fd6bf615be8a870/Week11/Screen%20Shots/disable%20and%20unistall%20ufw.JPG)

#### Enable and start \`firewalld\`

By default, these service should be running. If not, then run the
following commands:

\- Run the commands that enable and start \`firewalld\` upon boots and
reboots.

\`\`\`bash

sudo apt-get install firewalld

sudo systemctl enable firewalld

sudo systemctl start firewalld

\`\`\`

Note: This will ensure that \`firewalld\` remains active after each
reboot.

![install firewalld](https://github.com/shansen18/BootCamp/blob/9b56f408d3a242161cc1027d8fd6bf615be8a870/Week11/Screen%20Shots/install%20firewalld.JPG)


#### Confirm that the service is running.

\- Run the command that checks whether or not the \`firewalld\` service
is up and running.

\`\`\`bash

sudo firewall-cmd --state

\`\`\`

![firewalld state](https://github.com/shansen18/BootCamp/blob/9b56f408d3a242161cc1027d8fd6bf615be8a870/Week11/Screen%20Shots/firealld%20enable%20start%20state.JPG )

#### List all firewall rules currently configured.

Next, lists all currently configured firewall rules. This will give you
a good idea of what\'s currently configured and save you time in the
long run by not doing double work.

\- Run the command that lists all currently configured firewall rules:

\`\`\`bash

sudo firewall-cmd --list-all

\`\`\`

![firewalld list-all0(https://github.com/shansen18/BootCamp/blob/main/Week11/Screen%20Shots/firewall%20list%20all%201.JPG)]

\- Take note of what Zones and settings are configured. You many need to
remove unneeded services and settings.

#### List all supported service types that can be enabled.

\- Run the command that lists all currently supported services to see if
the service you need is available

\`\`\`bash

sudo firewall-cmd --get-services

\`\`\`

![service](https://github.com/shansen18/BootCamp/blob/9b56f408d3a242161cc1027d8fd6bf615be8a870/Week11/Screen%20Shots/firewalld%20services.JPG)

\- We can see that the \`Home\` and \`Drop\` Zones are created by
default.

#### Zone Views

\- Run the command that lists all currently configured zones.

\`\`\`bash

sudo firewall-cmd --list-all-zones

\`\`\`

![list zones](https://github.com/shansen18/BootCamp/blob/9b56f408d3a242161cc1027d8fd6bf615be8a870/Week11/Screen%20Shots/firewalld%20zones.JPG)

\- We can see that the \`Public\` and \`Drop\` Zones are created by
default. Therefore, we will need to create Zones for \`Web\`, \`Sales\`,
and \`Mail\`.

#### Create Zones for \`Web\`, \`Sales\` and \`Mail\`.

\- Run the commands that creates Web, Sales and Mail zones.

\`\`\`bash

sudo firewall-cmd --new-zone=Mail --permanent

sudo firewall-cmd --new-zone=Sales --permanent

sudo firewall-cmd --new-zone=Web -permanent

\`\`\`

#### Set the zones to their designated interfaces:

\- Run the commands that sets your \`eth\` interfaces to your zones.

\`\`\`bash

sudo firewall-cmd --zone=Mail --change interface=ETH3 \--permanent

sudo firewall-cmd --zone=Sale --change interface=ETH2 \--permanent

sudo firewall-cmd --zone=Web --change interface=ETH1 \--permanent

sudo firewall-cmd --zone=public --change interface=ETH0 --permanent

\`\`\`

#### Add services to the active zones:

\- Run the commands that add services to the \*\*public\*\* zone, the
\*\*web\*\* zone, the \*\*sales\*\* zone, and the \*\*mail\*\* zone.

\- Public:

\`\`\`bash

sudo firewall-cmd --add-service=http --zone=public \--permanent

sudo firewall-cmd --add-service=https --zone=public \--permanent

sudo firewall-cmd --add-service=pop3 --zone=public \--permanent

sudo firewall-cmd --add-service=smtp --zone=public \--permanent

![adding zones](https://github.com/shansen18/BootCamp/blob/9b56f408d3a242161cc1027d8fd6bf615be8a870/Week11/Screen%20Shots/adding%20more%20services%20to%20zones.JPG)


\`\`\`

\- Web:

\`\`\`bash

sudo firewall-cmd --add-service=http --zone=Web \--permanent

\`\`\`

\- Sales

\`\`\`bash

sudo firewall-cmd --add-service=https --zone=Sale \--permanent

\`\`\`

\- Mail

\`\`\`bash

sudo firewall-cmd --add-service=smtp --zone=Mail \--permanent

sudo firewall-cmd --add-service=pop3 --zone=Mail --permanent

![Binding hardware](https://github.com/shansen18/BootCamp/blob/9b56f408d3a242161cc1027d8fd6bf615be8a870/Week11/Screen%20Shots/Binding%20hardware%20to%20zone.JPG)

\`\`\`

\- What is the status of \`http\`, \`https\`, \`smtp\` and \`pop3\`?

#### Add your adversaries to the Drop Zone.

\- Run the command that will add all current and any future blacklisted
IPs to the Drop Zone.

\`\`\`bash

sudo firewall-cmd --zone=drop --add-source=10.208.56.23 \--permanent

sudo firewall-cmd --zone=drop --add-source=135.95.103.76 \--permanent

sudo firewall-cmd --zone=drop --add-source=76.34.169.118 --permanent

![dropzone](https://github.com/shansen18/BootCamp/blob/9b56f408d3a242161cc1027d8fd6bf615be8a870/Week11/Screen%20Shots/ips%20to%20dropzone.JPG)

\`\`\`

#### Make rules permanent then reload them:

It\'s good practice to ensure that your \`firewalld\` installation
remains nailed up and retains its services across reboots. This ensure
that the network remains secured after unplanned outages such as power
failures.

\- Run the command that reloads the \`firewalld\` configurations and
writes it to memory

\`\`\`bash

\$ firewall-cmd --reload

\`\`\`

#### View active Zones

Now, we\'ll want to provide truncated listings of all currently
\*\*active\*\* zones. This a good time to verify your zone settings.

\- Run the command that displays all zone services.

\`\`\`bash

sudo firewall-cmd --get-active-zones


![active-zone](https://github.com/shansen18/BootCamp/blob/9b56f408d3a242161cc1027d8fd6bf615be8a870/Week11/Screen%20Shots/firewall%20active-zones.JPG)
\`\`\`

#### Block an IP address

\- Use a rich-rule that blocks the IP address \`138.138.0.3\`.

\`\`\`bash

sudo firewall-cmd \--zone=public --add-rich-rule=\'rule family="ipv4"
source address="138.138.0.3" reject\'


![richrule](https://github.com/shansen18/BootCamp/blob/9b56f408d3a242161cc1027d8fd6bf615be8a870/Week11/Screen%20Shots/adding%20rich%20rule.JPG)
\`\`\`

#### Block Ping/ICMP Requests

Harden your network against \`ping\` scans by blocking \`icmp ehco\`
replies.

\- Run the command that blocks \`pings\` and \`icmp\` requests in your
\`public\` zone.

\`\`\`bash

sudo firewall-cmd --zone=public --add-icmp-block=echo-reply
\--add-icmp-block=echo-request

![Echo request](https://github.com/shansen18/BootCamp/blob/9b56f408d3a242161cc1027d8fd6bf615be8a870/Week11/Screen%20Shots/echo%20reply%20to%20public.JPG)
\`\`\`

#### Rule Check

Now that you\'ve set up your brand new \`firewalld\` installation, it\'s
time to verify that all of the settings have taken effect.

\- Run the command that lists all of the rule settings. Do one command
at a time for each zone.

\`\`\`bash

sudo firewall-cmd --zone=public --list-all

sudo firewall-cmd --zone=Web --list-all

sudo firewall-cmd --zone=Mail --list-all

sudo firewall-cmd --zone=Sales --list-all

\`\`\`

\- Are all of our rules in place? If not, then go back and make the
necessary modifications before checking again.

Congratulations! You have successfully configured and deployed a fully
comprehensive \`firewalld\` installation.

\-\--

##\# Part 3: IDS, IPS, DiD and Firewalls

Now, we will work on another lab. Before you start, complete the
following review questions.

#### IDS vs. IPS Systems

1\. Name and define two ways an IDS connects to a network.

Answer 1: SPAN or Mirrored Port

Answer 2: Network Tap

2\. Describe how an IPS connects to a network.

Answer:. In line right behind the firewall, using a a span or network
tap

3\. What type of IDS compares patterns of traffic to predefined
signatures and is unable to detect Zero-Day attacks?

Answer: Signiture based ids

4\. Which type of IDS is beneficial for detecting all suspicious traffic
that deviates from the well-known baseline and is excellent at detecting
when an attacker probes or sweeps a network?

Answer: Anomaly based

#### Defense in Depth

1\. For each of the following scenarios, provide the layer of Defense in
Depth that applies:

1. A criminal hacker tailgates an employee through an exterior door into
a secured facility, explaining that they forgot their badge at home.

Answer: Physical

2. A zero-day goes undetected by antivirus software.

Answer: Application

3. A criminal successfully gains access to HRâ€™s database.

Answer: Data Security

4. A criminal hacker exploits a vulnerability within an operating
system.

Answer: Host Security

5. A hacktivist organization successfully performs a DDoS attack, taking
down a government website.

Answer: Newtwork Security

6. Data is classified at the wrong classification level.

Answer: Policies and Procedures

7. A state sponsored hacker group successfully firewalked an
organization to produce a list of active services on an email server.

Answer: Perimeter

2\. Name one method of protecting data-at-rest from being readable on
hard drive.

Answer: Data encryption on the HDD

3\. Name one method to protect data-in-transit.

Answer: encrypt connections, such as https, ssl, ftp, tls

4\. What technology could provide law enforcement with the ability to
track and recover a stolen laptop.

Answer: Software such as lojack, that can locate and wipe a laptop if
stolen

5\. How could you prevent an attacker from booting a stolen laptop using
an external hard drive?

Answer: Startup password, and disable the boot from usb/cd

#### Firewall Architectures and Methodologies

1\. Which type of firewall verifies the three-way TCP handshake? TCP
handshake checks are designed to ensure that session packets are from
legitimate sources.

Answer: Circuit Level Gateways

2\. Which type of firewall considers the connection as a whole? Meaning,
instead of looking at only individual packets, these firewalls look at
whole streams of packets at one time.

Answer: Stateless Firewall

3\. Which type of firewall intercepts all traffic prior to being
forwarded to its final destination. In a sense, these firewalls act on
behalf of the recipient by ensuring the traffic is safe prior to
forwarding it?

Answer: Proxy Firewalls

4\. Which type of firewall examines data within a packet as it
progresses through a network interface by examining source and
destination IP address, port number, and packet type- all without
opening the packet to inspect its contents?

Answer: Next Generation Firewalls

5\. Which type of firewall filters based solely on source and
destination MAC address?

Answer: Media access control firewall

##\# Bonus Lab: \"Green Eggs & SPAM\"

In this activity, you will target spam, uncover its whereabouts, and
attempt to discover the intent of the attacker.

\- You will assume the role of a Jr. Security administrator working for
the Department of Technology for the State of California.

\- As a junior administrator, your primary role is to perform the
initial triage of alert data: the initial investigation and analysis
followed by an escalation of high priority alerts to senior incident
handlers for further review.

\- You will work as part of a Computer and Incident Response Team
(CIRT), responsible for compiling \*\*Threat Intelligence\*\* as part of
your incident report.

#### Threat Intelligence Card

\*\*Note\*\*: Log into the Security Onion VM and use the following
\*\*Indicator of Attack\*\* to complete this portion of the homework.

Locate the following Indicator of Attack in Sguil based off of the
following:

\- \*\*Source IP/Port\*\*: \`188.124.9.56:80\`

\- \*\*Destination Address/Port\*\*: \`192.168.3.35:1035\`

\- \*\*Event Message\*\*: \`ET TROJAN JS/Nemucod.M.gen downloading EXE
payload\`

Answer the following:

1\. What was the indicator of an attack?

- Hint: What do the details of the reveal?

Answer: Tcp \$external_net \$Http_Ports → \$home_net any (msg:" ET
Trohan HS/Nemucod.m.gen downloading Ece Payload.

