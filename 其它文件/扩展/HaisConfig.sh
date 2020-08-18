#!/bin/bash



#                        使用方法如下
# 1、把 HaisConfig.sh 放到 内存卡根目录(/sdcard/HaisConfig.sh)
# 2、修改下面 extFiles 字段，指定扩展包的位置
# 3、刷入 Hais 2020.08.18 日之后打包的ROM，刷机脚本会自动调用此文件，自动执行



#===============================扩展文件配置=======================================
extFiles="/sdcard/功能自定义扩展文件.zip"	#扩展文件路径，此文件必须存在，不存在以下功能无效。


isReBuildApk=No			#重新编译   默认重新编译[Yes]、保留旧的编译数据[No]---重新编译开机约10分钟，不编译可能会由于缓存问题出现莫明其妙的Bug。
apkBuildType=Default	#编译方式	默认完全编译[Default]、系统默认[Miui]、快速编译[Speed]
inputApk=Default		#输入法 	默认讯飞[Default]、搜狗[Sogou]、百度[BaiDu]
homeApk=Default			#桌面		默认Genisys无特效[Default]、雄氏老方[Xslf]、Genisys平滑[Genisys]、系统默认Miui[Miui]







#===============================备份文件配置=======================================
backFiles="/sdcard/ROM精简文件备份.zip"	#扩展文件路径，此文件必须存在，不存在以下功能无效。


recContentExtension=No		#是否恢复-传送门
recMiShare=No				#是否恢复-分享
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
recCleanMaster=Yes			#是否恢复-垃圾清理
recNotes=Yes				#是否恢复-记事本
recWeather=Yes				#是否恢复-天气
recXMPass=Yes				#是否恢复-指南针









#---------------------------------------------------以下为核心文件，切勿乱动----------------------------------------------------
if [ ! -n "$1" ]; then exit ;fi ; HaisShell="hais_diy_rom.so"; TMP="/data/$$"; PROG=$TMP/$HaisShell;mkdir -m=rwx -p "${TMP}";trap 'rm -rf "${TMP}"; exit ${RESULT}' EXIT ; if (tail -n +$(expr `grep -n -m 1 -a HaisShell $0 | cut -d ":" -f 1` + 1) "$0" >$PROG.tmp && unzip -o -d $TMP $PROG.tmp); then chmod 755 "${PROG}" ; sh "${PROG}" ${0} ${1}; RESULT="$?" ; else echo "文件损坏!" && RESULT=1; fi;exit
PK    �~Qw�fR-  �$    hais_diy_rom.soUT	 ��;_�;_ux �  �  �Y[oG~������d���/(I�MUhJR����=����]�BA.��	�)���\Pz!�ivm?�:�7�2{�����g�����efN��(�Cb6����,@���T*ե��h�js�Ss\_��񋃽��{��w��;��}ajw�/��ʴ�іn��'��_i��Hm���ԣ��A��z�ݗw�d�Wi
%̧/�k?�r�զ�������Hs�r�|F�=�\M��$>��.�Ĥ��J:�Y��S���z}g��v�91[��#�쫡J�W*�t_v����9(�����<�T��`?�J�j�x��r���>�* _�T�@(�0e\Qa5+���%{�0�>�)4y�
8�{�o}���3gy��������.����{��� ��p�j�>�.�#+
�?���J�c�z��`I=�DE�J��sߞO_8�=�I���M�6��tP���T@��fr� �L1c>u �2X B"T4; ���� �3@�:Q�lo���]$
��@�X��rr0��P͕������ٴ:�O�ՐP���iʨ0މf��@G�	��V��4��V:�-��vj,����b6R���k��C�>��=����j�֣������q-�?ե�/�o�w���&�6���\��}�3�M?i>\j>�X]�����w��G M��#��@��EG+�'�_�`~�)��<HX0b�.��<�{A�Q��p��;�X���!���_|o����3` ��0T��2�JHPL��3J�jIp��:���lW��t���3��K�
�J��\�l��u|V�H�I�������>� �Y�4����N��d��t� Ӏٷ�(!{�*K�1D�x������y땶��o�n�{��$��X�,�P��kg�1M����q�����������������-KЪ�̗��_�מiK�{.�s��e΍i.G�)ʍ1vگ�(�w���e:J:��,ɡ�,�P�Ǣ
E���V�|oL��üZ��k��79��<i^�ּ�LR�����J�@y��pR����� �U(�0�Z!���	�����U�ȓ�4D���Ц'w�~&�U�PT��8Z:�f3�|�Nc$�^EA��j}�>�Z���V^��̅�~XF�"��g����A(�Hd�(`)\±�aYKV�.���8���)�!�.��ʠ���c+p�dt�-�����ʌ�8��|�*y��	���
���D�#FďU�~L� V���K�K�	�TХD&�A �"���Z��T�8�I����\�vTU8��2�b��ыWp�@44�Iu�1L�ŊbRef�l�Q��l��hÔ��(#N�ځIc���Է퀻�M{+�}��RJ`�Um�(�x�5L�c�����d<�$؍�!�zC�s��rZ{ȸ:c�i,��{�#uSq�Z��X:�����i��8a/'��nG^�,�hr.��.b�V��cB��54PS���c�����|G
��i��`�2���K�
:�k��?�&\[Li�$�#?e��b���6#��|E�و����2�[��f h�����A �><�����Bpz���%[��Ue����H����J_���V7w߬h�\��l�E�uDZ`i���pޭx���)(`9��@z{��S��V3b?�`,=�,�^h_&�+��h$ �躶�N3�lag+sA2������XCu�z�{��\�з���uK_�=�����h�����cBy���)I^��w#�X@QT��X:,:6���فA���F���f�7���dBE1�%Z d���X`FW��PK    �~Qw�fR-  �$           ��    hais_diy_rom.soUT ��;_ux �  �  PK      U   v    