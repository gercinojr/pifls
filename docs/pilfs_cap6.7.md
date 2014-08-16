# Capítulo 6.7 Compilando os pacotes do sistema LFS

Neste processo de compilação dos pacotes também utilizarei o aplicativo **tmux** como prevenção para alguns tipos de erros (explicações no capítulo anterior).

O projeto PILFS oferece o *script* **ch6-build.sh** para automatizar o trabalho de compiliação dos pacotes do capítulo 6, mas não vou usá-los do jeito que estão. 

Para este capítulo (cap.6) vou fazer algumas modificações no script **ch6-build.sh** para que se adeque melhor a minha realidade (**ch6-build-modificado.sh**).

A saída do script **ch6-build-modificado.sh** está no arquivo **ch6-build-modificado.log**.

> Obs.: No livro do LFS diz que nesta etapa os teste são importantíssimos. Infelizmente não realizei os testes por um único motivo: **O tempo**. O processo de compilação dos pacotes feitos no Raspberry Pi é muito lento, levaria semanas para se concluir esta estapa e infelizmente não disponho desse tempo. 