# Computer Infrastructure Tasks & Project

This repository includes two sections: **Tasks** and **Project**. The **Tasks** section focuses on foundational command-line operations, timestamping, and scripting. The **Project** section will integrate these tasks into a more comprehensive application.

## Tasks Overview

- **Directory Creation**: Created directory structures with `mkdir`, navigating and verifying using `cd` and `ls`.
- **Timestamping**: Utilized the `date` command to append and format timestamps, with automated file creation.
- **Weather Data Download**: Downloaded weather data using `wget`, generating timestamped filenames.
- **Bash Scripting**: Automated the download and file naming processes through a Bash script.
- **Data Exploration**: Analyzed downloaded weather data using pandas in Python, focusing on key metrics like temperature, wind speed, and humidity.

## Dependencies
- **Bash**: Required for scripting and automation (`#!/usr/bin/bash`)
- **wget**: For downloading data (`sudo apt-get install wget` for linux, while running on windows codespaces was used.)
- **Python**: For data analysis with pandas (`pip install pandas`)
- **pandas**: Python library for handling data (`pip install pandas`) 

The **Tasks** section provides the groundwork for more advanced project integration.

## Automation section Notes

weather.sh filepath amended to run locally as the original filepath was initially run in codespaces. [Cron Tutorial Video](https://www.youtube.com/watch?v=v952m13p-b4&t=51s) was a helpful resource for both explaining cron and also initialising your first cron job. Cronjobs are accessible through what is called the [crontab](https://www.techtarget.com/searchdatacenter/definition/crontab) which, for my current purposes is simply a table(tab) of scheduled commands.`crontab -l` lists all current cronjobs on the machine and `crontab -e` enables the editing of said crontab. I got the cronjob working using the `29 15 * * * /home/gally/Documents/repos/computer_infrastructure/weather.sh` as an initial test, the time on the above job was just for testing purposes. 

1. Wrote a basic workflow in the weather-data.yml using [Github Docs](https://docs.github.com/en/actions/writing-workflows/choosing-when-your-workflow-runs/events-that-trigger-workflows#workflow_dispatch) & [GitHub Actions Video by goobar](https://www.youtube.com/watch?v=Sb_zLeHEVqQ&t=115s) as an aid, and triggered the workflow manually from github actions tab but it failed with the error code `Process completed with exit code 127.`

2/3/4/5. I added cron and schedule syntax [crontab guru](https://crontab.guru/) to the yaml to see if that helps, the cron is due to run in 3 mins but in the meantime I manually triggered the job after pushing the update and received the same error as above. Nothing happened at the scheduled cron of 2pm 04.11. Great resource for cron in github actions [Techielass cron expressions](https://youtu.be/kh7piyS2XeE?t=186). 
Implemented some changes using the resources above and got a lovely green tick on the task! unfortunately I included both checkout in the yml file to clone the REPO and amended the script in the same commit so not quite sure yet which was the issue if not both.

6. Need to edit the workflow to enable the commit and push of new weather JSONs back to the Repo. This will be written into the yaml file most likely.
