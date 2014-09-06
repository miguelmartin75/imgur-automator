#!/bin/bash
source ./variables.sh

SCREENSHOT_DIR_TO_USE=$(defaults read com.apple.screencapture location)

AUTOMATOR_IMGUR_SCREENSHOT_UPLOAD_TEMPLATE_DIR=./automator/imgur-screenshot-upload-template.workflow
AUTOMATOR_IMGUR_UPLOAD_TEMPLATE_DIR=./automator/imgur-upload-template.workflow

AUTOMATOR_DOCUMENT_FILE=/Contents/document.wflow

if [ "x$1" != "x" ]; then
    SCREENSHOT_DIR_TO_USE=$1
    ./set_screenshot_dir.sh $SCREENSHOT_DIR_TO_USE &> /dev/null
fi

echo "copying imguru to $IMGURU_INSTALL_PATH"

# copy the binary to upload images
cp ./imgur-uploader/imguru $IMGURU_INSTALL_PATH

echo "screenshot dir is: \"$SCREENSHOT_DIR_TO_USE\""

echo "installing..."

# make a copy of the templates... as the copies are the ones we will
# alter and install
cp -r $AUTOMATOR_IMGUR_SCREENSHOT_UPLOAD_TEMPLATE_DIR $AUTOMATOR_IMGUR_SCREENSHOT_UPLOAD_DIR
cp -r $AUTOMATOR_IMGUR_UPLOAD_TEMPLATE_DIR $AUTOMATOR_IMGUR_UPLOAD_DIR

# alter the copied screenshot automator template to set the screenshot dir
sed -i '' 's/{SCREENSHOT_DIR}/${SCREENSHOT_DIR_TO_USE}/g' $AUTOMATOR_IMGUR_SCREENSHOT_UPLOAD_DIR$AUTOMATOR_DOCUMENT_FILE

SHELL_PATH=$(echo $SHELL | sed 's/\//\\\//g')
# set the appropriate shells for both automator scripts
sed -i '' "s/{SHELL}/${SHELL_PATH}/g" $AUTOMATOR_IMGUR_SCREENSHOT_UPLOAD_DIR$AUTOMATOR_DOCUMENT_FILE
sed -i '' "s/{SHELL}/${SHELL_PATH}/g" $AUTOMATOR_IMGUR_UPLOAD_DIR$AUTOMATOR_DOCUMENT_FILE

# now install the automator files
cp -r $AUTOMATOR_IMGUR_SCREENSHOT_UPLOAD_DIR "$SCREENSHOT_SERVICE_INSTALL_PATH"
cp -r $AUTOMATOR_IMGUR_UPLOAD_DIR "$UPLOAD_SERVICE_INSTALL_PATH"

echo "cleaining up..."

# remove the generated automator files
rm -rf $AUTOMATOR_IMGUR_SCREENSHOT_UPLOAD_DIR
rm -rf $AUTOMATOR_IMGUR_UPLOAD_DIR

echo "success"
