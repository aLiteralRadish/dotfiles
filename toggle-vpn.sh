#!/bin/bash

if [[ $(nordvpn status | head -1) =~ .*D.* ]]
then
	nordvpn c chicago
else
	nordvpn d 
fi
