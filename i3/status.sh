#!/bin/sh  

# Send the header so that i3bar knows we want to use JSON:  
echo '{"version":1}'  
# Begin the endless array.  
echo '['  
# We send an empty first array of blocks to make the loop simpler:  
echo '[],'

exec conky -c /home/latunov/.conky/i3-statusbar