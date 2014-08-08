# Parte 0 – Exigências de Sistema

Todos os pacotes listados abaixo devem possuir no **mínimo** as versões sugeridas. As vezes também é informada uma versão máxima.

#### Nem todos os pacotes listados abaixo estão instalados no Raspbian

Instalando os pacotes faltantes

```
apt-get update
apt-get install bison gawk m4 texinfo

```

#### Requerimentos do Sistema host

> Bash-3.2 (/bin/sh should be a symbolic or hard link to bash)

__Versão do host__  
4.2.37(1)

__Metodologia__

```
$ bash --version
4.2.37(1)-release (arm-unknown-linux-gnueablihf)

```
Não é necessário fazer correções.

__Link Simbólico__  
O link simbólico citado não aponta para onde deveria:

```
$ ls -la /bin/sh
/bin/sh -> dash

```		 		

Devemos apagar o link simbólico...

```
# rm /bin/sh
# ln -s bash /bin/sh

```
e criar um novo

```
# ln -s bash /bin/sh

```
verificando se está correto:

```
$ ls -la /bin/sh
/bin/sh -> bash

```

<br />

> Binutils-2.17 (Versions greater than 2.24 are not recommended as they have not been tested)

__Versão do host__  
Binutils-2.22

__Metodologia__  
Desde que o binutils é uma coleção de ferramentas, podemos verificar com qualquer um dos comandos abaixo. Todos devem apresentar a mesma versão (versão do binutils)

```
$ ld --version
GNU ld (GNU Binutils for Debian) 2.22
$ as --version
GNU assembler (GNU Binutils for Debian) 2.22
$ size --version
GNU size (GNU Binutils for Debian) 2.22

```

Não é necessário nenhuma correção.

<br />		 

> Bison-2.3 (/usr/bin/yacc should be a link to bison or small script that executes bison)

__Versão do host__  
Bison-2.5

__Metodologia__

O programa Bison não estava instalado, logo:

```
# apt-get install bison

```
Agora podemos verificar sua versão

```
$ bison --version
bison (GNU Bison) 2.5

```

Apesar de apresentar uma versão mais atual, o texto não informa o um limite superior.

__Link Simbólico__  
O link simbólico citado não aponta para onde deveria:

```
$ ls -la /usr/bin/yacc
/usr/bin/yacc -> /etc/alternatives/yacc

```		 		

Devemos apagar o link simbólico...

```
# rm /usr/bin/yacc

```
e criar um novo

```
# ln -s bison /usr/bin/yacc

```

verificando se está correto:

```
$ ls -la /usr/bin/yacc
/usr/bin/yacc -> bison

```

<br /> 

> Bzip2-1.0.4

__Versão do host__  
Bzip2-1.0.6


__Metodologia__

```
$ bzip2 --version
bzip2, a block-sorting file compressor.  Version 1.0.6, 6-Sept-2010.

```

Não é necessário fazer correções.

<br />

> Coreutils-6.9

__Versão do host__  
Coreutils-8.13

__Metodologia__  
The GNU Core Utilities are the basic file, shell and text manipulation utilities of the GNU operating system.
These are the core utilities which are expected to exist on every operating system. 

Podemos verificar com qualquer um dos comandos abaixo. Todos devem apresentar a mesma versão (versão do Coreutils).

```
$ ls --version
ls (GNU coreutils) 8.13
$ rm --version
rm (GNU coreutils) 8.13
$ cat --version
cat (GNU coreutils) 8.13

```

Não é necessário fazer correções.

<br />

> Diffutils-2.8.1

__Versão do host__  
Diffutils-3.2

__Metodologia__  
GNU Diffutils is a package of several programs related to finding differences between files.

Podemos verificar com qualquer um dos comandos abaixo. Todos devem apresentar a mesma versão (versão do Diffutils).

```
$ cmp --version
cmp (GNU diffutils) 3.2
$ diff --version
diff (GNU diffutils) 3.2
$ sdiff --version
sdiff (GNU diffutils) 3.2

```
Não é necessário fazer correções.

<br />

> Findutils-4.2.31

__Versão do host__  
Findutils-4.4.2

__Metodologia__  
The GNU Find Utilities are the basic directory searching utilities of the GNU operating system. These programs are typically used in conjunction with other programs to provide modular and powerful directory search and file locating capabilities to other commands. 

Podemos verificar com qualquer um dos comandos abaixo. Todos devem apresentar a mesma versão (versão do Findutils).

```
$ find --version
find (GNU findutils) 4.4.2
$ xargs --version
xargs (GNU findutils) 4.4.2

```

Não é necessário fazer correções.

<br />

> Gawk-4.0.1 (/usr/bin/awk should be a link to gawk)

__Versão do host__  
Gawk-4.0.1

__Metologia__  


> O programa Gawk não estava instalado, logo:

```
# apt-get install gawk

```
agora podemos verificar sua versão

```
$ gawk --version
GNU Awk 4.0.1

```

__Link Simbólico__  
O link simbólico citado não aponta para onde deveria:

```

ls -la /usr/bin/awk
/usr/bin/awk -> /etc/alternatives/awk

```		 		

Devemos apagar o link simbólico...

```

# rm /usr/bin/awk

```
e criar um novo

```

# ln -s gawk /usr/bin/awk

```

verificando se está correto:

```

ls -la /usr/bin/awk
/usr/bin/awk -> gawk

```

<br />

> GCC-4.1.2 including the C++ compiler, g++ (Versions greater than 4.8.2 are 
not recommended as they have not been tested)

__Versão do host__  
GCC 4.6.3  
g++ 4.6.2

__Metodologia__

```
$ gcc --version
gcc (Debian 4.6.3-14+rpi1) 4.6.3
$ g++ --version
g++ (Debian 4.5.3-14+rpi1) 4.6.3

```

Não é necessário fazer correções.


* Note:  
On some distributions, there have been reports that some libraries used by gcc can be in an inconsistent state and that this interferes with building some LFS packages. To check this, look in /usr/lib and possibly /usr/lib64 for libgmp.la, libmpfr.la, and libmpc.la. Either all three should be present or absent, but not only one or two. If the problem exists on your system, either rename or delete the .la files or install the appropriate missing package.

__Metodologia__

```
$ cd /usr
$ find . -name lib\*.la

```

O comando anterior irá pesquisar dentro do diretório corrente "/usr" (recursivamente por padrão) por arquivos com nomes iniciados por "lib" e terminados por ".la". 

*Nenhum dos arquivos citados existem nos diretórios especificados.*

<br />

> Glibc-2.5.1 (Versions greater than 2.19 are not recommended as they have not been tested)

__Versão do host__  
Glibc-2.13

__Metodologia__  
Any Unix-like operating system needs a C library: the library which defines the "system calls" and other basic facilities such as open, malloc, printf, exit... 

Uma maneira segura de verificar a versão das bibliotecas da linguagem c (glibc) é fazer o que se segue:

1.. Edição de um programa em c (teste.c)	

```

#include <stdio.h>
#include <gnu/libc-version.h>
					
int main (void) {
    puts(gnu_get_libc_version());
    return 0;
}

```

2.. compilação e execução

```

$ gcc teste.c
$ ./a.out
$ 2.13

```

Não é necessário fazer correções.

<br />

> Grep-2.5.1a

__Versão do host__  
Grep-2.12

__Metodologia__

```
grep --version
grep (GNU grep) 2.12

```

Não é necessário fazer correções.

<br />

> Gzip-1.3.12

__Versão do host__  
Gzip-1.5

__Metodologia__  

```
$ gzip --version
gzip 1.5

```

Não é necessário fazer correções.

<br />

> Linux Kernel-2.6.32

__Versão do host__  
Linux Kernel-3.12.22+

__Metodologia__

```
$ uname -r 
3.12.22+

```

Não é necessário fazer correções.

<br />

> M4-1.4.10

__Versão do host__  
1.4.16

__Metodologia__  

```
$ m4 --version
m4 (GNU M4) 1.4.16

```

Não é necessário fazer correções.

<br />

> Make-3.81

__Versão do host__  
3.81

__Metodologia__  

```
$ make --version
GNU Make 3.81

```

Não é necessário fazer correções.

<br />

> Patch-2.5.4

__Versão do host__  
2.6.1

__Metodologia__  

```
$ patch --version
patch 2.6.1

```

Não é necessário fazer correções.

<br />

> Perl-5.8.8

__Versão do host__  
5.14.2

__Metodologia__  

```
$ perl --version
This is perl 5, version 14, subversion 2 (v5.14.2) ...

```

Não é necessário fazer correções.

<br />

> Sed-4.1.5

__Versão do host__  
4.2.1

__Metodologia__  

```
$ sed --version
GNU sed version 4.2.1

```

Não é necessário fazer correções.

<br />

> Tar-1.18

__Versão do host__  
1.26

__Metodologia__  

```
$ tar --version
tar (GNU tar) 1.26

```

Não é necessário fazer correções.

<br />

> Xz-5.0.0

__Versão do host__  
5.1.0alpha

__Metodologia__  

```
$ xz --version
xz (XZ Utils) 5.1.0alpha

```

Não é necessário fazer correções.

<br />

---

<br />

## Errata for the 7.5 Version of the LFS Book

Data de acesso: 31/07/2014

> Miscellaneous Errata
>
> In procps, e2fsprog, and ineutils, there are references to things not being built "because util-linux has already installed them". Now that util-linux depends on udevd and has been moved much farther in the book, those should > read "because util-linux will install them later".

Verificar a existência de novas versões (mais de 6 meses do lançamento)

* Versão 7.5 -> data de lançamento: 2 de Março de 2014
sites: http://www.linuxfromscratch.org/mirrors.html


## FAQ (Perguntas Frequentes)
	
* http://www.linuxfromscratch.org/faq/

## Ajuda 

* http://www.linuxfromscratch.org/faq/#generalfaq
* http://www.linuxfromscratch.org/hints/downloads/files/errors.txt
* http://www.linuxfromscratch.org/search.html
