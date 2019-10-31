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
