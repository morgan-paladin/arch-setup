#!/bin/bash

SSH_DIR="$HOME/.ssh"
KEY_FILE="$SSH_DIR/id_ed25519"
PUB_KEY_FILE="$KEY_FILE.pub"

echo "🔍 Checking for existing SSH keys..."

if [[ -f "$KEY_FILE" && -f "$PUB_KEY_FILE" ]]; then
    echo "✅ Existing SSH key found at $KEY_FILE"
else
    echo "❌ No SSH key found."
    read -p "📧 Enter your email address for the new SSH key: " user_email

    echo "🔐 Generating new SSH key with ed25519..."
    ssh-keygen -t ed25519 -C "$user_email" -f "$KEY_FILE"

    if [ $? -ne 0 ]; then
        echo "❌ SSH key generation failed."
        exit 1
    fi
fi

echo "🚀 Starting SSH agent..."
eval "$(ssh-agent -s)"

echo "➕ Adding SSH key to the agent..."
ssh-add "$KEY_FILE"

# Copy to clipboard (Linux only; assumes xclip or xsel is installed)
if command -v xclip &> /dev/null; then
    cat "$PUB_KEY_FILE" | xclip -selection clipboard
    echo "📋 Public key copied to clipboard using xclip!"
elif command -v xsel &> /dev/null; then
    cat "$PUB_KEY_FILE" | xsel --clipboard --input
    echo "📋 Public key copied to clipboard using xsel!"
else
    echo "⚠️ Could not copy to clipboard. Install xclip or xsel, or copy it manually:"
    echo
    cat "$PUB_KEY_FILE"
    echo
fi

echo "✅ SSH key is ready!"
echo
echo "👉 Now go to your Git provider (e.g., GitHub):"
echo "   https://github.com/settings/ssh/new"
echo "Paste the copied key into the form and save it."
echo

