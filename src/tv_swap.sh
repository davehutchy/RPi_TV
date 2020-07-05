#!bin/bash

# CEC commands for swapping TV input sources are as follows:
# HDMI 1 = 4F:82:10:00
# HDMI 2 = 4F:82:20:00
# HDMI 3 = 4F:82:30:00

# Hardcoded to do HDMI 1, because thats what my Freeview TV box is plugged into...
echo "tx 4F:82:10:00" | cec-client -s
