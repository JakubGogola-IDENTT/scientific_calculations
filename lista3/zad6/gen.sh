#!/bin/bash

make
date
julia zad6_latex.jl > output.txt
./scan <output.txt
