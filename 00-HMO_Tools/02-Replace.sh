#!/bin/bash
BINS=$PWD/00-Bins				#依赖目录
source $BINS/_init_hais_tools_		#依赖目录
ReplaceFile=$TOOLS_HMO_TEMP/01-ReplaceFile	#替换的文件来源

replacefun(){
	for file in `find $ReplaceFile/${1}/* -type f`
	do
		sysFile=${file/$ReplaceFile/""}
		replaceBack $file $WORK_SRC_PATH$sysFile "fs"
	done
}

replacefun system
replacefun vendor
