#!/bin/bash

# testa a existencia da variavel $LFS

if ! [[ -v LFS ]] ; then
    echo "variavel LFS nao declarada"
    exit 1
fi

# 6.2.2. Montando e Povoando /dev

mount -v --bind /dev $LFS/dev

# 6.2.3. Montando os Sistemas de Arquivos Virtuais do Kernel

mount -vt devpts devpts $LFS/dev/pts -o gid=5,mode=620
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

if [ -h $LFS/dev/shm ]; then
    mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi

# so para mostar que funcionou

ls $LFS/dev

