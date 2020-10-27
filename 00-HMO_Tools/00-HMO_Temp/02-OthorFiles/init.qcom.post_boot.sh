# Copyright (C) 2020 The Amktiao
# Kernel Disabled ramdump&log
# LMK低内存调试
echo "0" > /sys/module/lowmemorykiller/parameters/debug_level
# I/O读写日志统计(eMMC)
echo "0" > /sys/block/mmcblk0/queue/iostats
# I/O读写日志统计(UFS/Nvme)
echo "0" > /sys/block/sda/queue/iostats
# 关闭内核debug
echo "0" > /sys/module/debug/parameters/enable_event_log
# 关闭内核glink调试
echo "0" > /sys/module/glink/parameters/debug_mask
# 关闭充电温控调试
echo "0" > /sys/module/qpnp_fg_gen3/parameters/debug_mask
# 关闭电源管理温控调试
echo "0" > /sys/module/qpnp_smb2/parameters/debug_mask

#开机释放缓存
echo 3 > /proc/sys/vm/drop_caches

#根据水龙再补充 禁用I/O调试
echo 0 > /sys/block/dm-0/queue/iostats
echo 0 > /sys/block/mmcblk0rpmb/queue/iostats
echo 0 > /sys/block/mmcblk1/queue/iostats
echo 0 > /sys/block/loop0/queue/iostats
echo 0 > /sys/block/loop1/queue/iostats
echo 0 > /sys/block/loop2/queue/iostats
echo 0 > /sys/block/loop3/queue/iostats
echo 0 > /sys/block/loop4/queue/iostats
echo 0 > /sys/block/loop5/queue/iostats
echo 0 > /sys/block/loop6/queue/iostats
echo 0 > /sys/block/loop7/queue/iostats