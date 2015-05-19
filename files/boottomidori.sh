#!/bin/sh
# Part of raspi-config http://github.com/asb/raspi-config
#
# See LICENSE file for copyright and license details

# Should be installed to /etc/profile.d/boottoscratch.sh to force scratch to run upon boot

# You may also want to set automatic login in /etc/inittab on tty1 by adding a
# line such as the following (raspi-config does this for you):
# 1:2345:respawn:/bin/login -f pi tty1 </dev/tty1 >/dev/tty1 2>&1 # BTS_TO_DISABLE

if [ $(tty) = "/dev/tty1" ]; then
  printf "openbox --config-file /home/pi/boottomidori/openbox_rc.xml & \
      unclutter & \
      /home/pi/boottomidori/autostart.sh" | xinit /dev/stdin
  printf "\n\n\nRestarting Midori in 5 seconds, hit ctrl-C to cancel\n" && sleep 5 && /bin/bash $0
fi
