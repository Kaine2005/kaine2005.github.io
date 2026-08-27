#!/bin/bash
# Turn a raw ad video into a web-ready looping clip for the site.
#
# Usage:
#   ./makeclip.sh <input-video> <output-name> [start-seconds] [duration]
#
# Examples:
#   ./makeclip.sh ~/Downloads/mediawall.mov media-walls
#   ./makeclip.sh ~/Downloads/windows.mp4 windows-doors 3      # start 3s in
#   ./makeclip.sh ~/Downloads/clean.mp4 exterior-cleaning 5 4  # start 5s, 4s long
#
# Output names must match the site: media-walls, wardrobes, windows-doors,
# exterior-cleaning, property-sourcing
#
# Creates in clips/:  <name>.mp4  <name>.webm  <name>.jpg (poster)

set -e

IN="$1"
NAME="$2"
START="${3:-0}"     # default: start at 0s
DUR="${4:-5}"       # default: 5 seconds

if [ -z "$IN" ] || [ -z "$NAME" ]; then
  echo "Usage: ./makeclip.sh <input-video> <output-name> [start-seconds] [duration]"
  exit 1
fi

if [ ! -f "$IN" ]; then
  echo "Can't find input file: $IN"
  exit 1
fi

cd "$(dirname "$0")"
mkdir -p clips

# Crop to 3:4 portrait from the centre, scale to 720x960.
VF="crop='min(iw,ih*3/4)':'min(ih,iw*4/3)',scale=720:960"

echo "Building clips/$NAME.mp4 ..."
ffmpeg -y -ss "$START" -i "$IN" -t "$DUR" -an \
  -vf "$VF" -c:v libx264 -crf 26 -preset veryslow -movflags +faststart \
  "clips/$NAME.mp4" -loglevel error

echo "Building clips/$NAME.webm ..."
ffmpeg -y -ss "$START" -i "$IN" -t "$DUR" -an \
  -vf "$VF" -c:v libvpx-vp9 -crf 34 -b:v 0 \
  "clips/$NAME.webm" -loglevel error

echo "Building clips/$NAME.jpg (poster) ..."
ffmpeg -y -i "clips/$NAME.mp4" -frames:v 1 -q:v 3 \
  "clips/$NAME.jpg" -loglevel error

echo ""
echo "Done. Sizes:"
ls -lh "clips/$NAME.mp4" "clips/$NAME.webm" "clips/$NAME.jpg" | awk '{print "  "$9"  "$5}'
