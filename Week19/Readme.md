## Part 1: Windows Server Attack
Note: This is a public-facing windows server that VSI employees access.

Question 1

Several users were impacted during the attack on March 25th.
Based on the attack signatures, what mitigations would you recommend to protect each user account? 
**An Attempt was made to reset an account password**

Provide global mitigations that the whole company can use and individual mitigations that are specific to each user.

**First we have to figure out what type of attack this is. Looking at the images below I would have to say that this is a brute force attack. With that knowledge, we can now figure out how to mitigate the attack.**
- **Require strong passwords. Minimum of eight characters including numbers and special characters**
- **Lock out accounts after 3 attempts for 1 minute.**
- **Permanently lock the account after the fifth consecutive lockout. Employee would need to contact their IT to reset the password and unlock the account**

Question 2

VSI has insider information that JobeCorp attempted to target users by sending "Bad Logins" to lock out every user.
What sort of mitigation could you use to protect against this?


Part 2: Apache Webserver Attack:

Question 1

Based on the geographic map, recommend a firewall rule that the networking team should implement.
Provide a "plain english" description of the rule.

For example: "Block all incoming HTTP traffic where the source IP comes from the city of Los Angeles."


Provide a screen shot of the geographic map that justifies why you created this rule.


Question 2


VSI has insider information that JobeCorp will launch the same webserver attack but use a different IP each time in order to avoid being stopped by the rule you just created.


What other rules can you create to protect VSI from attacks against your webserver?

Conceive of two more rules in "plain english".
Hint: Look for other fields that indicate the attacker.