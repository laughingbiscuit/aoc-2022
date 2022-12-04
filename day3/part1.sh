#!/bin/sh
set -e

cat input.txt | awk '
# https://stackoverflow.com/questions/2499270
BEGIN{for(n=0;n<256;n++)ord[sprintf("%c",n)]=n}
function getDupeChar(str1, str2, chars1, chars2) {
  split(str1, chars1, "")
  split(str2, chars2, "")
  for (i=1; i <= length(str1); i++) {
    for (j=1; j <= length(str1); j++) {
      if(chars1[i] == chars2[j]) { return chars1[i] } 
    }
  }
}
{
  halfway=length($1)/2
  pocket1=substr($1, 1, halfway)
  pocket2=substr($1, halfway + 1)
  
  dupeChar = getDupeChar(pocket1, pocket2)
  dupeCharAscii = ord[dupeChar]
  if(dupeChar ~ /[A-Z]/) {
    priority = dupeCharAscii - 38
  }
  else {
    priority = dupeCharAscii - 96
  }
  priSum+=priority
}
END {
  print priSum
}'
