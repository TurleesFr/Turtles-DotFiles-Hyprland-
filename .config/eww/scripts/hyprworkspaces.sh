hyprctl activeworkspace -j | awk -F'"id":' '{print $2}' | awk -F',' '{print $1}' | tr -d ' '
