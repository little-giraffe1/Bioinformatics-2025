#!/bin/bash

awk -F'	' '{ for (i=1; i<=NF; i++) sum += $i } END { print sum }' ~/HW8/1/fin > ~/HW8/1/fout.txt
