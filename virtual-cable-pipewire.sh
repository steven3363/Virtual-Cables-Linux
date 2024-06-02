#!/usr/bin/env bash
# Remove previously created Nodes
#pw-cli dump short | egrep "sink|source|tunnel" | grep Node | cut -d: -f1 | xargs -L 1 -r pw-cli destroy 

# Create sink and source
#pactl load-module module-null-sink sink_name=source object.linger=1 media.class=Audio/Source/Virtual channel_map=FL,FR
#pactl load-module module-null-sink sink_name=sink object.linger=1 media.class=Audio/Sink channel_map=FL,FR

# Link sink with source
#pw-link sink:monitor_1 source:input_1
#pw-link sink:monitor_2 source:input_2


#from https://luke.hsiao.dev/blog/pipewire-virtual-microphone/
