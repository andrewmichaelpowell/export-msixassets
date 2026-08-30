#!/usr/bin/env bash

# Export-MSIXAssets
# github.com/andrewmichaelpowell

# brew install ghostscript
# brew install imagemagick

set -euo pipefail

MASTER_IMAGE="./Resources/Icon.png"
OUTPUT_DIR="./Packages/Assets"

rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

new_square_asset() {
    local file_name="$1"
    local size="$2"
    local path="$OUTPUT_DIR/$file_name"
    magick "$MASTER_IMAGE" -filter Lanczos -resize "${size}x${size}" -define png:compression-level=9 "$path"
}

new_padded_asset() {
    local file_name="$1"
    local canvas_w="$2"
    local canvas_h="$3"
    local fill_ratio="${4:-0.42}"
    local path="$OUTPUT_DIR/$file_name"

    local min_dim=$(( canvas_w < canvas_h ? canvas_w : canvas_h ))
    local icon_size
    icon_size=$(awk -v m="$min_dim" -v r="$fill_ratio" 'BEGIN { printf "%d", m * r }')

    magick "$MASTER_IMAGE" -filter Lanczos -resize "${icon_size}x${icon_size}" -background none -gravity center -extent "${canvas_w}x${canvas_h}" -define png:compression-level=9 "$path"
}

new_square_asset "Square44x44Logo.png" 44
new_square_asset "Square44x44Logo.scale-100.png" 44
new_square_asset "Square44x44Logo.scale-125.png" 55
new_square_asset "Square44x44Logo.scale-150.png" 66
new_square_asset "Square44x44Logo.scale-200.png" 88
new_square_asset "Square44x44Logo.scale-400.png" 176

for size in 16 24 32 48 256; do
    new_square_asset "Square44x44Logo.targetsize-$size.png" "$size"
done

for size in 16 24 32 48 256; do
    new_square_asset "Square44x44Logo.targetsize-${size}_altform-unplated.png" "$size"
done

for size in 16 24 32 48 256; do
    new_square_asset "Square44x44Logo.targetsize-${size}_altform-lightunplated.png" "$size"
done

new_square_asset "Square150x150Logo.png" 150
new_square_asset "Square150x150Logo.scale-100.png" 150
new_square_asset "Square150x150Logo.scale-125.png" 188
new_square_asset "Square150x150Logo.scale-150.png" 225
new_square_asset "Square150x150Logo.scale-200.png" 300
new_square_asset "Square150x150Logo.scale-400.png" 600

new_square_asset "Square310x310Logo.png" 310
new_square_asset "Square310x310Logo.scale-100.png" 310
new_square_asset "Square310x310Logo.scale-125.png" 388
new_square_asset "Square310x310Logo.scale-150.png" 465
new_square_asset "Square310x310Logo.scale-200.png" 620
new_square_asset "Square310x310Logo.scale-400.png" 1240

new_square_asset "Square71x71Logo.png" 71
new_square_asset "Square71x71Logo.scale-100.png" 71
new_square_asset "Square71x71Logo.scale-125.png" 89
new_square_asset "Square71x71Logo.scale-150.png" 107
new_square_asset "Square71x71Logo.scale-200.png" 142
new_square_asset "Square71x71Logo.scale-400.png" 284

new_square_asset "StoreLogo.png" 50
new_square_asset "StoreLogo.scale-100.png" 50
new_square_asset "StoreLogo.scale-125.png" 63
new_square_asset "StoreLogo.scale-150.png" 75
new_square_asset "StoreLogo.scale-200.png" 100
new_square_asset "StoreLogo.scale-400.png" 200

new_padded_asset "Wide310x150Logo.png" 310 150
new_padded_asset "Wide310x150Logo.scale-100.png" 310 150
new_padded_asset "Wide310x150Logo.scale-125.png" 388 188
new_padded_asset "Wide310x150Logo.scale-150.png" 465 225
new_padded_asset "Wide310x150Logo.scale-200.png" 620 300
new_padded_asset "Wide310x150Logo.scale-400.png" 1240 600

new_padded_asset "SplashScreen.png" 620 300 0.35
new_padded_asset "SplashScreen.scale-100.png" 620 300 0.35
new_padded_asset "SplashScreen.scale-125.png" 775 375 0.35
new_padded_asset "SplashScreen.scale-150.png" 930 450 0.35
new_padded_asset "SplashScreen.scale-200.png" 1240 600 0.35
new_padded_asset "SplashScreen.scale-400.png" 2480 1200 0.35
