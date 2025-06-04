#!/bin/bash

# if the screen won't turn back on after suspending the laptop by closing the lid
# Both systemd and swayidle were watching for your laptop lid to close, and both were trying to handle suspend
# When two different things try to control suspend and resume at the same time, sometimes the screen doesn't get turned back on properly after you open the lid
# the command below makes systemd "ignore" the lid, so now only swayidle manages suspend and resume. With just one program in control, your screen wakes up normally every time

echo -e "[Login]\nHandleLidSwitch=ignore\nHandleLidSwitchDocked=ignore" | sudo tee /etc/systemd/logind.conf
