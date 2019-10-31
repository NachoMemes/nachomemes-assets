#!/usr/bin/env bash

ROOT="."
OUTPUT="index.html" 

i=0
echo "<UL>" > $OUTPUT
for filepath in `find "$ROOT" -maxdepth 1 -mindepth 1 -type f | sort`; do
  file=`basename "$filepath"`
  echo "  <LI><a href=\"$file\">$file</a></LI>" >> $OUTPUT
done
for filepath in `find "$ROOT" -maxdepth 1 -mindepth 1 -type d | sort`; do
  path=`basename "$filepath"`
  if [[ ! "$path" == *".git"* ]]; then
    echo "  <LI>$path</LI>" >> $OUTPUT
    echo "  <UL>" >> $OUTPUT
    for i in `find "$filepath" -maxdepth 1 -mindepth 1 -type f| sort`; do
      file=`basename "$i"`
      echo "    <LI><a href=\"$path/$file\">$file</a></LI>" >> $OUTPUT
    done
    echo "  </UL>" >> $OUTPUT
  fi
done
echo "</UL>" >> $OUTPUT

# walk_dir () {
#   shopt -s nullglob dotglob

#   for pathname in "$1"/*; do
#     if [[ "$pathname" == *".git"* ]]; then
#       echo "Skipping .git ..."
#     elif [ -d "$pathname" ]; then
#       echo "<h2>$pathname</h2>" >> index.html
#       walk_dir "$pathname"
#     else
#       printf '%s\n' "$pathname"
#       echo "<div><a href=\"$pathname\">$pathname</a></div>" >> index.html
#     fi
#   done
# }

# echo "<h1>Assets Index</h1>" > index.html

# walk_dir "."

# for entry in *
# do
#   if [[ -d $entry ]]; then
#     echo "$entry is a directory"
#   elif [[ -f $entry ]]; then
#     echo "$entry is a file"
#   else
#     echo "$entry is not valid"
#     exit 1
#   fi
# done