#!/bin/bash

awk '{if (/[0-9]/) & !/[X-Y]/ & !/[x-y]/} END' {print length($0)} ~/HW8/'6'/fin > ~/HW8/'6'/fout.txt
