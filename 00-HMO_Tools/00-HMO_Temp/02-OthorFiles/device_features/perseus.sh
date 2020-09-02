SMALI_FILE='/system/etc/device_features/perseus.xml'			#文件路径
DEFAULT_CODE='<features>'	#旧代码

#要替换的内容
REPLACE_CODE='
<features>
    <bool name="support_multi_face_input_global">true</bool>
    <bool name="support_multi_face_input">true</bool>
'