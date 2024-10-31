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