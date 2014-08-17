# Capítulo 7.9. Configurando o Script Setclock

Aqui o fluxo de trabalho muda um pouco. 

Pelo **LFS** é trilhado um caminho onde o *host* tem suporte à manutenção do horário enquando desligado. Isso não pode ser feito no **Raspberry Pi** pois o mesmo não possui bateria para manter o horário sincronizado. Então o projeto PiLFS nos fornece alguns [scripts](http://www.intestinate.com/pilfs/scripts/pilfs-bootscripts-20140312.tar.xz) para amenisar essa dificuldade.

Baixei o arquivo do link acima e copiei para um flashdrive.

Montei o flashdrive de dentro do próprio chroot e copiei o arquivo para a pasta /sources:

```
# mount /dev/sda1 /mnt
# cd /mnt
# cp pilfs-bootscripts-20140312.tar.xz /sources

```

Desmontei a unidade

```
# cd /sources
# umount /dev/sda1

```

Descompactei os scripts

```
# tar -xJf pilfs-bootscripts-20140312.tar.xz

```

Instalei os scripts sugeridos pelo PILFS:

```
# make install-networkfix install-swapfix install-fake-hwclock install-switch-cpu-governor

```
