TARGET_FILE=$(sh randomizer.sh)
gsettings set org.cinnamon.desktop.background picture-uri  "file:///${TARGET_FILE}"
