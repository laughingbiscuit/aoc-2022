#!/bin/sh
set -e

cat input.txt | awk '
function makeMove(src, dest) {
  boat[dest]=boat[dest] substr(boat[src], length(boat[src]), 1)
  boat[src]=substr(boat[src], 1, length(boat[src])-1)
}
{ 
  if($1 == "move") {
    # make a move on initialised ship
    for(i = 0; i < $2; i++) {
      makeMove($4, $6)
    }
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
END {
  print "Finished with:"
  for (row in boat) {
    print row ":" boat[row]
  }
  print "Crates on top:"
  top=""
  for (row in boat) {
    top=top substr(boat[row], length(boat[row]), 1)
  }
  print top
}
'
