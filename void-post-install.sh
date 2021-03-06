#!/bin/bash
echo "Void Linux Post Install KDE"
echo "###########################################################################################"
echo "Actualizando el sistema"
echo "##########################################################################################"
sudo xbps-install -Suy
sudo xbps-install -Suy
echo "###########################################################################################"
echo "Instalando componentes del sistema"
echo "###########################################################################################"
sudo xbps-install -Suy NetworkManager vsv xf86-input-libinput  linux-firmware  gvfs htop bpytop nano mc neofetch gvfs-afc gvfs-mtp gst-plugins-bad1 gst-plugins-good1 gst-plugins-ugly1 pulseaudio pavucontrol pamixer xbacklight setxkbmap zsh git wget curl p7zip ark unzip tar xorg xinit vlc firefox clementine octoxbps kde-cli-tools base-devel mtools android-tools
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
echo "instalando Fuentes Hack Nerd"
echo "###########################################################################################"
wget -c https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip 
sudo mv Hack* /usr/share/fonts
fc-cache -fv
echo "###########################################################################################"
echo "Limpiando sistema"
echo "###########################################################################################"
sudo vkpurge rm all
sudo xbps-remove -o 
sudo xbps-remove -O
echo "###########################################################################################"
echo "Activando servicios"
echo "###########################################################################################"
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/NetworkManager /var/service
sudo ln -s /etc/sv/sddm /var/service 

