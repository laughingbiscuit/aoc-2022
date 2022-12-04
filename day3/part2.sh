#!/bin/sh
set -e

cat input.txt | awk '{ 
  group=group " " $1
  if(NR%3 == 0) { 
    print substr(group, 2)
    group=""
  }
}' | awk '
# https://stackoverflow.com/questions/2499270
BEGIN{for(n=0;n<256;n++)ord[sprintf("%c",n)]=n}
function getDupeChar(str1, str2, str3, chars1, chars2, chars3) {
  split(str1, chars1, "")
  split(str2, chars2, "")
  split(str3, chars3, "")
  for (i=1; i <= length(str1); i++) {
    for (j=1; j <= length(str2); j++) {
      for (k=1; k <= length(str3); k++) {
        if(chars1[i] == chars2[j] && chars1[i] == chars3[k]) { return chars1[i] } 
      }
    }
  }
}
{
  dupeChar = getDupeChar($1, $2, $3)
  dupeCharAscii = ord[dupeChar]
  if(dupeChar ~ /[A-Z]/) {
    priority = dupeCharAscii - 38
  }
  else {
    priority = dupeCharAscii - 96
  }
  if(priority > 0) { 
    priSum+=priority
  } 
}
END {
  print priSum
}'
