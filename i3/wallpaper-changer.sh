while true; do
    ln -sf $(ls ~/Pictures/wallpapers/* | shuf -n 1) ~/.wallpaper.png
    feh --no-fehbg --bg-scale ~/.wallpaper.png
    sleep 10m
done
