## Week 15: Web Vulnerabilities and Hardening

 
### Web Application 1: Your Wish is My Command Injection.

In this section of the homework we used the DVWA website to perform a command injection on a webpage This is a very easy exploit that can be done on some web pages. On the page we exploited, there was a box to input an ip address to ping. 
So the way we went about this was put in a ip address to ping and then right after the IP address we put a &&, which means to run the next command as long as the first completes successfully. Since we know that this page runs a ping command we are able to get it to run other commands. In the homework, like in the real world we are trying to get the etc/hosts and etc/passwd 

![command_injection1](https://github.com/shansen18/BootCamp/blob/dc469714ffbdfe6da5332b529c610d221305d869/Week15/Images/Command_Injection_hosts.JPG)

![command_injection2](https://github.com/shansen18/BootCamp/blob/dc469714ffbdfe6da5332b529c610d221305d869/Week15/Images/Command_Injection_passwd.JPG)




### Command Injection Mitigation

One of the easiest ways to prevent this type of command injection is to not allow the special characters that can be used to inject additional commands. This is easy but not always effective. Which leads me to perhaps the best and most common practice, the practice of least privileges. This would mean that the user that the page is installed on and running on is only allowed to run the commands it needs for the webpage to work. 




### Web Application 2: A Brute Force to Be Reckoned With

In this part of the homework we used Burp Suite to brute force a web page. Brute forcing is when you run a list of user names against a list of passwords and try to log in to applications or a computer with them. These lists of user names and passwords could be something found on a victims network or computer. Brute forcing a computer or website can take considerable time depending on how big the list of user names and potential passwords you are using. If you are just blindly trying to brute force a password it could take years depending on the length of the password. 

![brutefoce](https://github.com/shansen18/BootCamp/blob/dc469714ffbdfe6da5332b529c610d221305d869/Week15/Images/burpsuite_bruteforce_resultr.JPG)





### Brute Force Mitigation 

As stated above, one of the ways to mitigate against a brute force attack is to have a minimum of 8 character password. This is business standard of today. 

A way to mitigate which complements the minimum password length is to require special characters as well. This too is a standard business practice in todays world. 

But even with those two policies combined it could take a person a matter of hours to crack the password. So to mitigate the risk even further the log on policy should be to lock the account for a few m inutes after 3 failed attempts, and get progressively long for each consecutive failed attempt. 

A 2 factor authentication can be used as well, that way if the password does managed to get cracked, a hacker can't use it without the 2nd authentication code. 




### Web Application 3: Where's the BeEF? AKA Cross site scripting

For this activity we used a cross site scripting application called BeEf. What BeEf does is basically infects a remote users browser and makes it a "zombie" awaiting instructions from the hacker. THe hacker can run many different exploits through the browser. One such attack that can be ran through BeEf is give an alert from what appears to be Facebook saying that you need to login again. When the victim puts in their credentials they are sent to the hacker, and not the hacker has the credentials. 

![BeEF1](https://github.com/shansen18/BootCamp/blob/dc469714ffbdfe6da5332b529c610d221305d869/Week15/Images/Beefhook_Pettytheft.JPG)



 
### Cross site scripting Mitigation

Encode data on output.
 At the point where user-controllable data is output in HTTP responses, encode the output to prevent it from being interpreted as active content. Depending on the output context, this might require applying combinations of HTML, URL, JavaScript, and CSS encoding.
Use appropriate response headers.
 To prevent XSS in HTTP responses that aren't intended to contain any HTML or JavaScript, you can use the Content-Type and X-Content-Type-Options headers to ensure that browsers interpret the responses in the way you intend.
Content Security Policy.
 As a last line of defense, you can use Content Security Policy (CSP) to reduce the severity of any XSS vulnerabilities that still occur.