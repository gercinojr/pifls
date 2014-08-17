# Capítulo 8. Tornando o Sistema LFS inicializável

Nesta etapa haverá muitas diferenças entre os projetos LFS e PILFS, pois para começar não existe GRUB para Raspberry Pi (segundo o PILFS). Fiz uma pesquisa rápida e notei que LILO e GRUB são coisas do mundo x86 e não pertencem ao mundo ARM. 

> Lembrei agora que o pacote GRUB não foi compilado/instalado no capítulo 6.

E também no projeto PiLFS existem dois modos: **COM** e **SEM** a partição dedicada para o **lfs**. Este projeto foi baseado no **SEM** - com isso todos os arquivos ficaram dentro de um diretório **/lfs**.


