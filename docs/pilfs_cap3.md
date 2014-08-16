# Capítulo3. Pacotes e Patches

Preparando-se para baixar os pacotes

Baixei dois arquivos primeiro deste link

http://www.linuxfromscratch.org/lfs/downloads/7.5/

* md5sums
* wget-list

> data de acesso: 02/08/2014

O primeiro contém os teste de integridade, por soma md5, e o segundo contém a lista de pacotes que devem ser baixados.

Usei o comando abaixo

```
wget -i wget-list -P $LFS/sources

```

e em aproximadamente 7min baixei todos os 72 arquivos.

Fiz os procedimentos de verificação de integridade (ver livro LFS) e todos os arquivos estavam corretos.

Só então lembrei que estou seguindo o PILFS, e há pacotes diferents por causa da arquitetura ARM.

Então fiz o backup dos arquivos baixados (LFS) anteriormente, limpei a pasta $LFS/sources e refiz o download dos pacotes sugeridos pelo PILFS. 

```
wget http://www.intestinate.com/pilfs/scripts/wget-list
wget -i wget-list -P $LFS/sources

```
e em aproximadamente 9min baixei todos os 89 arquivos.

> Obs.: Infelizmente no arquivo [wget-list](http://www.intestinate.com/pilfs/scripts/wget-list) contém links quebrados. Foi necessário documentar estes links e procurar por alternativas. Nas pasta docs se encontra o arquivo *pilfs-wget-list-corrigida* com minhas alterações.

Dica:   
Para se testar se um recurso está disponível na rede:

```
$ wget -q --spider http://www.endereco.com/recurso
$ echo $?

```

Se a variável de ambiente **$?** for igual a 0 então o recurso está disponível, se for diferente de 0 o link está com problemas. Sabendo-se disso, podemos fazer um script e executá-lo sobre a lista de links. :-)

