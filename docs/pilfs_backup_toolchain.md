# Backup do Toolchain

depois do todo o processo do capítulo 5, fiz backup da pasta tools.

```
# cd $LFS
# tar -cf tools.tar tools
# gzip -9 tools.tar

```

montei o flashdrive e copie o backup para ele.

```
# mount /dev/sda1 /mnt
# cp tools.tar.gz /mnt
# sync

```

Desmontei a partição e segui para o capítulo 6 do LFS.

```
# umount /dev/sda1

```