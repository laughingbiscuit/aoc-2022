#!/bin/sh
set -e

# A rock B paper C scis
# X rock Y paper Z scis

cat input.txt | awk 'function play(them,me) {
  if(them=="A" && me=="X") { return 3+1 }
  if(them=="A" && me=="Y") { return 6+2 }
  if(them=="A" && me=="Z") { return 0+3 }
  if(them=="B" && me=="X") { return 0+1 }
  if(them=="B" && me=="Y") { return 3+2 }
  if(them=="B" && me=="Z") { return 6+3 }
  if(them=="C" && me=="X") { return 6+1 }
  if(them=="C" && me=="Y") { return 0+2 }
  if(them=="C" && me=="Z") { return 3+3 }
}
{
  total+=play($1, $2)
}
END{
  print total
}'
