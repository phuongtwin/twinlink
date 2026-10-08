#!/bin/sh

# 1. Force load Homebrew and system paths into the cloud server terminal context
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# 2. Check if cocoa pods is available; install it if missing
if ! command -v pod &> /dev/null; then
    echo "CocoaPods not found. Installing via homebrew..."
    brew install cocoapods
fi

# 3. Run the dependency configuration at the root
pod install
