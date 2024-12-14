#!/bin/bash

LOW_NOTIF=false
HI_NOTIF=false
CHARGING_NOTIF=false
DISCHARGING_NOTIF=false

while ( true )
do
	BAT=$(cat /sys/class/power_supply/BAT0/capacity)
	CHARGING=$(cat /sys/class/power_supply/BAT0/status)
	if [[ $BAT -le 10 && $CHARGING == Discharging ]]
	then
		if [[ $LOW_NOTIF != true ]]
		then
			notify-send -u critical -t 0 -h int:value:$BAT "Low Battery"
			mpv ~/.scripts/low-bat.wav
			LOW_NOTIF=true
		fi
	else
		LOW_NOTIF=false
	fi

	if [[ $CHARGING == "Charging" ]]
	then
		if [[ $CHARGING_NOTIF == false ]]
		then
			notify-send -u critical -h int:value:$BAT "Charging!"
			mpv ~/.scripts/plugged.wav
			CHARGING_NOTIF=true
		fi
	else
		CHARGING_NOTIF=false
	fi
	
	if [[ $CHARGING == "Discharging" ]]	
	then
		if [[ $DISCHARGING_NOTIF == false ]]
		then
			notify-send -u critical -h int:value:$BAT "Discharging!"
			mpv ~/.scripts/unplugged.wav
			DISCHARGING_NOTIF=true
		fi
	else
		DISCHARGING_NOTIF=false
	fi

	if [[ $BAT -gt 80 ]]
	then
		if [[ $HI_NOTIF != true ]]
		then
			notify-send -u critical -h int:value:$BAT "Fully Charged"
			HI_NOTIF=true
		fi
	else 
		HI_NOTIF=false
	fi

	sleep 1
done
