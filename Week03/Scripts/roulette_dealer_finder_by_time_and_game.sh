#!/bin/bash

#this is where you add the variables that are required for the search. 
read -p 'Input Date (four numbers): ' da
read -p 'Input time: ' ti
read -p 'Input A for AM or P for PM: ' am
read -p 'Input 1 for blackjack, 2 for Roulette, 3 for Poker: ' j

#clears the screen
clear

#this echos whats in "" with the variables. 
echo "the dealer on $da at '$ti':00 '$am'M was"

#this if/then is the code for the search based on the variables given
#one search for each game. 
if [ $j -eq 2 ]
 then
awk '/'${ti}':00:00 '${am}'M/ {print $5,$6}' ${da}_Dealer_schedule

elif [ $j -eq 1 ] 
then
awk '/'${ti}':00:00 '${am}'M/ {print $3,$4}' ${da}_Dealer_schedule

elif [ $j -eq 3 ]
then
 awk '/'${ti}':00:00 '${am}'M/ {print $7,$8}' ${da}_Dealer_schedule
else

#my one and only error check, it only works for the game selection. 
echo 'error: select valid game.'


#this ends the if statement. 
fi
