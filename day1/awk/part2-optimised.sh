#!/bin/sh
set -e
cat ../input.txt | tr '\n' '+' | sed 's/++/\n/g' | bc -l | sort -nr | head -n 3 | tr '\n' '+' | sed 's/$/0/' | bc -l
