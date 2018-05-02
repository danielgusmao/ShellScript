#!/bin/bash

# Remove pastas antigas
echo "Remove pastas antigas"

rm -rf /opt/firefox/
rm -rf /usr/bin/firefox
rm -rf /usr/share/applications/firefox.desktop

# Download
echo "Download" 

wget "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=pt-BR" -O firefox.tar.bz2
clear

#Descompactar
echo "Descompactar"

tar -jxvf  firefox.tar.bz2 -C /opt/ >> /dev/null 2>&1

# Apagar firefox.tar.bz2
echo "Apagar firefox.tar.bz2"

rm -rf firefox.tar.bz2

#Link Simbolico
echo "Link Simbolico"

ln -sf /opt/firefox/firefox /usr/bin/firefox

# Criando Icone
echo "Criando Icone" 

echo -e '[Desktop Entry]\n
Encoding=UTF-8\n
Name=Mozilla Firefox Quantum\n
Comment=Browse the World Wide Web\n
Type=Application\n
Terminal=false\n
Exec=/usr/bin/firefox %U\n
Icon=/opt/firefox/browser/chrome/icons/default/default32.png\n
StartupNotify=true\n
Categories=Network;WebBrowser;\n' | sudo tee /usr/share/applications/firefox.desktop >> /dev/null 2>&1

echo "Tornando Execultável"
chmod +x /usr/share/applications/firefox.desktop

echo "FIM"

