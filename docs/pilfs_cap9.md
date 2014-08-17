# 9.0. O final

Estou ancioso!

Agora é desmontar as partições montadas (caso estejam montadas)

```
# umount /dev/sda1

```

Fazer logout

```
# logout

```

Desligar o Raspberry Pi

```
#shutdown -h now

```

Levar o cartão de memória para o PC e fazer o backup do mesmo

> Antes de fazer o backup é necessário desmontar as partições. Utilizei o aplicativo GParted para escolher o dispositivo **/dev/sdb** e desmontar as duas partições **/dev/sdb1** e **/dev/sdb2**

#### Fazer o backup total do cartão de memória (/dev/sdb)

Lembrese de executar este comando em um lugar onde exista expaço suficiente: **8GB livres**!

```
# dcvldd if=/dev/sdb of=flashdrive.img

```

#### Reformulando a partição do sistema

Ejetei o cartão de memória e o coloquei novamente no PC para que todas as partições fossem montadas novamente... e:

> Sistema do meu PC é o Ubuntu 14.04 64 bits

```
cd /mnt
shopt -s extglobs
sudo rm -rf !(lfs)

```

E agora trazendo os arquivos da pasta /lfs para a raiz do flashdrive

```
mv /mnt/lfs/* /mnt

```

#### Testando o novo sistema

Ejeta o cartão de memória e coloca no Raspberry e liga!!!!

Veja o resultado no arquivo de log **inicializacao.log**.