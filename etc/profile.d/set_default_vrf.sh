if [[ "$SHELL" != "/bin/vbash" && "$SHELL" != "/sbin/radius_shell" ]]; then
	# only do bindings if vbash and radius_shell
	# only execute this in login
	# check if vrf is default or not
	if [[ -n $(ip vrf identify) ]]; then
		# set to default vrf
		# this script will be executed with --login option
		# but if it's in default vrf, it will not infinite execute new shell
		exec sudo ip vrf exec default sudo -u $USER $SHELL --login
	fi
fi
