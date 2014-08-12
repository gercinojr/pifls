# Capítulo 5. Construindo um Sistema Temporário

No tutorial PILFS está escrito:

> Also, here is where you might want to start a **tmux** or **screen** session. Because if you break your ssh connection or your router has a hickup, your build will just stop.

Entendi que por causa da demora do processo de compilação dos pacotes, o sistema simplesmente pode parar por vários motivos, então sugere usar o **tmux** ou o **screen** para evitar que o sistema pare por causa desse tempo. O tmux (multiplexador de terminais) é mais moderno. Vou usá-lo!

Depois de cada compilação e instalação apagarei as pastas do fonte descompactados e dos binários para manter espaço livre para os outros processos.  

#### Como montar um flashdrive no Raspberry Pi manualmente

> Obs.1: O diretório **/mnt** deve existir antes dos comandos abaixo.

> Obs.2: Meu flashdrive está formatado com **FAT32**.

Pode ser que eu queira fazer backup de algum aquivo ou pasta em um flashdrive

para montar: 

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
