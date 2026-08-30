Generate-MSIXAssets

This script generates all the images needed to create a MSIX package for the Windows Store from a single reference image. Run the script from the root folder of your project after first saving a 1024x1024 reference image as Resources/Icon.png. The images will be saved in Packages/Assets.

GhostScript and ImageMagick are required to run this script. If you don't already have them, install with `brew install ghostscript` and `brew install imagemagick`.
