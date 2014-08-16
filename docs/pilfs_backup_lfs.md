# Backup do lfs

Depois do todo o processo do capítulo 6, fiz backup da pasta /lfs. Para isso devemos sair primeiro do chroot:

```
# logout

```
ainda como root, é necessaário reiniciar o sistema pois o sistema de arquivos virtuais do kernel está montado (/dev) e eu não sei um comando que faça isso :-)

```
# shutdown -r now

```

após refazer o login, entrar como root

```
su -

```
arquivar a pasta /lfs (demora um pouco)

```
cd /
tar -cpf lfs_antes_cap7.tar lfs

``` 

montei o flashdrive e copie o backup para ele (demora um pouco... afinal aqui está marcando 1.9GiB).

```
# mount /dev/sda1 /mnt
# cp lfs_antes_cap7.tar /mnt
# sync

```

Desmontei a partição, apaguei o arquivo criado e segui para o capítulo 7 do LFS.

```
# umount /dev/sda1
# rm lfs_antes_cap7.tar

```