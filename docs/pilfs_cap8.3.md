# 8.3. Linux-3.12.25+

> While you could potentially build your own Linux kernel as a part of your LFS build, I would strongly recommend that you ensure your system boots properly with the Raspberry Pi Foundation's kernel first.

Essa é uma vantagem para quem está fazendo o PiLFS sobre o LFS, pois já temos um kernel **padrão** compilado pela fundação Raspiberry Pi. 

Basta copiar os binários:

```
# cp -rv /sources/firmware-master/modules /lib

```

pronto! :-)

#### 8.3.2. Configurando Ordem de Carregamento de Módulos do Linux

Segui o livro LFS.

****

> A atapa **8.4. Usando o GRUB para Configurar o Processo de Boot** não foi feita por não haver GRUB para o Raspberry Pi. 