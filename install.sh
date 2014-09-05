UPLOAD_SERVICE_INSTALL_PATH=~/Library/Servies
SCREENSHOT_SERVICE_INSTALL_PATH=~/Library/Workflows/Applications/Folder\ Actions
IMGURU_INSTALL_PATH=/usr/local/bin
SCREENSHOT_DIR_TO_USE=$(defaults read com.apple.screencapture location)

if [ "x$1" != "x" ]; then
    SCREENSHOT_DIR_TO_USE=$1
    ./set_screenshot_dir.sh $SCREENSHOT_DIR_TO_USE
fi

echo "copying imguru to $IMGURU_INSTALL_PATH"

# copy the binary to upload images
cp ./imgur-uploader/imguru $IMGURU_INSTALL_PATH

echo "screenshot dir is: \"$SCREENSHOT_DIR_TO_USE\""

echo "getting automator files ready..."
# set the screenshot dir
sed -i '' 's/{SCREENSHOT_DIR}/$SCREENSHOT_DIR_TO_USE/g' automator/imgur-screenshot-upload.workflow/Contents/document.wflow

echo "copying automator files..."
# now install the automator files
cp -r ./automator/imgur-screenshot-upload.workflow "$SCREENSHOT_SERVICE_INSTALL_PATH"
cp -r ./automator/imgur-upload.workflow "$UPLOAD_SERVICE_INSTALL_PATH"

echo "complete"
