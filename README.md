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

This document summarizes the steps taken to automate weather data collection and workflow integration, along with key challenges and solutions.

---

## 1. Setting Up the Cron Job

- Modified the `weather.sh` script to run locally instead of using Codespaces.
- Found [this tutorial](https://www.youtube.com/watch?v=v952m13p-b4&t=51s) helpful for understanding cron jobs and creating my first one.
- Cron jobs are managed via the `crontab` command:
  - `crontab -l`: Lists all active cron jobs.
  - `crontab -e`: Opens the crontab for editing.
- Created an initial test job with the following entry:
  ```plaintext
  29 15 * * * /home/gally/Documents/repos/computer_infrastructure/weather.sh
  ```
  *(This time was for testing only.)*

---

## 2. Writing the GitHub Workflow

- Developed a basic workflow in `weather-data.yml` using:
  - [GitHub Docs](https://docs.github.com/en/actions/writing-workflows/choosing-when-your-workflow-runs/events-that-trigger-workflows#workflow_dispatch)
  - [GitHub Actions Tutorial by goobar](https://www.youtube.com/watch?v=Sb_zLeHEVqQ&t=115s)
- Initially, manually triggering the workflow returned this error:
  ```plaintext
  Process completed with exit code 127.
  ```

---

## 3. Debugging the Workflow

- Used [Crontab Guru](https://crontab.guru/) to refine the cron syntax in the YAML file.
- Pushed updates but faced the same error. Scheduled runs also failed at the specified time.
- [Techielass cron expressions tutorial](https://youtu.be/kh7piyS2XeE?t=186) provided additional insights.
- Ultimately succeeded with a green tick after including both `checkout` and script changes. However, I couldn't determine whether one or both adjustments resolved the issue.

---

## 4. Adding Data Commit and Push to the Repository

- Focused on enabling the workflow to commit and push weather JSON files to the repository.
- Added `git add .` and `git commit -m` commands to the workflow YAML. Encountered the following error:
  ```plaintext
  Author identity unknown

  Run
    git config --global user.email "you@example.com"
    git config --global user.name "Your Name"
  ```
- This occurred because the GitHub Actions runner lacked a configured git identity. While I could solve it locally using the commands provided, I needed a more generic solution.

---

## 5. Solving Git Push Permissions

- After configuring the git identity, I successfully added and committed changes but encountered a new error when trying to push:
  ```plaintext
  remote: Permission to CianGallagher/computer_infrastructure.git denied to github-actions[bot].
  ```
- Researched and discovered that a [GITHUB_TOKEN](https://docs.github.com/en/actions/security-for-github-actions/security-guides/automatic-token-authentication#using-the-github_token-in-a-workflow) was needed.
- Added the following to the workflow YAML:
  ```yaml
  env:
    GH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
  ```
- Removed the `GITHUB_TOKEN` secret and instead granted write permissions to the workflow. This resolved the issue, and all tests passed successfully!

---

## 6. Final Solution

By carefully debugging and leveraging resources, I successfully automated the workflow to schedule, execute, and push weather data updates to the repository.

This journey highlights the importance of persistence and leveraging available documentation and tutorials for solving automation challenges.
