if [ "x$1" == "x" ]; then
    echo "usage: $0 <screenshot-dir>"
else
    echo "changing screenshot directory to \"$1\""
    defaults write com.apple.screencapture location "$1"
fi
