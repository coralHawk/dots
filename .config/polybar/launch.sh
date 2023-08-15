#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
 polybar-msg cmd quit
# Otherwise you can use the nuclear option:
 killall -q polybar

BAR_NAME=work
BAR_CONFIG=$HOME/.config/polybar/config.ini
BAR_NAME2=time
BAR_CONFIG2=$HOME/.config/polybar/config2.ini
BAR_NAME3=sys
BAR_CONFIG3=$HOME/.config/polybar/config3.ini

# Launch bar1 and bar2
#echo "---" | tee -a /tmp/polybar1.log
#polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
#polybar secondary 2>&1 | tee -a /tmp/polybar2.log & disown
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload -c $BAR_CONFIG $BAR_NAME &
    MONITOR=$m polybar --reload -c $BAR_CONFIG2 $BAR_NAME2 &
    MONITOR=$m polybar --reload -c $BAR_CONFIG3 $BAR_NAME3 &
done
echo "Bars launched..."


