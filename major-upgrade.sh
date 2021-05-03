#!/bin/bash
git fetch --all --tags
read -p "What is the tag you want to merge? " tag
git merge -X theirs "$tag" 

mkdir tos-logo
cp -r drivers/video/logo/*.ppm tos-logo

git clone https://github.com/zen-kernel/zen-kernel.git linux
cd linux
git checkout "$tag"
cd ../
cp -r linux/* .
rm -rf linux

sed -i 's/-arch1/-tos1/g' Makefile
sed -i 's/-zen/-tos1/g' Makefile
bash version.sh
cp tos-logo/* drivers/video/logo
rm -rf tos-logo
