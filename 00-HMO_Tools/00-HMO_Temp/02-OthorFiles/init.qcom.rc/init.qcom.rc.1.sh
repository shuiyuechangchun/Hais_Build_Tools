SMALI_FILE='/vendor/etc/init/hw/init.qcom.rc'			#文件路径
FIND_START='start qcom-c_main-sh'								#解压后要查找的开始代码
FILE_END='start vendor.cnss_diag'																#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='    start qcom-c_main-sh
    start wcnss-service'