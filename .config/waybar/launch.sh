# #!/bin/sh

# CONFIG_FILES="$HOME/.config/waybar/config.json $HOME/.config/waybar/style.css"

# trap "killall waybar" EXIT

# while true; do
#     waybar &
#     inotifywait -e create,modify $CONFIG_FILES
#     killall waybar
# done
waybar -c ~/.config/waybar/config.json -s ~/.config/waybar/style.css
