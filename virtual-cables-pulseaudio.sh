#This is a script to load to virtual items in Linux
# 1 a virtual microphone that can be used in Zoom / Jitsi etc
# 2 A monitor device that can used to group different sources, like OBS
# 3 A remap to route the monitor to the mic
# 4 Finally a loop back audio device that can used to hear the stream. 
# note there is a delay, but if using OBS can fixed in the advanced audio properties. 
#To configure you should install 'PulseAudio Volume Control' (assuming you have pulseadio installed.
# fedora "sudo dnf install pavucontrol"
# Ubuntu or most apt based systems "sudo apt install pavucontrol"
#!/bin/bash

pactl load-module module-null-sink sink_name=virtspk sink_properties=device.description=Virtual_Speaker
pactl load-module module-null-sink sink_name=virtmic sink_properties=device.description=Virtual_Microphone_Sink

#Remap source
#While the null sink automatically includes a "monitor" source, many programs know to exclude monitors when listing microphones. To work around that, the module-remap-source #module lets us clone that source to another one not labeled as being a monitor:

pactl load-module module-remap-source master=virtmic.monitor source_name=virtmic source_properties=device.description=Virtual_Microphone


#Add loopback to hear 

pactl load-module module-loopback latency_msec=1

#configure loop back in pulseaudio manager. This will be needed to do each time sorry. (Once you setup it should remember)
