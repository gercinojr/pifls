# Sistemas Operacionais

## Apresentação

Olá, meu nome é Gercino Jr, sou aluno do curso de **TADS (IFRN)** e neste semestre (2014.1) estou cursando a disciplina **Sistemas Operacionais (S.O.)** ministrada pelo professor **Leonardo Minora**. 

## Introdução

Na disciplina de S.O. nos é apresentado os conceitos fundamentais do funcionamento interno dos sistemas operacionais, tais como **processos**, **threads**, **deadlocks**, **escalonamento de processador** e etc.

Mas esta disciplina sem uma parte prática fica deficiente. Então o professor *Minora* nos apresentou o projeto [LFS](http://www.linuxfromscratch.org/) e mostrou a sua importância educacional.

Com a ajuda do projeto LFS podemos desenvolver uma distribuição GNU/Linux totalmente a partir dos fontes dos programas. Com isso o aluno absorve vários conceitos desta plataforma.

O projeto LFS é originalmente desenvolvido em um hardware **x86**, mas os seus conceitos podem ser aplicados em outras plataformas.

Eu optei por desenvolver para a plataforma **ARM**, utilizando o **Raspberry Pi** como suporte. Por isso também estou utilizando, paralelamente ao projeto LSF, um outro projeto complementar: [PiLFS](http://www.intestinate.com/pilfs/), que tem por base o LFS mas adiciona orientações específicas para a plataforma Raspberry Pi.

## Objetivos

1. Desenvolver uma distribuição GNU/Linux baseada no projeto [LFS 7.5](http://www.linuxfromscratch.org/).
2. Criar uma aplicação computacional que funcione sobre esta distribuição. 

## Desenvolvimento

#### Material

* Placa Raspberry Pi Model B - 512MiB
* Notebook com slot de cartão de memória, com Ubuntu 14.04 instalado
* Cartão de memória SD 8GB da marca Kingston
* Cabos para conexões

#### Metodologia

Foi instalado o sistema operacional [Raspbian] (http://www.raspbian.org/) no cartão de memória e foi seguido os passos dos projetos LFS e PiLFS.

## Referências (ordenado por importância)

1. [Livro (PDF) LFS 7.5](http://www.linuxfromscratch.org/lfs/downloads/stable/)
2. [Guia PiLFS](http://www.intestinate.com/pilfs/guide.html)
3. Mota Filho, João Eriberto. Descobrindo o Linux: entenda o sistema operacional GNU/Linux - 3.ed. - São Paulo. Novatec Editora, 2012.

