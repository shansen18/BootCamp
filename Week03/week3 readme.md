
In this weeks homework assignment, we conducted an investigigation into the Lucky Duck casinos losses at the roulette table. 

The first step was to analys the players who were playing during the time off losses. So to do this, I first isolated the logs that contain the losses into its own folder.  I used the grep command in the following syntax grep - *_win* > Roulette_Losses.  This would go through the log files and extract the lines associated with a negative number indicating a loss, and pipe them to a file named Roulette_Losses. 

![Rouletter_losses](https://github.com/shansen18/BootCamp/blob/main/Week03/Images/Roulette%20Losses%20including%20count.JPG)

I then looked through this file and found the suspect player "Miley Schmidt". The homework asked how many times she played so I ran grep 'Mylie' Roulette_Losses | wc -l >> Roulette_Losses. This two part command would search the Roulette_Losses file to find any occurance of Mylie, then the wc would could how many times Mylie appeared and input that number back into the Roulette_Losses file. 

![Gep to find player](https://github.com/shansen18/BootCamp/blob/main/Week03/Images/grep%20to%20find%20how%20many%20tmes%20Miley%20played.JPG)

Next the homework wanted us to move onto to see if there was a dealer working at the roulette table at the times of the losses. So looking into the results of the Roulette_Losses file, I found that Miley had consistantly played at 5am, 8am, 2pm, every day, and 8pm, and 11pm on the 10th and 12th.  Using that knowledge I came up with the script in bad_dealer.sh it returned the result of Billy Jones.  I then modified the script and added a grep command plus word count to count how many times he was working and move it to the Dealer_working_during_losses file. I also added it to the Notes_Dealer_Analysis file. 

![dealer working](https://github.com/shansen18/BootCamp/blob/bc864db8fe5eaca30f2d74834923629f858598fc/Week03/Images/results%20of%20dealer%20working%20during%20losses%20script.JPG)

[bad dealer script](https://github.com/shansen18/BootCamp/blob/main/Week03/Scripts/bad_dealer.sh)

Under step four of the homework, it asked us to create a shellscript to see what dealer was working on a given date at a given time it is called roulette_dealer_finder_by_time.sh. The way the homework asked for it to be done was something like script.sh  variable1 variable2 variable3.  The script would then call those variable and produce a name. When I sat down and thought about this aproach I didn't like it, I knew how it would run, but whos to say if I gave the script to a manager he would know how it runs, and rememeber to put the variable into the order they needed to be in. So I decided to make the script more user friendly, by asking the user to input the variable and what the variable is. Once you put in the variables, I had the script clear the screen, and turn a message saying "the dealer on (date) at (time) was (Dealer Name)"

[roulette_dealer_finder_by_time script](https://github.com/shansen18/BootCamp/blob/bc864db8fe5eaca30f2d74834923629f858598fc/Week03/Scripts/roulette_dealer_finder_by_time.sh)

For the bonus question, it wanted us to make a script that can search dealer by date, time, and game I called it roulette_dealer_finder_by_time_and_game.sh. This was a little more dificult as I had to figure out how to select the game, as I had already figured out the date and time in step 4. I finally descided that the variable should be a number, and that each game should be assigned a number from 1-3. Doing it this way makes the script easy to modify if they want to add an additional games. I knew I would have some if then statements in the code, like many things we try, the first time was a fail. I tried to say "if [ 3 = $1] then" for each variable, and failed. After some research I found the way to do this was "if [ $1 -eq 1 ] then" this allowed the statement to work. But it only worked for the first statement, the other two if statements failed. So doing a bit more searching I found the way to fix the last to if statements was to replace the "if" with "elif" meaning else if. This statement allowed me to add an error check for the game selection, basically if the variable doesn't equal 1-3 it will say to select a valid game.  

[roulette_dealer_finder_by_time_and_game script](https://github.com/shansen18/BootCamp/blob/bc864db8fe5eaca30f2d74834923629f858598fc/Week03/Scripts/roulette_dealer_finder_by_time_and_game.sh)

***Scripts roulette_dealer_finder_by_time.sh, and roulette_dealer_finder_by_time_and_game.sh are working. To make them work, one would need to run them from the same folder that contains:

[0315_Dealer_schedule](https://github.com/shansen18/BootCamp/blob/bc864db8fe5eaca30f2d74834923629f858598fc/Week03/0315_Dealer_schedule)

[0312_Dealer_schedule](https://github.com/shansen18/BootCamp/blob/bc864db8fe5eaca30f2d74834923629f858598fc/Week03/0312_Dealer_schedule)

[0310_Dealer_schedule](https://github.com/shansen18/BootCamp/blob/bc864db8fe5eaca30f2d74834923629f858598fc/Week03/0310_Dealer_schedule)