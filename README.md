Export-MSIXAssets

This script generates the images needed to create a MSIX package for the Windows Store. 

1. Save a 1024x1024 reference image as Resources/Icon.png.
2. Run the script from the root folder of your project.
3. The generated images will be saved in Packages/Assets.

Prerequisites: GhostScript and ImageMagick

1. `brew install ghostscript`
2. `brew install imagemagick`
