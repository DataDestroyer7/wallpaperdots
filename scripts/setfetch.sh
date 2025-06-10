#run this to change fastfetch whenever you change your wallpaper
#checks current wallpaper
wall=($(hyprctl hyprpaper listloaded))
theme=default

newwall=$(printf '%s\n' "$wall" | sed 's|.*/||' | sed 's/\.[^.]*$//')
wall=($newwall)

#checks the wallpaper and sets the theme according to what wallpaper you're using (these are mine)
if [ $wall == madeinabyss ] || [ $wall == layer5 ] || [ $wall == nanachiBig ] || [ $wall == nanachiRealistic ] || [ $wall == nanachiRight ] || [ $wall == nanachiSmall ] || [ $wall == prushka ] ; then
  theme=abyss
fi
if [ $wall == yuri ] || [ $wall == shiro ] || [ $wall == yukio ] ; then
  theme=blue
fi
if [ $wall == felix ] || [ $wall == rem ] ; then
  theme=zero
fi

#finds a random fastfetch logo from ~/.fastlogo/[THEME]
if [ $theme != default ] ; then
  logos=($(ls -d $HOME/.fastlogo/$theme/*.png))
  useLogo=${logos[ $RANDOM % ${#logos[@]} ]}
  echo $useLogo
fi

#sets logo to the one it chose
rm $HOME/.fastlogo/fastfetchImage.png
cp $useLogo $HOME/.fastlogo/fastfetchImage.png

#if no theme was chose the default logo is used
if [ $theme == default ] ; then
  rm $HOME/.fastlogo/fastfetchImage.png
  cp $HOME/.fastlogo/default.png $HOME/.fastlogo/fastfetchImage.png
fi
