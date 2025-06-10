#displays a rofi dmenu with all of my wallpapers from ~/Wallpapers/ and ~/.animeWallpapers/ and will set the wallpaper to whatever I choose
walls=($(ls -d $HOME/Wallpapers/*.png) $(ls -d $HOME/.animeWallpapers/*.png))
op=$(printf '%s\n' "${walls[@]}" | sed 's|.*/||' | sed 's/\.[^.]*$//' | wofi -i --dmenu --style ~/.config/wofi/nord.css)
hyprctl hyprpaper unload all
hyprctl hyprpaper preload ~/.animeWallpapers/$op.png
hyprctl hyprpaper wallpaper ,~/.animeWallpapers/$op.png
hyprctl hyprpaper preload ~/Wallpapers/$op.png
hyprctl hyprpaper wallpaper ,~/Wallpapers/$op.png
/bin/bash $HOME/.scripts/setfetch.sh
