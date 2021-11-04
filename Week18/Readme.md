# Unit 18 Homework: Lets go Splunking!


## Step 1. 
### Background:

As the worldwide leader of importing and exporting, Vandalay Industries has been the target of many adversaries attempting to disrupt their online business. Recently, Vandaly has been experiencing DDOS attacks against their web servers.
Not only were web servers taken offline by a DDOS attack, but upload and download speed were also significantly impacted after the outage. Your networking team was provided results of a network speed run around the time of the latest DDOS attack.

Below is a CSV file containing the server speeds at the time of the attack. You are being tasked with creating a report to determine the impact that the DDOS attack had on download and upload speed.

[Server Speed Test](https://github.com/shansen18/BootCamp/blob/main/Week18/misc_files/server_speedtest.csv)


### Findings

To get to the findings from the given CVS file, I had to first create a new field called ratio. 

![ratio](https://github.com/shansen18/BootCamp/blob/main/Week18/Images/created_ratio.JPG)


I was then able to create the below table. Once that was complete it was as simple as ordering the data by time. This allowed me to see the Server speeds in chronological order. 

![Report](https://github.com/shansen18/BootCamp/blob/main/Week18/Images/Report.JPG)

According to the CVS file, I was able to calculate that the DDOS incident took place at 02-23-2020 and was first recorded at 2:30pm. As you can see in the above table, the DDOS can be seen starting when the download speeds significantly decreased. The attack seems to have continued until around 10:30pm. According to the log files the sever regained normal speeds by 11:30pm the same day, when the next data set shows the download at normal speeds. Due to the lack of data between 10:30pm and 11:30pm I would have to say the total DDOS attack lasted between 8 and 9 hours. 


## Step 2: Are We Vulnerable?


### Background

Due to the frequency of attacks, your manager needs to be sure that sensitive customer data on their servers is not vulnerable. Since Vandalay uses Nessus vulnerability scanners, you have been given the last 24 hours of scans to see if there are any critical vulnerabilities. You will create a report determining how many critical vulnerabilities exist on the customer data server. Then, build an alert to notify your team if a critical vulnerability reappears on this server.

The Nessus log report can be found at the below link

[Nessus Logs.csv](https://github.com/shansen18/BootCamp/blob/main/Week18/misc_files/nessus_logs.csv)


### Findings 

To get the information about the critical vulnerabilities, I had to first import the data from the Nessus_log.csv file. This lead to finding that there was 1849 events or vulnerabilities detected. To view these vulnerabilities I had to run the following search `source="nessus_logs.csv"` which allows me to see all the data from this cdv file. 

I then had to isolate the vulnerabilities from the Customer database server (10.11.36.23), which narrowed this list down to 243 events, or vulnerabilities. I achieved this by typing the following string in the search `source="nessus_logs.csv" dest_ip="10.11.36.23"`

From here I had to further narrow down the search to only the **Critical** events, and get a count. I ran the following string `source="nessus_logs.csv" dest_ip="10.11.36.23"  severity="critical" | top severity` in the search and the count was 49 events.

![alert1](https://github.com/shansen18/BootCamp/blob/main/Week18/Images/Nessus%20alert1.JPG)

From here I saved the alert and automated it to send to the SOC if there was more than 0 results. 

![saving alert](https://github.com/shansen18/BootCamp/blob/main/Week18/Images/Saving%20Alert.JPG)
![Created alert](https://github.com/shansen18/BootCamp/blob/main/Week18/Images/Nessus%20alert2.JPG)


## Baseline

### Background

A Vandaly server is also experiencing brute force attacks into their administrator account. Management would like you to set up monitoring to notify the SOC team if a brute force attack occurs again. Vandaly would like you to analyze the Administrator logs that document a brute force attack. Then, create a baseline of the ordinary amount of administrator bad logins and determine a threshold to indicate if a brute force attack is occurring.

[Administrator_logs.csv](https://github.com/shansen18/BootCamp/blob/main/Week18/misc_files/Administrator_logs.csv)

### Findings

To accurately search the data I ran the following string in the search `source="Administrator_logs.csv" name="An account failed to log on"` this returned 1004 events. Even though this is a lot of events, the bar graph at the top helped out. Seen in this graph we can see that the standard baseline is about 16 failed logons an hour. 

![login fails](https://github.com/shansen18/BootCamp/blob/main/Week18/Images/logon%20fails.JPG)
![graph](https://github.com/shansen18/BootCamp/blob/main/Week18/Images/Graph.JPG)

Starting at 8 am on 2/21/2020 the amount of failed logins about doubled to 34 during that hour signifying the start of a brute force attack. For the 5 hours starting at 9 am and ending at 1 pm, there was an abnormally large amount of failed logins, at around 100 failed attempts per hour. At 2pm the amount of failed logins declined to 34 failed logins, and then returned to baseline signifying the end of the attack. '

I then created another alert for the SOC team. This one would send an email if the failed logons reached 30 or more an hour. As we see from the previous attack that it started when the failed logons reached 34 failed attempts. 

![alert](https://github.com/shansen18/BootCamp/blob/main/Week18/Images/Bruteforce_Alert.JPG)