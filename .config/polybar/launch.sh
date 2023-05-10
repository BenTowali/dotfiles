#!/bin/sh

killall -q polybar
polybar ben 2>&1 | tee -a /tmp/polybar.log & disown
