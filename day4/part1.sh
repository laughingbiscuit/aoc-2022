#!/bin/sh
set -e

# how many pairs does one range full contain the other?

cat input.txt | awk -F, '
BEGIN { total=0 }
{
  split($1, left, "-")
  split($2, right, "-")
  if( (left[1] <= right[1] && left[2] >= right[2]) ||
        (left[1] >= right[1] && left[2] <= right[2]) ) {
    total+=1
  }}
END { print total }
'
