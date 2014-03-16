#!/usr/bin/bash

echo
echo "Installing Nemo Action Script......"
echo
sleep 2
cp -v PACPL-Convert /usr/share/nemo/actions
cp -v pacpl.nemo_action /usr/share/nemo/actions
cp -v pacpl.png /usr/share/icons
echo
sleep 2
echo "Done.."