# PhotoRenamer

![Swift](https://camo.githubusercontent.com/0727f3687a1e263cac101c5387df41048641339c/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f53776966742d332e302d6f72616e67652e7376673f7374796c653d666c6174)


Inspired by Dropbox `Camera Uploads` file-naming strategy.

Rename photos into `yyyy-mm-dd hh.mm.ss` format

##Usage

- Build the binary
- Choose below:
    1. 
        + Put the binary under your photo directory
        + Just run `./PhotoRenamer`

    2. run `PhotoRenamer your-image-file-or-directory`

It will look up all image files and sub-directories inside the folder and rename all images files into `yyyy-mm-dd hh.mm.ss` format if EXIF datetime property exists.
