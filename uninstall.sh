source ./variables.sh

echo "removing services"

rm -r "$UPLOAD_SERVICE_INSTALL_PATH$IMGUR_UPLOAD_WORKFLOW"
rm -r "$SCREENSHOT_SERVICE_INSTALL_PATH$IMGUR_SCREENSHOT_WORKFLOW"

echo "removing imguru"
rm $IMGURU_INSTALL_PATH/imguru
