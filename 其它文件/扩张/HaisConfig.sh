#!/bin/bash

#                        使用方法如下
# 1、把 HaisConfig.sh、HaisRom.so 放到 内存卡根目录(/sdcard/)
# 2、修改下面 extFiles、backFiles 字段，指定扩展包的位置
# 3、刷入 Hais 2020.08.18 日之后打包的ROM，刷机脚本会自动调用此文件，自动执行
# 4、刷入 Rom后查看 /tmp/mHaisExtended.log 可查看刷入日记

#===============================扩展文件配置=======================================
extFiles="/sdcard/功能自定义扩展文件.zip"	#扩展文件路径，此文件必须存在，不存在以下功能无效。

isReBuildApk=No			#重新编译   默认重新编译[Yes]、保留旧的编译数据[No]---重新编译开机约10分钟，不编译可能会由于缓存问题出现莫明其妙的Bug。
apkBuildType=Default	#编译方式	默认完全编译[Default]、系统默认[Miui]、快速编译[Speed]
inputApk=Default			#输入法 	默认讯飞[Default]、搜狗[Sogou]、百度[BaiDu]
homeApk=Default			#桌面		默认Genisys无特效[Default]、雄氏老方[Xslf]、Genisys平滑[Genisys]、系统Miui[Miui]


#===============================备份文件配置=======================================
backFiles="/sdcard/ROM精简文件备份.zip"	#扩展文件路径，此文件必须存在，不存在以下功能无效。

recContentExtension=No		#是否恢复-传送门
recMiShare=Yes				#是否恢复-分享
recVoiceAssist=No			#是否恢复-小爱
recGoogleServer=No			#是否恢复-谷歌服务
recMiuiBrowser=No			#是否恢复-小米浏览器
recMiuiVideo=No				#是否恢复-小米视频
recMiuiMusic=No				#是否恢复-小米音乐
recMiuiHome=No				#是否恢复-Miui桌面
recPersonalAssistant=No		#是否恢复-桌面助理
recQuickSearchBox=No		#是否恢复-搜索
recNewHome=No				#是否恢复-内容中心
recSoundRecorder=No			#是否恢复-录音机


#以下功能需 全新刷入放可生效。
recCleanMaster=No			#是否恢复-垃圾清理
recNotes=No					#是否恢复-记事本
recWeather=No				#是否恢复-天气
recXMPass=No				#是否恢复-指南针


if [ ! -n "$1" ]; then 
	sh /sdcard/HaisRom.so $0
fi
