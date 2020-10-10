# How to use Advanced Programming in the UNIX Environment, Third Eidition

 Environment: MAC

## Step1

download from http://www.apuebook.com/code3e.html 
click "here"

## Step2

move src.3e.tar.gz to /Users/XXX
解压
cd apue.3e

## Step3

make
cp ./include/apue.h /Usr/local/include
cp ./lib/libapue.a /Usr/local/lib

## Step4 

### 引用
由于放在了include下，不同系统有可能不是在上述的位置，比如ubuntu应该copy到 /usr/include  和/usr/lib
但是只要copy到这样的目录下，就可以用#include<apue.h>

### 编译
cc 1_3.c -o 1_3.o -lapue

有教程说要安装 libbsd-dev (大概Linux才需要，MAC不太需要)