ls -t *.png | cat -n | while read n f; do mv "$f" "r$(printf %04d.png $n)"; done
ls -t *.png | cat -n | while read n f; do mv "$f" "$(printf %04d.png $n)"; done
