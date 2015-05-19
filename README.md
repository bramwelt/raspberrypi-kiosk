RaspberryPi Configuration
=========================

This RaspberryPi is managed using ansible.

Files:
 * `site.yml` - contains the site playbook
 * `files` - contains various managed files
 * `hosts` - contains a inventory of managed hosts

There is a single playbook `site.yml` which is used to manage the
raspberrypi. The playbook is applied using::

    ansible-playbook -i hosts site.yml

Boot To Midori
--------------

The raspberry pi has been setup to boot straight to midori, a light weight
browser. This was done by running `raspi-config`, choosing the 'Boot to
Scratch' option, and modifying the files it generated to use midori instead.

The file for starting Openbox and X is under /etc/profile.d/. It uses the
openbox config in /home/pi/boottomidori/openbox_rc.xml and runs
/home/pi/boottomidori/autostart.sh.

Note that as soon as the browser is closed (F4, Ctrl-Q) or midori
recieves a SIGHUP, the /etc/profile.d/ script is rerun.  See
/etc/profile.d/boottomidori.sh for more info.

Warning: Do not try to resart lightdm to test changes. Because of the profile.d
script works, a second (different) openbox config will run, there will be a
second cursor, and the rendering will look exteremely off.
