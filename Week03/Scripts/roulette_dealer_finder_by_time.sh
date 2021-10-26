 #!/bin/bash/

#Prompts for user to put in the variable
read -p 'Input Date (four numbers): ' da
read -p 'Input time: ' ti
read -p 'Input A for AM or P for PM: ' am

#clears the screen
clear

#this echos whats in "" with the variables. 
echo "the dealer on $da at '$ti':00 '$am'M was"

#this is the code for the search based on the variables given
awk '/'${ti}':00:00 '${am}'M/ {print $5,$6}' ${da}_Dealer_schedule

