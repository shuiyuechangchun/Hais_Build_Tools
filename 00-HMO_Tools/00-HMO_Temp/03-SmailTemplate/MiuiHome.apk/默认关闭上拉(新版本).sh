SMALI_FILE="/smali/com/miui/home/launcher/search/SearchEdgeLayout.smali"						#文件路径
FIND_START='.method public refreshOldSettings()V'								#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容,主要是修改 const-string v1, "content_center"
REPLACE_CODE='
.method public refreshOldSettings()V
   .registers 3

   return-void
.end method
'