#!/bin/sh
set -e

# A rock B paper C scis
# X lose Y draw Z win

cat input.txt | awk 'function play(them,me) {
  if(them=="A" && me=="X") { return 3+0 }
  if(them=="A" && me=="Y") { return 1+3 }
  if(them=="A" && me=="Z") { return 2+6 }
  if(them=="B" && me=="X") { return 1+0 }
  if(them=="B" && me=="Y") { return 2+3 }
  if(them=="B" && me=="Z") { return 3+6 }
  if(them=="C" && me=="X") { return 2+0 }
  if(them=="C" && me=="Y") { return 3+3 }
  if(them=="C" && me=="Z") { return 1+6 }
}
{
  total+=play($1, $2)
}
END{
  print total
}'
