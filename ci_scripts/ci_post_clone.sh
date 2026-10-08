#!/bin/sh

# 1. Prevent text encoding issues on the server
export LANG=en_US.UTF-8

# 2. Add Homebrew bin folders into the terminal lookup paths 
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# 3. Check if CocoaPods is available on the machine; install it if missing
if ! command -v pod >/dev/null 2>&1; then
    echo "=== CocoaPods not found. Installing via Homebrew ==="
    brew install cocoapods
else
    echo "=== CocoaPods is already installed ==="
fi

# 4. Move to the workspace root directory where your Podfile lives
cd "$CI_PRIMARY_REPOSITORY_PATH"

echo "=== Running Pod Install ==="
pod install --deployment || pod install
