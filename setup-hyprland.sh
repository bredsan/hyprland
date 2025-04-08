#!/bin/bash

# Atualiza o sistema
sudo pacman -Syu --noconfirm

# Instala pacotes essenciais
sudo pacman -S --noconfirm \
    hyprland \
    xdg-desktop-portal-hyprland \
    waybar \
    kitty \
    dolphin \
    thunar \
    pipewire pipewire-pulse wireplumber \
    sddm \
    networkmanager \
    firefox \
    wl-clipboard \
    brightnessctl \
    pavucontrol \
    neofetch \
    git \
    unzip \
    polkit-kde-agent \
    qt5-wayland qt6-wayland \
    ttf-jetbrains-mono-nerd \
    noto-fonts \
    noto-fonts-emoji \
    ttf-font-awesome \
    xdg-user-dirs

# Ativa serviços importantes
sudo systemctl enable sddm
sudo systemctl enable NetworkManager

# Inicializa diretórios do usuário
xdg-user-dirs-update

# Clona e aplica tema base do Hyprland (opcional e bonito)
mkdir -p ~/.config/hypr
git clone https://github.com/hyprwm/hyprland /tmp/hyprland-config
cp -r /tmp/hyprland-config/examples/hyprland.conf ~/.config/hypr/hyprland.conf

# Configuração leve para Waybar (pode customizar depois)
mkdir -p ~/.config/waybar
cat <<EOF > ~/.config/waybar/config.jsonc
{
  "layer": "top",
  "position": "top",
  "modules-left": ["hyprland/workspaces"],
  "modules-center": [],
  "modules-right": ["pulseaudio", "clock"],
  "clock": { "format": "%H:%M | %a %d" }
}
EOF

# Mensagem final
echo "✅ Hyprland instalado! Reinicie o sistema e selecione Hyprland no SDDM."
