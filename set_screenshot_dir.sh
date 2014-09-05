if [ "x$1" == "x" ]; then
    echo "usage: $0 <screenshot-dir>"
else
    defaults write com.apple.screencapture location "$1"
    echo $(defaults read com.apple.screencapture location)
fi
