#!/bin/sh
set -e

cat test-input.txt | awk '
{ 
  if($1 == "move") {
    # make a move on initialised ship
 
  }
  else if($0 != "") {
    # Initialise based on diagram
    cur=0
    while(substr($0, 1+cur*4, 4)!="") {
      if(match(substr($0, 1+cur*4, 4), /\[.\]/)) {
        tmpBoat[cur]=tmpBoat[cur] substr($0, 1+cur*4+1, 1)
      }
      cur+=1
    }
  }
  else {
    # Finished intialising - flip the strings
    for (row in tmpBoat) {
      for(i=length(tmpBoat[row]); i!=0; i--) {
        boat[row+1]=boat[row+1] substr(tmpBoat[row],i,1)
      }
    }
    print "Initialized with: "
    for (row in boat) {
      print row ":" boat[row]
    }
  }
}
'
