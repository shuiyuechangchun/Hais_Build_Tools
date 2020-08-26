#!/bin/bash
SH_FILE=$(readlink -f "$0")			#脚本的文件
BASE_PATH=$(dirname $SH_FILE)		#脚本的目录
BINS=$BASE_PATH/00-Bins				#依赖目录
source $BINS/_init_hais_tools_		#依赖目录


#开始处理模块

createMagisk ${1} "传送门恢复" "
$WORK_BAK_PATH/system/system/priv-app/ContentExtension
$WORK_BAK_PATH/system/system/app/CatcherPatch
" &

mv -f "$WORK_BAK_PATH/system/system/data-app/XiaoAiSpeechEngine" "$WORK_BAK_PATH/system/system/app/XiaoAiSpeechEngine"
createMagisk ${1} "小爱语音恢复" "
$WORK_BAK_PATH/system/system/app/VoiceAssist
$WORK_BAK_PATH/system/system/app/XiaoAiSpeechEngine
$WORK_BAK_PATH/system/system/app/VoiceTrigger
" &

createMagisk ${1} "智能助理恢复" "
$WORK_BAK_PATH/system/system/priv-app/PersonalAssistant
" &

createMagisk ${1} "搜索桌面恢复" "
$WORK_BAK_PATH/system/system/priv-app/MiuiHome
$WORK_BAK_PATH/system/system/priv-app/QuickSearchBox
" &

wait

