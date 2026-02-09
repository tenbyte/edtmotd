#!/bin/bash

echo "Checking for an existing EDT MOTD..."

MOTD_URL="https://raw.githubusercontent.com/tenbyte/edtmotd/refs/heads/main/ubuntu/edt-motd"
MOTD_SCRIPT="/etc/update-motd.d/99-edt-motd"

if [[ -f "$MOTD_SCRIPT" ]]; then
    echo "Existing EDT MOTD found. Overwriting..."
else
    echo "No EDT MOTD found. Adding a new one..."
fi

sudo wget -O "$MOTD_SCRIPT" "$MOTD_URL"

echo "Making the EDT MOTD script executable..."
sudo chmod +x "$MOTD_SCRIPT"

echo "Disabling Ubuntu's default MOTD messages..."
sudo chmod -x /etc/update-motd.d/00-header 2>/dev/null
sudo chmod -x /etc/update-motd.d/10-help-text 2>/dev/null
sudo chmod -x /etc/update-motd.d/50-motd-news 2>/dev/null

echo "Applying the new MOTD..."
run-parts /etc/update-motd.d/

echo "Cleaning up..."
rm -- "$0"

echo "EDT MOTD setup complete!"
echo "Changes will be visible on next login."
