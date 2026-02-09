#!/bin/bash

echo "Checking for an existing EDT MOTD..."

MOTD_URL="https://raw.githubusercontent.com/tenbyte/edtmotd/refs/heads/main/rhel/edt-motd.sh"
MOTD_SCRIPT="/etc/profile.d/edt-motd.sh"

if [[ -f "$MOTD_SCRIPT" ]]; then
    echo "Existing EDT MOTD found. Overwriting..."
else
    echo "No EDT MOTD found. Adding a new one..."
fi

sudo wget -O "$MOTD_SCRIPT" "$MOTD_URL"

echo "Making the EDT MOTD script executable..."
sudo chmod +x "$MOTD_SCRIPT"

echo "EDT MOTD setup complete!"
echo "Changes will be visible on next login."

echo "Cleaning up..."
rm -- "$0"
