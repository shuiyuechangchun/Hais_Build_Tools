#!/bin/bash


for file in `find ../*.zip -type f` ;do
	bash ./00-CreateAndBuild.sh $file $1 
	rm -rf $file
done
