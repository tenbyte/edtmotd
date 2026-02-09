#!/bin/bash

echo "Restoring default RHEL MOTD..."

MOTD_SCRIPT="/etc/profile.d/tenbyte-motd.sh"

if [[ -f "$MOTD_SCRIPT" ]]; then
    echo "Removing EDT MOTD script..."
    sudo rm -f "$MOTD_SCRIPT"
else
    echo "No EDT MOTD script found to remove."
fi

echo "EDT MOTD has been removed."
echo "Changes will be visible on next login."

echo "Cleaning up..."
rm -- "$0"
