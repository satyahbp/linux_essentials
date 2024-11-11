#!/bin/bash

# ------------------------------------------
# Initialising varibales, paths, etc.

# sources
SOURCE_PATH=<source_path>
SOURCE_FILE_NAME=<source_file_name>

DESTINATION_PATH=<destination_path>
DESTINATION_FILE_BASE_NAME="${SOURCE_FILE_NAME%.*}"

CURRENT_DATE=$(date +"%Y_%m_%d")
CURRENT_EPOCH=$(date +%s)
EXPIRATION_TIME_IN_DAYS=<number of days for deletion>

EXPIRATION_EPOCH=$(($EXPIRATION_TIME_IN_DAYS * 86400))


# ------------------------------------------



# ------------------------------------------
# Zipping the source file into destination and then truncating the source file

zip -j "${DESTINATION_PATH}/${DESTINATION_FILE_BASE_NAME}_${CURRENT_DATE}.zip" $SOURCE_PATH/$SOURCE_FILE_NAME
truncate -s 1K $SOURCE_PATH/$SOURCE_FILE_NAME

# ------------------------------------------



# -----------------------------------------
# Deleting files older than above mentioned days


# Getting all file names in destination path
ALL_ZIPPED_FILES=$(ls $DESTINATION_PATH)

# Checking age of all files and deleting which are older than Expiration time in days.
for CURRENT_FILE in ${ALL_ZIPPED_FILES[@]}; do
    CURRENT_FILE_AGE_EPOCH=$(($CURRENT_EPOCH - $(stat -c %Y $DESTINATION_PATH/$CURRENT_FILE)))
    
    if [ "$CURRENT_FILE_AGE_EPOCH" -gt "$EXPIRATION_EPOCH" ]; then
        echo "Deleting: ${CURRENT_FILE}"
        rm $DESTINATION_PATH/$CURRENT_FILE
    else 
        echo "${CURRENT_FILE} does not match the delete criteria."

    fi
done


# -----------------------------------------
