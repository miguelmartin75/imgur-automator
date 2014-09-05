# imgur-automator

A repository which contains two simple automation scripts
for uploading images and screenshots to imgur, with no hassle.

# Installation

Installation is very simple, follow these smalls steps:

1. [Download](http://github.com/miguelmartin75/imgur-automator/zipball/master/) or clone the repository.
2. Run the install.sh script in a command line (e.g. Terminal.app), like so:
    
    ```bash
    ./install.sh
    ```
## NOTES

1. You can pass one argument to the `install.sh` script, this argument is the directory where you 
   to store your screenshots. The `install.sh` script will call the `set_screenshot_dir.sh`, which
   will set your system screenshot directory path. For example:
    
   ```bash
   ./install.sh ~/Documents/Pictures/My\ Screenshots
   ```
2. Since the automation scripts depend on [imguru](https://github.com/FigBug/imguru),
   they uploads your images/screenshots to imgur anonymously; which may be of nusance to some people.
   However, if someone wants to alter this repository to incorporate user uploads, they are more than
   welcome to.

# Usage

This repository comes with two automation scripts: one to upload screenshots to imgur and two,
to upload images that are already on your machine.

## uploading screenshots

Uploading screenshots is extremely simple. Simply, take a screenshot and wait for it to upload.
You can take a screenshot by pressing ⇧⌘4 (shift-command-4) to screenshot your whole screen or 
⇧⌘3 (shift-command-3) to screenshot a region of your screen. A notification will be shown when 
the screenshot is uploaded, and the link to to the image will be automatically copied to your clipboard.



## uploading images already on your machine

To upload images that are already on your machine, you can have two options:

1. Use the command line to upload them
2. Within finder (and other applications) you can upload them via services

### First Option

The first option is quite simple, you just use imguru, like so:

```bash
imguru -d <path-to-screenshot>
```

and then copy the link it spits out. Alternatively, to copy to your clipboard you can 
add `| pbcopy` to the command, like so:

```bash
imguru -d <path-to-screenshot> | pbcopy
```

### Second Option

The second option is also quite simple, but with this option
you can upload the image(s) you want multiple ways. All ways
will show a notification once the image is uploaded and copy
the link to your clipboard.

#### Right Clicking

In Finder, you can right click the image and then go to
services and click the service called 'imgur-upload'. This will automatically
copy the link to your clipboard, once it is uploaded.

#### Top-bar Menu Option

1. In Finder, or any other Application (e.g. an alternative to Finder, or a photo browser),
click the Application name up at the top bar.

((image))

2. Hover over the sub-menu called "services"

((image))

3. Click the service called "imgur-upload"

((image))

#### Setting up a Shortcut

I really reccomend setting up a shortcut to upload an image, as shortcuts save much time. To
make a shortcut for the service, follow these steps:

1. Open up System Preferences
   ((image))
2. Click/type "Keyboard"
    ((image))
3. Click the "Shortcuts" tab
   ((image))
4. Click "Services"
    ((image))
5. Scroll down to imgur-upload
    ((image))
6. Click "add a shortcut" (or double click the existing shortcut to edit it)
    ((image))
7. Type the key combination you wish to set as the shortcut, I personally use ⇧⌘I (shift-command-I).
   ((image))

# FAQ

## How do I run install.sh?

Simply open up Terminal.app, under Applications/Utilities/Terminal.app. And then type the following commands:

```bash
cd <directory-to-repository-download>
```

where `<directory-to-repository-download>` is the location you downloaded this repository (hint: you can drag the folder icon from finder to Terminal.app or use XtraFinder to "Open New Terminal Here").

and then finally, type:

```bash
./install.sh
```
