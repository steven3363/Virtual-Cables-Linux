#!/usr/bin/env bash

#This is a script to load to virtual items in Linux
# 1 a virtual microphone that can be used in Zoom / Jitsi etc
# 2 A monitor device that can used to group different sources, like OBS
# 3 A remap to route the monitor to the mic
# 4 Finally a loop back audio device that can used to hear the stream. 
# note there is a delay, but if using OBS can fixed in the advanced audio properties.
#Pipewire is drop in replacement for Pulseaudio so we can use those tools to help configure after setup.
#You will need 'pulseaudio-utils' and 'PulseAudio Volume Control' 
# fedora "sudo dnf install pavucontrol pulseaudio-utils"
# Ubuntu or most apt based systems "sudo apt install pavucontrol pulseaudio-utils" #please tell me if this wrong I don't have apt to test sorry.


echo "You should reset Pipewire to last defaults  before 'running programs may need to be restarted. OBS will need this. Best to run when no apps are running " 

echo " "

echo "VirtualSpeaker"
# Create a virtual sink that can be set as a monitor in OBS
pactl load-module module-null-sink sink_name="VirtualSpeaker" sink_properties=device.description=VirtualSpeaker
echo " "
echo "VirtualMic"
# Link it with a virtual source that is visible in pulseaudio apps like Zoom
pactl load-module module-null-sink media.class=Audio/Source/Virtual sink_name="VirtualMic" channel_map=front-left,front-right
echo " "
echo "Linking together"
pw-link VirtualSpeaker:monitor_FL VirtualMic:input_FL
pw-link VirtualSpeaker:monitor_FR VirtualMic:input_FR
echo " "
echo "Loopback"
#Add loopback to hear comment out if you wish to disable
pactl load-module module-loopback sink_name="LoopbackSync" source="VirtualSpeaker.monitor"
echo " "
echo " "
echo "If no errors done!"
echo " "
echo " "
echo " To configure loop back in pulseaudio manager. This will be needed to do each time sorry."
echo "Use this comand to reset:"
echo "systemctl --user restart pipewire pipewire-pulse"
echo "from https://luke.hsiao.dev/blog/pipewire-virtual-microphone/"
echo "Updates at : https://github.com/steven3363/Virtual-Cables-Linux"
