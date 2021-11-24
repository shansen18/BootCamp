# Home Network Setup

So couple months ago I bought a server to run Security Onion to monitor my network for malicious activity. Now I have a small home network that probably will not have much in the way of malicious activity, but one can never be too safe. I also wanted to see how my traffic looked. 

When I first started out, my network was a basic home network, one modem provided by my ISP, and everything connected to that either hardwired or through WiFi. I left the IP range at the generic 192.168.0.1/24. I then upgraded my network by adding a new router to the layout. I did this so I could have control over my children's devices, and our TV's and when they could connect to the internet, as our generic modem didn't have this feature. I set the IP range on this router to 192.168.50.1/24. I did this to be less confusing to me. 
When I first decided to get a server and install Security Onion, I did some research into how to grab my network traffic, and found I needed a SPAN port or a Mirrored Port. Again my modem from our ISP did not have this feature, and having worked for them as a broadband tech, I knew that they did not have one to offer. I even called a friend of mine who still worked for the company, and had him email a fellow employee who knows about the modems, to see if there was a hidden feature for a Mirrored Port that cold be turned on, and there wasn't. I also checked up on my 2nd router, as it has more features than my modem, and the one I purchased did not. 
So in this case what did was to buy a small TPLink Managed router, this allowed me to mirror a port. I had also found a good deal on a server on craigslist and purchased it. I then hooked my TPLink switch to my modem on port 1, then my router to port 2. I then mirrored Port 3, for the inbound and outbound traffic on port 3, and hooked ports 3 and 4 to my server. This allowed me to view everything going from my router to my modem. 
I installed Security Onion within a virtualbox on my server, and pointed the monitoring port to the IP address associated with port 3. I then then made sure all my families personal devices were connected to the router. Logged into Security Onion and I had DATA. 

### Flaws in the layout

There is only one problem I have with this layout and the Security Onion Monitoring, and that is all the data is coming from my router to the modem over, so any alerts associated with any device connected to my router will all have the same IP address, thus making it harder to find out the device that generated the alert. 


**Note** I did not connect my Wife's work computer to the part of the network being monitored, as I didn't feel right doing so. 

![Map](https://github.com/shansen18/BootCamp/blob/main/Personal_Projects/Home%20Network/Images/Home%20Network%20setup.jpg)