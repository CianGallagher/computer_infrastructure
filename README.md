# Terminal_Scripting
The purpose of the assessment is for you to demonstrate ability in the following.

    Use, configure, and script in a command line interface environment.

    Manipulate and move data and code using the command line.

    Compare commonly available software infrastructures and architectures.

    Select appropriate infrastructure for a given computational task.

**NOTES TAKEN DURING COMPLETION OF EACH TASK**

The below commands refer to terminal commands. Bash and cmder were used depending on what OS I was using, Bash for linux and cmder for windows.

Task 1: Create Directory Structure - `mkdir` used to create directories with `cd` & `ls` used to navigate, was already familiar with these commands.

Task 2: Timestamps - Navigated through repo directories again with `cd` & `ls`. Unfamiliar with `date` command but followed Ian's github instructions to complete the task. The command entered ten times was `date >> now.txt`. This instruction fetches current date/time and appends it onto the file `now.txt`, if `now.txt` doesn't exist `date >> now.txt` creates it. The `more` command was used to check the content of `now.txt` in the terminal window. I briefly checked online to see if there was a way to execute `date >> now.txt` n number of times but couldn't see one.

Task 3: Formatting Timestamps - I started this task by reading through `man date` but couldn't initially figure out exactly how to structure the formatting part of the command. By reading the outputs I later realised I was including far to many **Interpreted sequences**. Instead of including `%Y` for year I was including `%Y%Y%Y%Y`... After some trial and error with removing most of the Interpreted sequences the command `date +"%Y%m%d_%H%M%S" >> formatted.txt` eventually returned the desired format, created `formatted.txt`, and appended the new format to the txt file.

Task 4: Create Timestamped Files - Initial attempts either produced a command substitution error or several date related directories, digging deeper on why exactly these directories are created from this command `touch `date` +"%Y%m%d_%H%M%S"`. After some research I came across the unix operator "$", this incredibly useful operator enabled me to use the output of a command, in this case the date command as an input for something else. `touch $(date +"%Y%m%d_%H%M%S").txt` fetches the date in the specified format, this date is then used as the input to the touch command naming scheme. This creates the txt file with the dated title `20241007_171129.txt`.

Task 5: Download Today's Weather Data - https://phoenixnap.com/kb/wget-command-with-examples `wget`is not included with windows, may need to install. I think I'll do this via codespaces, it'll save me messing around installing tools via the command line in windows. wget is already installed on codespaces, maybe it's a default install on unix systems. I ran `wget https://phoenixnap.com/kb/wget-command-with-examples` just to see if it would work and it returned a file with it's default naming convention, once I expanded the command to include naming `wget -O weather.json https://phoenixnap.com/kb/wget-command-with-examples` the command worked but the file appears very similar to a html doc, will confirm if this is okay as I'm not very familiar with all flavours of JSON files. 
I now realise the URL I was using to fetch the JSON file wasn't the page supplied by Ian but was instead the URL I had used to learn more about wget... The correct URL is `https://prodapi.metweb.ie/observations/athenry/today`.. Correct command is `wget -O weather.json https://prodapi.metweb.ie/observations/athenry/today`, file looks good now.

Task 6: Timestamp the Data - This task might require a command joining wget and the $ operator I learned about for task 4. Something like this would be my estimation `wget -O $(date +"%Y%m%d_%H%M%S").json https://prodapi.metweb.ie/observations/athenry/today`. Worked first try, happy days. File looks good, naming looks correct, lets move on.

Task 7: Write the Script - Likely need to read up on shell scripting, completely unfamiliar but I'll have a play around first to see what I can come up with. https://www.freecodecamp.org/news/shell-scripting-crash-course-how-to-write-bash-scripts-in-linux/ & https://cloudxlab.com/assessment/displayslide/63/writing-first-shell-script are good resources.
Following the freeCodeCamp tutorial is very helpful here.Used `which bash` to find the path to my bash shell `/usr/bin/bash` which I included as the first line of my script, note this shell might differ when I'm executing outside codespaces, on windows for example. Now I'm just going to try the command from the previous task and see what happens. Nothing happened, I tried just to just echo a string onto the command line but that didn't work either, I must have incorrectly initialised the sh. It's important to include #! before the shell address as it's a convention specifying which shell program should interpret the rest of the file - https://stackoverflow.com/questions/42971986/what-does-operator-mean-in-linux.
`wget -O $(date +"%Y%m%d_%H%M%S").json https://prodapi.metweb.ie/observations/athenry/today` added to script, the JSON file is now correctly pulled from the API and named correctly but it's saved into the root directory, needs to be changed to save into `data/weather` directory. Looks like I ca use `-P` after the URL to select the directory I wish to save to - https://unix.stackexchange.com/questions/307322/how-to-set-the-destination-folder-for-wget. I added `-P /workspaces/computer_infrastructure/data/weather` to the end of the wget command in the script but nothing changed, file is still being saved into root where the script is, will look again tomorrow.

