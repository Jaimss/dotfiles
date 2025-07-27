#!/bin/bash
# manually load modules if you want to use virtualbox
# i have them disabled (see empty file in /etc/modules-load.d/virtualbox-host-dkms.conf)
# because I don't want these to load all the time
sudo modprobe vboxdrv
sudo modprobe vboxnetadp
sudo modprobe vboxnetflt
