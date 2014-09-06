# imgur-automator

A repository which contains two simple automation scripts
for uploading images and screenshots to imgur, with no hassle.

### Table of Contents

<pre>
<a href="#Installation">Installation</a>
<a href="#Usage">Usage</a>
<a href="#FAQ">FAQ</a>
</pre>

# Installation

Installation is very simple, follow these smalls steps:

1. [Download](http://github.com/miguelmartin75/imgur-automator/zipball/master/) or clone the repository.
2. Run the `install.sh` script in a command line (e.g. Terminal.app), like so:
    
    ```bash
    ./install.sh
    ```
    
## NOTES

1. You can pass one argument to the `install.sh` script, this argument is the directory where you 
   to store your screenshots. The `install.sh` script will call the `set_screenshot_dir.sh` script, 
   which will set your system screenshot directory path. For example:
    
   ```bash
   ./install.sh ~/Documents/Pictures/My\ Screenshots
   ```

2. Since the automation scripts depend on [imguru](https://github.com/FigBug/imguru),
   the scripts will upload your images/screenshots to imgur anonymously; which may be of nuisance to some people.
   However, if someone wants to alter this repository to incorporate user uploads, they are more than
   welcome to.

# Usage

This repository comes with two automation scripts: one to upload screenshots to imgur and two,
to upload images that are already on your machine.

## Uploading Screenshots

Uploading screenshots is extremely simple. Simply, take a screenshot and wait for it to upload.
You can take a screenshot by pressing ⇧⌘3 (shift-command-3) to screenshot your whole screen or 
⇧⌘4 (shift-command-4) to screenshot a region of your screen. A notification will be shown when 
the screenshot has been uploaded, and the link to to the image will be automatically copied to your clipboard.

![Notification](http://i.imgur.com/aAw32iB.png)

## Uploading images already on your machine

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

In Finder (and perhaps other applications that support this), you can:

1. right click the image

   ![Right Click Image](http://i.imgur.com/WLxxAZI.png)

2. hover over "Services"

   ![Hover Over Services](http://i.imgur.com/dZVs4Ll.png)

3. Click the service called "imgur-upload". 

   ![Click Service Called imgur-upload](http://i.imgur.com/PSLKhab.png)   

#### Top-bar Menu Option

1. In Finder, or any other Application (e.g. an alternative to Finder, or a photo browser),
click the Application name up at the top bar.

    ![Finder Top Bar](http://i.imgur.com/MLaQzsb.png)   


2. Hover over the sub-menu called "services"

    ![Servies Menu](http://i.imgur.com/R61KhBw.png)  
    

3. Click the service called "imgur-upload"

    ![imgur-upload service](http://i.imgur.com/j2uKEQr.png3)

#### Setting up a Shortcut

I really reccomend setting up a shortcut to upload an image, as shortcuts save much time. To
make a shortcut for the service, follow these steps:

1. Open up System Preferences
    ![System Preferences](http://i.imgur.com/GqUpvlt.png)  
2. Click/type "Keyboard"
    ![Keyboard within System Preferences](http://i.imgur.com/MxBwbHA.png)  
3. Click the "Shortcuts" tab
    ![Keyboard Shortcuts tab](http://i.imgur.com/EDFld53.png)  
4. Click "Services"    
    ![Keyboard Services](http://i.imgur.com/KmWH4NM.png)  
5. Scroll down to imgur-upload and click "add a shortcut" (or double click the existing shortcut to edit it)
    ![Add a Shortcut](http://i.imgur.com/0DGG6VS.png)  
6. Type the key combination you wish to set as the shortcut, I personally use ⇧⌘I (shift-command-I).
    ![imgur-upload keyboard shortcut](http://i.imgur.com/smgDFBO.png) 

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
