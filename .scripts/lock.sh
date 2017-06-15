#!/bin/bash
echo locking...
scrot /tmp/screenshot.png
convert /tmp/screenshot.png -blur 0x6 /tmp/screenshotblur.png
i3lock -u -i /tmp/screenshotblur.png
