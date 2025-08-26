


cat > ssh.sh << 'EOF'
#!/bin/bash

set -e

PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINj90F9KTZKpr+wylvr0UQbqFmfA945ZXk6h3BJk9+lI y0gi@DESKTOP-49ISNSE"

SSH_DIR="$HOME/.ssh"
if [ ! -d "$SSH_DIR" ]; then
    mkdir -p "$SSH_DIR"
    chmod 700 "$SSH_DIR"
    echo "Created $SSH_DIR directory"
fi

AUTHORIZED_KEYS="$SSH_DIR/authorized_keys"

if [ -f "$AUTHORIZED_KEYS" ] && grep -Fq "$PUBLIC_KEY" "$AUTHORIZED_KEYS"; then
    echo "SSH key already exists in authorized_keys"
    exit 0
fi

echo "$PUBLIC_KEY" >> "$AUTHORIZED_KEYS"
chmod 600 "$AUTHORIZED_KEYS"

echo "SSH public key successfully added to $AUTHORIZED_KEYS"
EOF
