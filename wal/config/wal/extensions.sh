#!/bin/sh

background=$(head -1 ~/.cache/wal/colors)
if [ $((16#${background:1})) -lt 8000000 ]; then
  mode="dark"
else
  mode="light"
fi
echo $mode

# Reload Waybar
killall -SIGUSR2 waybar

# Set the XFCE theme based on dark/light
if [ "$mode" = "dark" ]; then
  xfconf-query --channel xsettings --property /Net/ThemeName -s "Adwaita-dark"
else 
  xfconf-query --channel xsettings --property /Net/ThemeName -s "Adwaita"
fi


systemctl restart --user dunst
