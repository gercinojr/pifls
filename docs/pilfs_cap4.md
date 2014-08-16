# Capítulo 4. Preparações Finais

Este capítulo é muito tranquilo e informativo! Muitas coisas novas :-) 

Acho estranho o usuário **lfs** ser dono da pasta **sources** mas seu conteúdo pertencer a outro usuário (root).

>**Diferença entre .bashrc e .bash_profile**:  
`~/.bashrc` é executado toda vez que um shell é inicializado MAS sem login. É o caso de toda vez que estamos em um ambiente gráfico e abrimos um console.  
`~/.bash_profile` é executado toda vez que fazemos login para acessar um shell.

Outra mudança, por causa do PILFS, e a declaração da seguinte linha no arquivo `.bashrc`:

```

LFS_TGT=$(uname -m)-lfs-linux-gnu

``` 
passou para:

```

LFS_TGT=$(uname -m)-lfs-linux-gnueabihf

``` 
Pesquisei sobre essa diferença, mas só encontrei mais dúvidas. Vou deixar para entender essa mudança mais tarde. 

