# I run this on startup, it gets all wallpapers from ~/Wallpapers/ and ~/.animeWallpapers/ and will chose a random one to display as my wallpaper depending on if I have animeWallpapers enabled or not (nice for when I go to school or something)
sleep 1.5
hyprctl hyprpaper unload all
# Sets a random wallpaper with hyprpaper

wallpapers=($(ls -d $HOME/Wallpapers/*.png))

useA=($(/bin/bash $HOME/Wallpapers/.config.sh))

if [ $useA == true ] ; then
  wallpapersA=($(ls -d $HOME/.animeWallpapers/*.png))
  walls=(${wallpapers[@]} ${wallpapersA[@]})
  wallChosen=${walls[ $RANDOM % ${#walls[@]} ]}
  
  hyprctl hyprpaper preload $wallChosen
  hyprctl hyprpaper wallpaper ,$wallChosen
else
  wall=${wallpapers[ $RANDOM % ${#wallpapers[@]} ]}
  
  hyprctl hyprpaper preload $wall
  hyprctl hyprpaper wallpaper ,$wall
fi

/bin/bash $HOME/.scripts/setfetch.sh
