# Capítulo 5. Construindo um Sistema Temporário

No tutorial PILFS está escrito:

> Also, here is where you might want to start a **tmux** or **screen** session. Because if you break your ssh connection or your router has a hickup, your build will just stop.

Entendi que por causa da demora do processo de compilação dos pacotes, o sistema simplesmente pode parar por alguns motivos, então sugere usar o **tmux** ou o **screen** para evitar que isso ocorra. O tmux (multiplexador de terminais) parece ser mais simples de usar, então vou usá-lo!

Depois de cada compilação e instalação apagarei as pastas do fonte descompactados e dos binários para manter espaço livre para os outros processos.  

O projeto PILFS oferece dois *scripts* (**ch5-build.sh** e **ch6-build.sh**) prontos para o trabalho de compiliação para os capítulos 5 e 6, mas não vou usá-los do jeito que estão. 

Para o capítulo 5 vou fazer manualmente os comandos sugeridos no script (**ch5-build.sh**) e ficar comparando com os mesmos comandos descritos no projeto **LFS**. Assim que sentir segurança, modificarei o script para que automatize os comandos que faltam.