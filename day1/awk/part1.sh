#!/bin/sh
set -e
cat ../input.txt | awk 'BEGIN {
  highest=0
  current=0
}
{
  if($0 == "") {
    current=0
  }
  else {
    current+=$1
    if(current > highest) {
      highest = current
    }
  }
}
END {
  print highest
}
'
