ROOT_FOLDER=$1
TARGET_FILE=$(sh $ROOT_FOLDER/.randomizer.sh $ROOT_FOLDER)
sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "UPDATE data SET value='${TARGET_FILE}';"
killall Dock
