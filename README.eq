# http://www.gerrelt.nl/RaspberryPi/wordpress/equalizer/
#
# https://www.hifiberry.com/build/documentation/guide-adding-equalization-using-alsaeq/

sudo apt-get install -y libasound2-plugin-equal

asound.conf (/etc?)
-------------------
pcm.!default {
  type plug
  slave.pcm plugequal;
}
ctl.!default {
  type hw card 0
}
ctl.equal {
  type equal;
  controls "/home/pi/.alsaequal.bin"
}
pcm.plugequal {
  type equal;
  slave.pcm "plughw:0,0";
  controls "/home/pi/.alsaequal.bin"
}
pcm.equal {
  type plug;
  slave.pcm plugequal;
}
------------------

# To set the equalizer, you need to start alsamixer on the new “equal” device:
alsamixer -D equal

