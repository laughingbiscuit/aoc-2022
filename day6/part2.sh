#!/bin/sh
set -e
cat input.txt | sed 's/./&\n/g' | awk '
function checkForDupes(buff) {
  for(rowX in buff) {
    for(rowY in buff) {
      if(rowX != rowY && buff[rowX] != "" && 
          buff[rowY] != "" && buff[rowX] == buff[rowY]) {
        return 1
      }
    }
  }
  return 0
}
{
  qty=14
  for(i=qty; i>0; i--) {
    buff[i]=buff[i-1] 
  }
  buff[1]=$1
}
NR>=4{
  isDupe=checkForDupes(buff)

  if(isDupe!=1) {
    print NR
    exit
  }
}
'
