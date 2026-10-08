#!/bin/sh

# 1. Prevent Ruby encoding encoding issues on the server
export LANG=en_US.UTF-8

# 2. Expose standard Homebrew paths where CocoaPods lives
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# 3. Move to the workspace root directory where your Podfile lives
cd "$CI_PRIMARY_REPOSITORY_PATH"

echo "=== Current Directory: $(pwd) ==="
echo "=== Checking for Podfile ==="
if [ ! -f "Podfile" ]; then
    echo "ERROR: Podfile not found at $(pwd)!"
    exit 1
fi

echo "=== Starting Pod Install ==="
# Use --deployment flag to ensure a clean, reliable server install matching your Podfile.lock
pod install --deployment || pod install
