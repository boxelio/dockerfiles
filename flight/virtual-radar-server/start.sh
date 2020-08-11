#!/bin/sh

if [[ ! -f /vrs_is_setup ]]; then
	echo "Primary account has been created!"
	echo "Username: $DEFAULT_USER"
	echo "Password: $DEFAULT_PASSWORD"
	touch /vrs_is_setup
	mono /vrs/VirtualRadar.exe -createAdmin:$DEFAULT_USER -password:$DEFAULT_PASSWORD -nogui
else
	mono /vrs/VirtualRadar.exe -nogui
fi
