# Capítulo 7. Configurando os scripts de inicialização do sistema

Antes de iniciar o capítulo 7 fiz alguns procedimentos:

#### Limpeza dos arquivos desnecessários.

Bem, finalmente terminou a compilação dos pacotes do capítulo 6 (foram aproximadamente 36 horas de espera). Agora criei um novo **script chroot** (lfs3.sh) com o novo modo de se logar no sistema lfs (sugerido pelo projeto LFS).

Desloguei do sistema *lfs* (ainda estava logado depois da compilação do cap6)

```
logout

```

entrei pelo o novo script

```
./lfs3

```

criei uma senha para o usuário root

```
passwd root

```

apaguei a pasta tools (o backup já tinha sido feito - **pilfs_backup_toolchain.md**).

```
rm -rf /tools

```

#### Backup do sistema lfs (pasta /lfs)

Para fazer o backup da pasta lfs veja o arquivo **pilfs_backup_lfs.md** para maiores detalhes.

