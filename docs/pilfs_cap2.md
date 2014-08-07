# Parte II – Preparando para Construção

Como o Raspberry Pi não tem uma BIOS convencional, os vários parâmetros de configuração do sistema que normalmente seriam mantidos e criados usando o BIOS agora são armazenados em um arquivo de texto chamado "config.txt".

## Liberando o máximo de memória para o processador

É uma boa idéia ter a quantidade máxima de memória RAM disponível para a construção. Alterei manualmente, acrescentando 

``` 
gpu_mem=16

```

no arquivo `/boot/config.txt`.

16MiB é o valor mínimo atribuído à GPU. O resto fica com o processador (é preciso reiniciar).

## Definido a senha do root

```
passwd root

```

## Liberando mais espaço no Cartão de memória

Na instalação do Raspbian eu optei pelo boot direto na linha de comando. Assim eu poderia desinstalar alguns programas para liberar espaço.

Verificando o espaço usado:

```
df -h

```

|      | SISE  | USE   | AVAIL | USE% | MOUNTED ON|
|------|-------|-------|-------|------|-----------|
|rootfs| 7.1G  | 2.3G  | 4.5G  | 35%  | /         |

Desinstalando a parte gráfica:

```
# apt-get remove x11-common

```

vai desinstalar um monte de pacotes. Aqui liberou aproximadamente 800MiB.

Para remover os pacotes orfãos:

```
# apt-get autoremove

```
Liberou mais 180MiB de espaço! Nada mal :-)

Verificando novamente:

```
df -h

```

|      | SISE  | USE   | AVAIL | USE% | MOUNTED ON|
|------|-------|-------|-------|------|-----------|
|rootfs| 7.1G  | 1.2G  | 5.6G  | 17%  | /         |

## Preparando o diretório de trabalho

```
export LFS=/lfs
mkdir -pv $LFS

```

