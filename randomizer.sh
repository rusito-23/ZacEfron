ROOT_FOLDER=$1
files=($ROOT_FOLDER/*)
printf "%s\n" "${files[RANDOM % ${#files[@]}]}"
