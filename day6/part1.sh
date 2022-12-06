#!/bin/sh
set -e
cat input.txt | sed 's/./&\n/g' | awk '
{
  threeBack=twoBack
  twoBack=oneBack
  oneBack=cur
  cur=$1
}
NR>=4{
  if( cur != oneBack && cur != twoBack && cur != threeBack &&
      oneBack != twoBack && oneBack != threeBack && 
      twoBack != threeBack ) {
    print NR
    exit
  }
}
'
