#!/bin/sh
set -e
cat ../input.txt | awk 'BEGIN {
  current=0
}
{
  if($0 == "") {
    calories[current] = ""
    current=0
  }
  else {
    current+=$1
  }
}
END {
  for(i in calories) {
    print i 
  }
}' | sort -nr | head -n 3 | awk '{sum+=$1} END{print sum}'
