# Beyond Linux From Scratch - Version 7.5

Algumas configurações para tornar o ambiente mais amigável

#### Tornando o Prompt mais amigável

Editei o arquivo **/etc/profile** e ele ficou assim

```
# Begin /etc/profile

export LANG=en_US.UTF-8

# Setup a red prompt for root and a green one for users.
NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
if [[ $EUID == 0 ]] ; then
  PS1="$RED\u [ $NORMAL\w$RED ]# $NORMAL"
else
  PS1="$GREEN\u [ $NORMAL\w$GREEN ]\$ $NORMAL"
fi

# End /etc/profile

```