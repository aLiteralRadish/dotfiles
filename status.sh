#!/bin/bash
while ( true )
do
	#BATTERY
	BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)
	if [[ $(cat /sys/class/power_supply/BAT0/status) == "Charging" ]]
	then
		BATTERY_ICON=󰂄
	elif (( $BATTERY > 98 ))
	then
		BATTERY_ICON=󰁹
	elif (( $BATTERY > 90 ))
	then
		BATTERY_ICON=󰂂
	elif (( $BATTERY > 80 ))
	then
		BATTERY_ICON=󰂁
	elif (( $BATTERY > 70 ))
	then
		BATTERY_ICON=󰂀
	elif (( $BATTERY > 60 ))
	then
		BATTERY_ICON=󰁿
	elif (( $BATTERY > 50 ))
	then
		BATTERY_ICON=󰁾
	elif (( $BATTERY > 40 ))
	then
		BATTERY_ICON=󰁽
	elif (( $BATTERY > 30 ))
	then
		BATTERY_ICON=󰁼
	elif (( $BATTERY > 20 ))
	then
		BATTERY_ICON=󰁻
	elif (( $BATTERY > 10 ))
	then
		BATTERY_ICON=󰁺
	else
		BATTERY_ICON=󰂃
	fi
	BATTERY+="%"

	#WIFI
	WIFI=$(nmcli | head -n 1 | sed 's/.*connected to //')
	WIFI_ICON=󰤨

	#VPN
	VPN=$(nordvpn status | head -1 | grep -o -P "(Dis)?[Cc]onnected")
	if [[ $VPN == Connected ]]
	then
		VPN_ICON=󰱓
	else
		VPN_ICON=󰅛
	fi

	#TIME
	TIME=$(date | grep -o "[1-9]\?[0-9]:[0-9][0-9]:[0-9][0-9]")
	TIME+=" "
	TIME+=$(date | grep -o "[AP]M")
	TIME_ICON= 

	#DATE
	DATE=$(date | grep -o "\w\+\s\w\+\s\+[0-9]\+" | head -1)
	DATE+=", "
	DATE+=$(date | grep -o "[0-9]\+$")
	DATE_ICON=󰃭

	#VOLUME
	#VOLUME=$(pamixer --get-volume)
	#if (( $VOLUME > 70 ))
	#then
	#	VOLUME_ICON=
	#elif (( $VOLUME > 40 ))
	#then
	#	VOLUME_ICON=
	#elif (( $VOLUME > 10 ))
	#then
	#	VOLUME_ICON=
	#else
	#	VOLUME_ICON=
	#fi
	#VOLUME+="%"

	#BRIGHTNESS
	#BRIGHTNESS=$(brightnessctl p | head -n 2 | tail -n 1 | sed -E 's/.*\(([0-9]+)%\)/\1/')
	#BRIGHTNESS+="%"
	#BRIGHTNESS_ICON=󰖨

	#RAM
	#RAM=$(free -h | head -2 | tail -1 | cut -d" " -f 20)
	#RAM+="/"
	#RAM+=$( free -h | head -2 | tail -1 | cut -d" " -f 13)
	#RAM_ICON=

	#CPU
	#CPU=$(mpstat | tail -1 | grep -o "[0-9]\+.[0-9]\+$")
	#CPU+="%"
	#CPU_ICON=

	xsetroot -name "   $TIME   $WIFI_ICON  $WIFI   $VPN_ICON   $VPN   $BATTERY_ICON $BATTERY   $DATE_ICON  $DATE   "
	sleep 1
done
