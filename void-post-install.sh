#!/bin/bash
echo "Void Linux Post Install KDE"
echo "###########################################################################################"
echo "Actualizando el sistema"
echo "##########################################################################################"
sudo xbps-Install -Suy
sudo xbps-install -Suy
echo "###########################################################################################"
echo "Instalando componentes del sistema"
echo "###########################################################################################"
sudo xbps-install -Suy NetworkManager vsv xf86-input-libinput xf86-video-amdgpu linux-firmware  gvfs htop bpytop python3-pip pythn3 neofetch gvfs-afc gvfs-mtp gst-plugins-bad1 gst-plugins-good1 gst-plugins-ugly1 pulseaudio pavucontrol pamixer xbacklight setxkbmap zsh git wget curl p7zip ark unzip tar xorg xinit vlc clementine octoxbps kde-cli-tools base-devel mtools android-tools
echo "###########################################################################################"
echo "Instalando entorno gráfic KDE Plasma"
echo "###########################################################################################"
sudo xbps-install -Suy kde5 kde5-baseapps
echo "###########################################################################################"
echo "Instalando repositorios multilib y nonfree" 
echo "###########################################################################################"
sudo xbps-install -Suy void-repo-multilib void-repo-nonfree void-repo-debug void-repo-multilib-nonfree 
echo "###########################################################################################"
echo "Actualizando repositorios"
echo "###########################################################################################"
sudo xbps-install -S 
echo "###########################################################################################"
echo "Instalando Oh My Zsh y Powerlevel10k"
echo "###########################################################################################"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "###########################################################################################"
echo "instalando Fuentes Hack Nerd"
echo "###########################################################################################"
wget -c https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip 
sudo mv Hack* /usr/share/fonts
fc-cache -fv
echo "###########################################################################################"
echo "Instalando Powerlevel10k"
echo "###########################################################################################"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
echo "###########################################################################################"
echo "Limpiando sistema"
echo "###########################################################################################"
sudo vkpurge rm all
sudo xbps-remove -o 
sudo xbps-remove -O
sudo xbps-remove -R dhcpcd
echo "###########################################################################################"
echo "Activando servicios"
echo "###########################################################################################"
sudo ln -s /etc/sv/dbs /var/service
sudo ln -s /etc/sv/NetworkManager /var/service
sudo ln -s /etc/sv/sddm /var/service 