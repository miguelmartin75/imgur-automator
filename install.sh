#!/bin/bash
source ./variables.sh

# Fail fast for any commands which return an error
set -e

AUTOMATOR_IMGUR_SCREENSHOT_UPLOAD_TEMPLATE_DIR=./automator/imgur-screenshot-upload-template.workflow
AUTOMATOR_IMGUR_UPLOAD_TEMPLATE_DIR=./automator/imgur-upload-template.workflow
AUTOMATOR_DOCUMENT_FILE=/Contents/document.wflow

# Determine the directory in which screenshots will be saved
if [ "x$1" != "x" ]; then
    SCREENSHOT_DIR_TO_USE=$1
    ./set_screenshot_dir.sh $SCREENSHOT_DIR_TO_USE
elif ! SCREENSHOT_DIR_TO_USE=$(defaults read com.apple.screencapture location); then
    # Screenshot dir is OS default by omission of any preference to the contrary
    echo "com.apple.screencapture location override isn't set - using default screenshot dir"
    SCREENSHOT_DIR_TO_USE=~/Desktop
fi

echo "screenshot dir is: \"$SCREENSHOT_DIR_TO_USE\""

# copy the binary to upload images if it's not already on the PATH
if IMGURU_EXISTING_PATH=$(which imguru); then
    echo "existing imguru found: $IMGURU_EXISTING_PATH"
else
    echo "copying imguru to: $IMGURU_INSTALL_PATH"
    cp ./imgur-uploader/imguru $IMGURU_INSTALL_PATH
fi

echo "installing..."

# make a copy of the templates... as the copies are the ones we will alter and install
cp -r $AUTOMATOR_IMGUR_SCREENSHOT_UPLOAD_TEMPLATE_DIR $AUTOMATOR_IMGUR_SCREENSHOT_UPLOAD_DIR
cp -r $AUTOMATOR_IMGUR_UPLOAD_TEMPLATE_DIR $AUTOMATOR_IMGUR_UPLOAD_DIR

# replace variable placeholder for the path to the shell executable
sed -i '' "s|{SHELL}|${SHELL}|g" $AUTOMATOR_IMGUR_SCREENSHOT_UPLOAD_DIR$AUTOMATOR_DOCUMENT_FILE
sed -i '' "s|{SHELL}|${SHELL}|g" $AUTOMATOR_IMGUR_UPLOAD_DIR$AUTOMATOR_DOCUMENT_FILE

# replace variable placeholder for the screenshot directory
sed -i '' "s|{SCREENSHOT_DIR}|${SCREENSHOT_DIR_TO_USE}|g" $AUTOMATOR_IMGUR_SCREENSHOT_UPLOAD_DIR$AUTOMATOR_DOCUMENT_FILE

# now install the automator files
mkdir -p "$SCREENSHOT_SERVICE_INSTALL_PATH"
cp -r $AUTOMATOR_IMGUR_SCREENSHOT_UPLOAD_DIR "$SCREENSHOT_SERVICE_INSTALL_PATH"
mkdir -p "$UPLOAD_SERVICE_INSTALL_PATH"
cp -r $AUTOMATOR_IMGUR_UPLOAD_DIR "$UPLOAD_SERVICE_INSTALL_PATH"

echo "cleaining up..."

# remove the generated automator files
rm -rf $AUTOMATOR_IMGUR_SCREENSHOT_UPLOAD_DIR
rm -rf $AUTOMATOR_IMGUR_UPLOAD_DIR

echo "success"
