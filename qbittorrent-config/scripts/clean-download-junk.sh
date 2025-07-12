#!/usr/bin/env bash
#
# clean-download-junk.sh
# Usage: clean-download-junk.sh /path/to/downloads
#

DOWNLOAD_DIR="${1:?Usage: $0 /path/to/downloads}"

# 1) Remove sample video files (case-insensitive) + ETRG.mp4
find "$DOWNLOAD_DIR" -type f \
  \( -iname '*sample*.*mkv' -o -iname '*sample*.*mp4' -o -iname '*sample*.*avi' -o -iname 'ETRG.mp4' \) \
  -delete

# 2) Remove common junk file extensions
find "$DOWNLOAD_DIR" -type f \
  \( -iname '*.nfo' -o -iname '*.txt' -o -iname '*.sfv' -o -iname '*.md5' \
   -o -iname '*.db' -o -iname '*.rtf' \) \
  -delete

# 3) Remove images/screenshots
find "$DOWNLOAD_DIR" -type f \
  \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) \
  -delete

# 4) Remove unwanted directories
find "$DOWNLOAD_DIR" -mindepth 1 -maxdepth 2 -type d \
  \( -iname 'screenshots' -o -iname 'external*' -o -iname 'subs*' \) \
  -exec rm -rf {} +

# 5) (Optional) Remove empty dirs left behind
find "$DOWNLOAD_DIR" -type d -empty -delete
