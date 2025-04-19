#!/bin/bash

awk '{print substr($0, 10, 1)}' ~/HW8/3/fin > ~/HW8/3/fout.txt
