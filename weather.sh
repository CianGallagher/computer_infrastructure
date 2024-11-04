#!/usr/bin/bash

# Rearranged script that fixes the -O -P conflict.
wget -O ./data/weather/$(date +"%Y%m%d_%H%M%S").json https://prodapi.metweb.ie/observations/athenry/today
