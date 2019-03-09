#!/bin/bash
make
clear
date
julia zad4_latex.jl > output.txt
./scan <output.txt
