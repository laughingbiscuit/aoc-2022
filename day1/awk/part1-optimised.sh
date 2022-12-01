#!/bin/sh
set -e
cat ../input.txt | tr '\n' '+' | sed 's/++/\n/g' | bc -l | sort -n | tail -n 1
