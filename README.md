# Virtual-Cables-Linux
Scripts to enable virtual cables in Linux. In particular for OBS to be used in conference software such as Jitsi and Zoom

I have included 2 scripts one for PulseAudio and another for Pipewire. 

Simply download and run the apporpiate file for your system.

For the pipewire version I found that I needed to install 'pulseaudio-utils'
fedora "sudo dnf install pulseaudio-utils"
 Ubuntu or most apt based systems "sudo apt install pulseaudio-utils"
 
also 'PulseAudio Volume Control'
 fedora "sudo dnf install pavucontrol"
 Ubuntu or most apt based systems "sudo apt install pavucontrol"

 Please only run this script when no sound devices are in use. I have found that the linking doesn't work when the device is in use. 

For pipewire ti reset use the following command.
<code>systemctl --user restart pipewire pipewire-pulse</code>


