#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 13586432 c30e9de2894334b12170dcfdbce4e903b36304c5 10835968 78ca7ef87fb374b65aed8fd85b324768b2637e8a
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:13586432:c30e9de2894334b12170dcfdbce4e903b36304c5; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:10835968:78ca7ef87fb374b65aed8fd85b324768b2637e8a EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery c30e9de2894334b12170dcfdbce4e903b36304c5 13586432 78ca7ef87fb374b65aed8fd85b324768b2637e8a:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
