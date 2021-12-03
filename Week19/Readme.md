## Part 1: Windows Server Attack
Note: This is a public-facing windows server that VSI employees access.

Question 1

Several users were impacted during the attack on March 25th.
Based on the attack signatures, what mitigations would you recommend to protect each user account? 
**An Attempt was made to reset an account password**

![signitureheat](https://github.com/shansen18/BootCamp/blob/f7139148dd0857030390cce43825491283258222/Week19/Images/signatureheat.JPG)
![signiturebar](https://github.com/shansen18/BootCamp/blob/f7139148dd0857030390cce43825491283258222/Week19/Images/top%20signature%20bar.JPG)


Provide global mitigations that the whole company can use and individual mitigations that are specific to each user.

**First we have to figure out what type of attack this is. Looking at the images above I would have to say that this is a brute force attack. With that knowledge, we can now figure out how to mitigate the attack.**
- **Require strong passwords. Minimum of eight characters including numbers and special characters**
- **Lock out accounts after 3 attempts for 1 minute.**
- **Permanently lock the account after the fifth consecutive lockout. Employee would need to contact their IT to reset the password and unlock the account**

Question 2

VSI has insider information that JobCorp attempted to target users by sending "Bad Logins" to lock out every user.
What sort of mitigation could you use to protect against this?


Part 2: Apache Webserver Attack:

Question 1

Based on the geographic map, recommend a firewall rule that the networking team should implement.
Provide a "plain english" description of the rule.

**Block all incoming HTTP traffic where the source IP comes from the city of Ukraine."**


![geoip1](https://github.com/shansen18/BootCamp/blob/dc3d5fc139ddcbeb7954583a915c5e27f0e6c989/Week19/Images/Apachegeoip.JPG)
![geoip2](https://github.com/shansen18/BootCamp/blob/dc3d5fc139ddcbeb7954583a915c5e27f0e6c989/Week19/Images/apachegeoip2.JPG)

Question 2


VSI has insider information that JobeCorp will launch the same webserver attack but use a different IP each time in order to avoid being stopped by the rule you just created.


What other rules can you create to protect VSI from attacks against your webserver?

- **Block all incoming traffic where the POST = VSI_Account_Logon.php**
- **Block where the useragent= Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 2.0.50727987787; InfoPath.1)**