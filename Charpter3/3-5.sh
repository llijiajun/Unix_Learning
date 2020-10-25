#!/bin/bash

for i in {10..22}
do
let "buff=2**$i"
gcc 3-5.c -lapue -D BUFFSIZE=$buff -o 3-5.o
echo -------- BUFF: $buff --------
time ./3-5.o < /Users/jiajun_li/Desktop/Datasets/EB/Dataset/Flickr-u.txt > /Users/jiajun_li/Desktop/Datasets/EB/Dataset/Flickr-u2.txt
echo -----------------------------
done