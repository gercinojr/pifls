# Como montar um flashdrive no Raspberry Pi manualmente

> Obs.1: O diretório **/mnt** deve existir antes dos comandos abaixo.

> Obs.2: Meu flashdrive está formatado com **FAT32**.


```
# mount /dev/sda1 /mnt

``` 
para copiar alguma coisa:

```
# cp seus_arquivos /mnt

```

para desmontar:

```
# sync
# umount /dev/sda1

```