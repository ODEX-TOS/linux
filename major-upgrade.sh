#!/bin/bash
git fetch --all --tags
read -p "What is the tag you want to merge? " tag
git merge -X theirs "$tag" 

mkdir tos-logo
cp -r drivers/video/logo/*.ppm tos-logo

git clone https://git.archlinux.org/linux.git
cd linux
git checkout "$tag"
cd ../
cp -r linux/* .
rm -rf linux

sed -i 's/-arch1/-tos1/g' Makefile
cp tos-logo/* drivers/video/logo

