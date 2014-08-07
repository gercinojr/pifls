# Parte I – Introdução

## Host escolhido

Raspbian - Debian Wheezy  
Version: June 2014  
Release date: 2014-06-20

__Motivos__  

* Acredito que esteja entre os sistemas mais difundidos para esta plataforma e é baseado no debian;
* O projeto PiLFS também usou o Raspbian;
* Configuração facilitada do mapeamento do teclado;
* Configuração automática da rede;

## Como construir o sistema LFS

O projeto **PiLFS** sugere duas opções como metodologia a se seguir:

1. Se **não** tivermos um PC com um slot para cartão de memória a única opção é fazer tudo a partir do **Raspberry Pi**. Depois de logado no sistema *Raspbian*, devemos criar uma nova partição e fazer desta a partição **$lfs**. Quando terminarmos todo o processo de criação, devemos instalar um *bootloader* (o Raspbian não vem com bootloader) no cartão de memória e configurar para que faça o boot pela partição **$lfs**.
2. Caso tenhamos um PC com um slot para cartão de memória, então podemos optar por *criar uma nova partição* **ou** *fazer tudo dentro de um diretório*. Quando terminarmos todo o processo de criação, montamos o cartão de memória no PC e apagamos tudo dele menos o diretório/partição. Movemos o conteúdo do diretório/partição para a raíz do cartão. Com isso, substituimos o sistema Raspbian pelo nosso e podemos fazer o boot normalmente.  

> Aqui eu seguirei a **opção 2**, e criarei **um diretório** para fazer todo processo dentro dele.


