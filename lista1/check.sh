#!/bin/bash
clear
for i in {1..7}
do
	cd zad$i
	echo "***** Checking zad$i.jl *****"
	julia zad$i.jl
	cd ..
done

echo "***** C program *****"
gcc test.c
./a.out
