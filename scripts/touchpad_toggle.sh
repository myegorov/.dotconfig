#!/bin/bash

#add the following lines to $HOME/.config/openbox/rc.xml:
#    <!-- Keybindings for toggling touchpad -->
#      <keybind key="XF86TouchpadToggle">
#        <action name="Execute">
#       	  <execute>/home/max/scripts/touchpad_toggle</execute>
#       </action>
#      </keybind>

#find value of $PAD with 'xinput list'
PAD='SynPS/2 Synaptics TouchPad'
A=`xinput list-props "$PAD" | sed -n -e 's/.*Device Enabled ([0-9][0-9]*):\t\(.*\)/\1/p' `

if [ $A -eq 1 ]; then
  xinput set-int-prop "$PAD" "Device Enabled" 8 0
else
  xinput set-int-prop "$PAD" "Device Enabled" 8 1
fi
