# Sistemas Operacionais

## Apresentação

Olá, meu nome é Gercino Jr, sou aluno do curso de **TADS (IFRN)** e neste semestre (2014.1) estou cursando a disciplina **Sistemas Operacionais (S.O.)** ministrada pelo professor **Leonardo Minora**. 

## Introdução

Na disciplina de S.O. nos é apresentado os conceitos fundamentais do funcionamento interno dos sistemas operacionais, tais como **processos**, **threads**, **deadlocks**, **escalonamento de processador** e etc.

Mas esta disciplina sem uma parte prática fica deficiente. Então o professor *Minora* nos apresentou o projeto [LFS](http://www.linuxfromscratch.org/) e mostrou a sua importância educacional.

Com a ajuda do projeto LFS podemos desenvolver uma distribuição GNU/Linux totalmente a partir dos fontes dos programas. Com isso o aluno absorve vários conceitos desta plataforma.

O projeto LFS é originalmente desenvolvido em um hardware **x86**, mas os seus conceitos podem ser aplicados em outras arquiteturas.

Eu optei por desenvolver para à arquitetura **ARM**, utilizando o **Raspberry Pi** como hardware. Por isso também estou utilizando, paralelamente ao projeto LSF, um outro projeto complementar: [PiLFS](http://www.intestinate.com/pilfs/), que tem por base o LFS mas adiciona orientações específicas para a plataforma Raspberry Pi.

## Objetivos Gerais

1. Desenvolver uma distribuição GNU/Linux baseada no projeto [LFS 7.5](http://www.linuxfromscratch.org/).
2. Desenvolver uma aplicação computacional que funcione sobre o projeto LFS desenvolvido. 

## Desenvolvimento

A aplicação computacional visa estabelecer a comunicação **bidirecional** entre um computador **Raspberry Pi**, com LFS como sistema operacional, e uma plataforma de prototipagem **Arduino**.

#### Material

* Placa Raspberry Pi Model B - 512MiB - Rev.2
* Plataforma de prototipagem Arduino modelo UNO
* Notebook com slot de cartão de memória, com Ubuntu 14.04 instalado
* Cartão de memória SD 8GB da marca Kingston
* 3 leds (verde, amarelo e vermelho)
* 3 resistores de 220ohm
* 1 resistor de 10kohm
* 1 push button
* CI CD4050BE
* Cabos diversos para conexões

#### Metodologia

> **Sistema LFS**  
Instalar o sistema operacional [Raspbian] (http://www.raspbian.org/) no cartão de memória e seguir os passos dos projetos LFS e PiLFS.

> **Aplicação Computacional**  
Codificar um *sketch* para o Arduino utilizando o aplicativo Arduino IDE e gravá-lo no Arduino. Este *sketch* tem por objetivo fazer uma **sinaleira** com os leds. A medida que a sinaleira muda de estado o Arduino informa ao Raspberry seu novo estado. Este último imprime no console o novo estado. Existirá um botão que (re)inicializará todo o processo. 

## Referências (ordenado por importância)

1. [Livro (PDF) LFS 7.5](http://www.linuxfromscratch.org/lfs/downloads/stable/)
2. [Guia PiLFS](http://www.intestinate.com/pilfs/guide.html)
3. Mota Filho, João Eriberto. Descobrindo o Linux: entenda o sistema operacional GNU/Linux - 3.ed. - São Paulo. Novatec Editora, 2012.

