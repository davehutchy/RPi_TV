#!bin/bash

# Will only work with a CEC over HDMI enabled TV
# Turn on TV (only tested on Samsung TV)
echo "on 0" | cec-client -s