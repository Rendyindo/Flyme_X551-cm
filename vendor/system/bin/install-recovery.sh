#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8531968 726a025802581c7ba427b98793fbc70407ca2258 6000640 0a7b85685df53bcc86cec9da6118b30e3e3a420b
fi

if ! applypatch -c EMMC:/dev/recovery:8531968:726a025802581c7ba427b98793fbc70407ca2258; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/bootimg:6000640:0a7b85685df53bcc86cec9da6118b30e3e3a420b EMMC:/dev/recovery 726a025802581c7ba427b98793fbc70407ca2258 8531968 0a7b85685df53bcc86cec9da6118b30e3e3a420b:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
