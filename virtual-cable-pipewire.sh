#!/usr/bin/env bash
# Create a virtual sink that can be set as a monitor in OBS
pactl load-module module-null-sink sink_name=VirtualSpeaker sink_properties=device.description=VirtualSpeaker

# Link it with a virtual source that is visible in pulseaudio apps like Zoom
pactl load-module module-null-sink media.class=Audio/Source/Virtual sink_name=VirtualMic channel_map=front-left,front-right
pw-link VirtualSpeaker:monitor_FL VirtualMic:input_FL
pw-link VirtualSpeaker:monitor_FR VirtualMic:input_FR

#needs pulseaudio-utils 


#from https://luke.hsiao.dev/blog/pipewire-virtual-microphone/
