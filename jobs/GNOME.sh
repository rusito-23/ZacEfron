TARGET_FILE=$(sh randomizer.sh)
gsettings set org.gnome.desktop.background picture-uri  "file:///${TARGET_FILE}"
