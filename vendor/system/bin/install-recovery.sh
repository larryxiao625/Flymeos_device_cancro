#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 13576192 1e74ff3ed1c580d430f6b4b2f32bc28880d8347f 10825728 81ae46a58ec97aa757fc3e4a3734de148450fba0
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:13576192:1e74ff3ed1c580d430f6b4b2f32bc28880d8347f; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:10825728:81ae46a58ec97aa757fc3e4a3734de148450fba0 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 1e74ff3ed1c580d430f6b4b2f32bc28880d8347f 13576192 81ae46a58ec97aa757fc3e4a3734de148450fba0:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
