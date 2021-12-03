# Virtual Box Setup


As I have stated before, I my laptop is capable of running multiple virtual machines. This is great as I can attack another virtual box on my computer and not accidently go outside my home network and do something that is considered not ethical outside of applying it to learning. This helps me to understand attack methods, as well as defense methods. 

In virtualbox there are a several different network options. The two that I worked with are **Internal Network** and **NAT Network**

### NAT NETWORK

The **NAT Network** is basically a network between your virtual machines, they can access other hosts on the physical network as well as the internet. I do not use this type of Network when Pen testing machines for a couple reasons. First some of the machines I get are from Vulnhub, and I do not know what kind of "extra features" maybe hidden on those machines. Therefor I do not want these machines to be able to access my physical network. Second as stated before one could accidently do something that could easily be misconstrued as an actual attack. 

#### Setting up a new NAT Network is very easy to do within Virtual Box. 

1. In VirtualBox Manager, click on File, and then Prefrences
![File_pref](https://github.com/shansen18/BootCamp/blob/main/Personal_Projects/Virtualbox%20Networks/Images/NAT/File_Pref.JPG)

2. Click on Network, then on the right side of the window, click on the icon that looks like a card, and it will add a new NAT Network. The default name will be NatNetwork. 
![Add_NAT](https://github.com/shansen18/BootCamp/blob/main/Personal_Projects/Virtualbox%20Networks/Images/NAT/Add_Nat.JPG)


3. With the new NAT network selected, click on the icon of a card with a gear on the right had side of the window, this will open up the details of the network selected. In here you can change the name of the network and the network IP range. You can set port forwarding as well. I have only changed the name of the networks, so I won't delve into the other options. Once you are done in here click the OK button and then once more. This will get you back to you main VirtualBox Manager.  
![NAT_Details](https://github.com/shansen18/BootCamp/blob/main/Personal_Projects/Virtualbox%20Networks/Images/NAT/NAT_Details.JPG)

4. Click on the Virtual Machine you want to add to the newly created NAT Network, and then click on Settings, at the top of the window. 

5. In the window that opened, on the left hand column click on network. Then in the center of the network window, in the dropdown labeled Attached to:   select NAT Network. Then in the dropdown below that, you can now select the NAT Network you just created. Click OK at the bottom and your all set. 
![VBOX_NAT](https://github.com/shansen18/BootCamp/blob/main/Personal_Projects/Virtualbox%20Networks/Images/NAT/VBOX_NAT.JPG)


#### Setting up a new internal network

1. Open up a command prompt. 

2. In the command line navigate to where ever the VirtualBox folder lives. On my computer it lives at `:\Program Files\Oracle\VirtualBox`

3. Once at that location you can type in `vboxmanage dhcpserver add --network=testlab --server-ip=10.10.10.1 --lower-ip=10.10.10.2 --upper-ip=10.10.10.254 -netmask=255.255.255.0 --enable` this will add an internal DHCP server which we can now select in the internal network dropdown within VirtualBox network setting.  
- `vboxmanage` calls the virtualbox manager.
- `dhcpserver add` tells the vboxmanager your going to add a new network
- `network=testlab` defines the new networks name as testlab
- `server-ip=10.10.10.1` defines the DHCP servers IP address as 10.10.10.1, the IP address can be changed.
- `lower-ip=10.10.10.2` defines the lowest IP address of the IP range that we are going to use. This IP can be changed.
- `upper-ip=10.10.10.254` defines the highest IP address of the IP range that we are going to use. This IP can be changed.
- `netmask=255.255.255.0` this defines the subnet mask that we are going to use. This mask can be changed. 
- `enable` this enables the DHCP server being defined in this command. 

![command](https://github.com/shansen18/BootCamp/blob/main/Personal_Projects/Virtualbox%20Networks/Images/Internal/Commandline.JPG)

4. Click on the Virtual Machine you want to add to the newly created NAT Network, and then click on Settings, at the top of the window. 

5. In the window that opened, on the left hand column click on network. Then in the center of the network window, in the dropdown labeled Attached to:   select Internal Network. Then in the dropdown below that, you can now select the Internal Network you just created. Click OK at the bottom and you're all set. 

![internal Network](https://github.com/shansen18/BootCamp/blob/main/Personal_Projects/Virtualbox%20Networks/Images/Internal/internal%20network.JPG)
