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
gcc 1_3.c -o 1_3.o -lapue

 Environment: Ubuntu

不在root下，可暂时获得root权限

## Step1 & Step2
同上

## Step3

sudo apt-get install libbsd-dev

## Step4

cd apue.3e
make all

## Step5
放在随意的其他位置，例如“Unix”文件夹下：
cp ./include/apue.h PATH/Unix/include
cp ./lib/libapue.a PATH/Unix/lib

## 编译

gcc 1_3.c -o 1_3.o -I ../include -L ../lib -lapue

加入include可以找.h，加入-L是为了找链接库



