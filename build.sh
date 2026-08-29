#!/bin/bash
MANIFEST_URL="https://github.com"
BRANCH="lineage-22.1"
DEVICE="a52q"

# Setup paths
mkdir -p ~/.bin
PATH=~/.bin:$PATH
curl https://googleapis.com > ~/.bin/repo
chmod a+x ~/.bin/repo

# Sync ROM
repo init -u $MANIFEST_URL -b $BRANCH --depth=1
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# Build command
source build/envsetup.sh
lunch axion_a52q-userdebug
mka bacon -j$(nproc --all)
