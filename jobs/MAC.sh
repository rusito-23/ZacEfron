ROOT_FOLDER=$1
TARGET_FILE=$(sh $ROOT_FOLDER/.randomizer.sh $ROOT_FOLDER)
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$TARGET_FILE\""
killall Dock
