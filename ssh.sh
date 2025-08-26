#!/bin/bash

# Script to add SSH public key to authorized_keys
# Usage: curl -s https://yourserver.com/add-ssh-key.sh | bash

set -e

# Hardcoded SSH public key - replace with your actual public key
PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINj90F9KTZKpr+wylvr0UQbqFmfA945ZXk6h3BJk9+lI y0gi@DESKTOP-49ISNSE"

# Create .ssh directory if it doesn't exist
SSH_DIR="$HOME/.ssh"
if [ ! -d "$SSH_DIR" ]; then
    mkdir -p "$SSH_DIR"
    chmod 700 "$SSH_DIR"
    echo "Created $SSH_DIR directory"
fi

# Path to authorized_keys file
AUTHORIZED_KEYS="$SSH_DIR/authorized_keys"

# Check if key already exists
if [ -f "$AUTHORIZED_KEYS" ] && grep -Fq "$PUBLIC_KEY" "$AUTHORIZED_KEYS"; then
    echo "SSH key already exists in authorized_keys"
    exit 0
fi

# Add the public key
echo "$PUBLIC_KEY" >> "$AUTHORIZED_KEYS"
chmod 600 "$AUTHORIZED_KEYS"

echo "SSH public key successfully added to $AUTHORIZED_KEYS"
echo "You can now SSH to this server using your private key"