# 8.2. Criando o arquivo /etc/fstab

O arquivo sugerido pelo projeto PILFS (modo sem partição) é o seguinte:

```
# Begin /etc/fstab

# file system  mount-point  type     options           dump fsck order
/dev/mmcblk0p1 /boot        vfat     defaults            0     0
/dev/mmcblk0p2 /            ext4     defaults,noatime    0     1
#/swapfile     swap         swap     pri=1               0     0
proc           /proc        proc     nosuid,noexec,nodev 0     0
sysfs          /sys         sysfs    nosuid,noexec,nodev 0     0
devpts         /dev/pts     devpts   gid=5,mode=620      0     0
tmpfs          /run         tmpfs    defaults            0     0
devtmpfs       /dev         devtmpfs mode=0755,nosuid    0     0

```

