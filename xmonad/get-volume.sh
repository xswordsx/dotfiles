#!/bin/bash

low=$1
high=$2

low_color=$3
mid_color=$4
high_color=$5


vol=`amixer -c 1 get Master,0 | grep -E '[0-9]+\%' -o`
vol="${vol%?}"
muted=`amixer -c 1 get Master,0 | grep -E '\[off\]'`

if [ $vol -le $low ] ; then
	return_color=$low_color
else
	if [ $vol -ge $high ] ; then
		return_color=$high_color
	else
		return_color=$mid_color
	fi
fi


if [ "$muted" = "[off]" ] ; then
  echo "$vol% [<fc=#$low_color>muted</fc>]"
else
  echo "<fc=#$return_color>$vol%</fc>"
fi
