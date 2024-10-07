#!/usr/bin/bash

wget -O $(date +"%Y%m%d_%H%M%S").json https://prodapi.metweb.ie/observations/athenry/today -P /workspaces/computer_infrastructure/data/weather