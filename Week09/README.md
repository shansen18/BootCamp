## Mission 1

**The nslookup command used.**

nslookup -type=MX starwars.com


mail servers are

starwars.com mail exchanger = 1 aspmx.l.google.com.

starwars.com mail exchanger = 10 aspmx2.googlemail.com.

starwars.com mail exchanger = 5 alt1.aspx.l.google.com.

starwars.com mail exchanger = 5 alt2.aspmx.l.google.com.

starwars.com mail exchanger = 10 aspmx3.googlemail.com.
</br>
The reason that the resistance can\'t receive emails is that the records
are pointing to the wrong servers.

They are pointing to aspmx.1.google.com and aspmx2.googleemail.com. To
correct them they should read

starwars.com mail exchanger = asltx.l.google.com

and

starwars.com mail exchanger = asltx.2.google.com

![nslookup email](https://github.com/shansen18/BootCamp/blob/abf7fcecb0f2dc4f1f12063b03d67045d76889ce/Week09/Screen%20Shots/nslookup%20email%20servers.JPG)



## Mission 2


**The command?**

nslookup -type=txt theforce.net

results

theforce.net text = \"v=spf1 a mx mx:smtp.secureserver.net
include:aspmx.googlemail.com ip4:104.156.250.80 ip4:45.63.15.159
ip4:45.63.4.215\"

The reason that the alerts are going to spam is that the new ip of
45.23.176.21 hasn\'t been added to the SPF record. To fix this they
would have to run something like the following command

v=spf1 a mx ip4:45.23.176.21 -all

![nslookup spf](https://github.com/shansen18/BootCamp/blob/abf7fcecb0f2dc4f1f12063b03d67045d76889ce/Week09/Screen%20Shots/nslookup%20spf.JPG)


##Mission 3


**the command**

nslookup -type=cname www.theforce.net

Results

Server: 192.168.0.1

Address: 192.168.0.1#53

Non-authoritative answer:

www.theforce.net canonical name = theforce.net.
</br>
The reason that resistance.theforce.net isn't redirecting to
theforce.net is that there is not an entry in the cname redirecting it
the theforce.net.

To fix this an entry needs to be made into the cname records. There is
no one command to do this as it depends on the DNS provider.

But the entry should be something like

resistance.theforce.net canonical name = theforce.net

![nslookup cnames](https://github.com/shansen18/BootCamp/blob/abf7fcecb0f2dc4f1f12063b03d67045d76889ce/Week09/Screen%20Shots/nslookup%20cnames.JPG)



## Mission 4


**The command**

nslookup -type=NS princessleia.site

ResultsNon-authoritative answer:

princessleia.site nameserver = ns25.domaincontrol.com.

princessleia.site nameserver = ns26.domaincontrol.com.
</br>
To fix any issues with the loss of the primary dns server. I would a NS
record for ns2.galaxybackup.com. It would should then return a line for
the backup that looks like

princessleia.site nameserver=ns2.galaxybackup.com



## Mission 5


The OSPF shortest path from Batuu to Jedha without using N is.

Batuu,D, C, E, F, J, I, L, Q, T, V, Jedua. That should come out to 22
hops, steps, whatever you want to call it.

![galaxy network](https://github.com/shansen18/BootCamp/blob/main/Week09/Screen%20Shots/Galaxy_Network_map.png)


## Mission 6


Sender MAC address: IntelCor_55:98:ef (00:13:ce:55:98:ef)

Sender IP address: 172.16.0.101 (172.16.0.101)



## Mission 7


**Command**

nslookup -type=txt princessleia.site

Result

princessleia.site text = \"Run the following in a command line: telnet
towel.blinkenlights.nl or as a backup access in a browser:
www.asciimation.co.nz\"


[Mission 7 result](https://github.com/shansen18/BootCamp/blob/abf7fcecb0f2dc4f1f12063b03d67045d76889ce/Week09/Screen%20Shots/Mission%207%20result.JPG)