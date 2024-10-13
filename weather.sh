#!/usr/bin/bash

# wget -O $(date +"%Y%m%d_%H%M%S").json https://prodapi.metweb.ie/observations/athenry/today -P /workspaces/computer_infrastructure/data/weather - Original Script with -P

# Rearranged script that fixes the -O -P conflict.
wget -O /workspaces/computer_infrastructure/data/weather/$(date +"%Y%m%d_%H%M%S").json https://prodapi.metweb.ie/observations/athenry/today