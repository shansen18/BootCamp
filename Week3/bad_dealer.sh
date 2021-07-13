#!/bin/bash/

# below searches all files ending in schedule for the dealer working roullette
# at the time listed.
awk '/05:00:00 AM/ {print $1,$2,$5,$6}' *schedule > Dealers_working_during_los$
awk '/08:00:00 AM/ {print $1,$2,$5,$6}' *schedule >> Dealers_working_during_lo$
awk '/02:00:00 PM/ {print $1,$2,$5,$6}' *schedule >> Dealers_working_during_lo$

# below searches the files starting with the four digit date followed by
# the * used as a wild card. 
awk '/08:00:00 PM/ {print $1,$2,$5,$6}' 0310* 0312* >> Dealers_working_during_$
awk '/11:00:00 PM/ {print $1,$2,$5,$6}' 0310* 0312* >> Dealers_working_during_$

# this searches the resuls for the dealer Billy Jones, and puts how many
# times he was working at the end of the output file.
grep "Billy Jones" Dealers_working_during_losses | wc -l >> Dealers_working_du$

# this takes the data in the output file and moves it to the notes file. 
cat Dealers_working_during_losses > Notes_Dealer_Analysis

