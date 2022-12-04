#!/bin/sh
set -e

# how many pairs have an overlap?

cat input.txt | awk -F, '
BEGIN { total=0 }
{
  split($1, left, "-")
  split($2, right, "-")
  if( ! (left[2] < right [1] ||
        right[2] < left[1]) ) {
    total+=1
  }}
END { print total }
'
