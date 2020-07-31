SMALI_FILE='/vendor/etc/init/hw/init.qcom.rc'			#文件路径
FIND_START='service tcpdump '								#解压后要查找的开始代码
FILE_END='    oneshot'																#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
'