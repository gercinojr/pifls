# Capítulo 7.6. LFS-Bootscripts-20130821

Antes de continuar, gostaria de registrar que simplesmente pulei os passos 

7.2 - Configuração Geral de Rede
7.3 - Customizando o Arquivo /etc/hosts
7.5 - Criando Symlinks para Dispositivos

pois acho que podem ser feitos depois. Estou ancioso para ver o sistema funcionar.

#### Entrando no sistema Chroot

Antes de começar, reiniciei o sistema para garantir um início limpo.

Fiz o login como root e depois entrei no modo Chroot

```
# ./lfs1.sh
# ./lfs3.sh

```
Lembrando que **lfs1.sh** cria os dispositivos virtuais na pasta /dev, e o **lfs3.sh** faz realmente o login no sistema chroot com o modelo novo (sem suporte ao $LFS/tools.

> obs.: gostaria de registrar que o sistema ainda não pede senha para logar, apesar dela já estar definida.

#### Descompactação do arquivo lfs-bootscripts-20130821.tar.bz2

```
# cd /sources
# tar -jxvf lfs-bootscripts-20130821.tar.bz2 

```

#### Instalação do LFS-Bootscripts

````
# cd lfs-bootscripts-20130821
# make install

````
