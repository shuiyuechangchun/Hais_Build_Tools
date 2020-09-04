#!/bin/bash


for file in `find ../Download/*.zip -type f` ;do
	bash ./00-CreateAndBuild.sh $file $1 
done
