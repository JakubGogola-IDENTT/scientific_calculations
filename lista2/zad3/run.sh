#!/bin/bash
make
clear
date
julia zad3_latex.jl > output.txt
./scan <output.txt
