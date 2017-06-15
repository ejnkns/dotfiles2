#!/bin/bash

ip link set wlp16s0 up
a=$( iw dev wlp16s0 scan | grep SSID)
echo "networks are:"
echo $a
if [[ "$a" == *"SSID: UniWireless"* ]]; then
	echo "found UniWireless"
	wpa_supplicant -B -D nl80211,wext -i wlp16s0 -c /home/ejnkns/.wifi/uniwireless.conf
	dhcpcd wlp16s0
elif [[ "$a" == *"SSID: Sam's wifi"* ]]; then	
	echo "found Sam's wifi"
	wpa_supplicant -B -D nl80211,wext -i wlp16s0 -c /home/ejnkns/.wifi/home.conf
	dhcpcd wlp16s0
elif [[ "$a" == *"SSID: OPTUSVA00A6A"* ]]; then	
	echo "found clarence"
	wpa_supplicant -B -D nl80211,wext -i wlp16s0 -c /home/ejnkns/.wifi/clarence.conf
	dhcpcd wlp16s0
fi
