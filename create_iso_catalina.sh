#!/usr/bin/env bash

# Bail at first High Sierra ISO creation error
set -e

hdiutil create -o ~/Desktop/Catalina.cdr -size 8700M -layout SPUD -fs HFS+J

hdiutil attach ~/Desktop/Catalina.cdr.dmg -noverify -mountpoint /Volumes/install_build

sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/install_build --nointeraction

hdiutil detach "/Volumes/Install macOS Catalina"

hdiutil convert ~/Desktop/Catalina.cdr.dmg -format UDTO -o ~/Desktop/Catalina.iso

mv ~/Desktop/Catalina.iso.cdr ~/Desktop/Catalina.iso

rm ~/Desktop/Catalina.cdr.dmg
