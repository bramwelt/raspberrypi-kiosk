#! /bin/bash
unclutter -display ":0" &
midori -e Fullscreen -a file:///home/pi/boottomidori/index.html \
 -i 3600 --display ":0"
#chromium --kiosk --incognito file:///home/pi/boottomidori/manatee.jpg
