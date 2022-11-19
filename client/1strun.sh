qtile
ttf-cascadia-code
arc-gtk-theme-eos
xfce4-terminal
pcmanfm-gtk3
picom
alsa-utils
papirus-icon-theme
pasystray
feh
rofi
i3lock
neovim
virtualbox
yarn 
npm
cargo
LV_BRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)
LV_BRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)
nerd-fonts-jetbrains-mono
nerd-fonts-mononoki
nerd-fonts-source-code-pro
ln -s ~/.local/bin/lvim lvim
xclip
python3 -m pip install --upgrade pip
cd /tmp
git clone https://github.com/EndeavourOS-Community-Editions/qtile.git
cd qtile
sudo pacman -S --needed - < packages-repository.txt 
sudo pacman -S picom nitrogen lightdm 
sudo pacman -S xorg-server-xephyr
Xephyr -br -ac -noreset -screen 1280x720 :1 & [200~DISPLAY=:1 qtile "/home/pannet1/.config/qtile/config.py" 
sudo pip install psutil
amixer
alsamixer
echo "add ~/.xprofile with setxkbmap, picom and nitrogen"
lxappearance
picom 
lightdm
lightdm-gtk-greeter
sudo systemctl start lightdm
rofi
rofi -show run
mkdir -p ~/.config/rofi
rofi -dump-config > ~/.config/rofi/config.rasi
rofi-theme-selector 
pacman -S ranger
sudo pacman -S ranger
ranger 
atool
highlight
w3m
pacman -Rnsdd xfce4 xfce4-goodies
alacritty
thunar
sudo pacman -S ttf-dejavu ttf-liberation noto-fonts

