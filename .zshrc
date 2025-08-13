## THIS IS FOR KITTY TERMINAL, zsh shell and starship prompt

# start starship
eval "$(starship init zsh)"

if [[ $TERM == "xterm-kitty" ]]; then
  fastfetch --logo ~/.config/hypr/icons/KittyImg.png --logo-type kitty-direct --logo-width 20 --logo-height 20
fi







# Created by `pipx` on 2025-08-10 15:16:24
export PATH="$PATH:~/.local/bin"
