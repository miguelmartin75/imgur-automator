#!/bin/bash
source ./variables.sh

# Fail fast for any commands which return an error
set -e

echo "removing installed files..."

IMGUR_UPLOAD_WORKFLOW_PATH=$UPLOAD_SERVICE_INSTALL_PATH$IMGUR_UPLOAD_WORKFLOW
IMGUR_SCREENSHOT_WORKFLOW_PATH=$SCREENSHOT_SERVICE_INSTALL_PATH$IMGUR_SCREENSHOT_WORKFLOW
IMGURU_BINARY_PATH=$IMGURU_INSTALL_PATH/imguru

PATHS=("$IMGUR_UPLOAD_WORKFLOW_PATH" "$IMGUR_SCREENSHOT_WORKFLOW_PATH" "$IMGURU_BINARY_PATH")
for path in "${PATHS[@]}"; do
	if [ -e "${path}" ]; then
		echo "removing \"${path}\""
		rm -rf "${path}"
	fi
done

echo "success"
