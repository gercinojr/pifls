# Backup do Toolchain

depois do todo o processo do capítulo 5, fiz backup da pasta tools.

```
# cd $LFS
# tar -cpf tools.tar tools

```

montei o flashdrive e copie o backup para ele.

```
# mount /dev/sda1 /mnt
# cp tools.tar /mnt
# sync

```

Desmontei a partição, apaguei o arquivo criado e segui para o capítulo 6 do LFS.

```
# umount /dev/sda1
# rm tools.tar

```