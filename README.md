## INSTALL

Get vim plug to manage the plugins:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

open a doc with vim and run command:

```
:PlugInstall
```

## USEAGE

Search file in vim:
'\'+'f'

Search symbol in vim:
'Ctrl+F' and 'Enter'

Select target with:
'Ctrl+j' and 'Ctrl+k'

and jump to with:
'Enter'

Jump back with:
'Ctrl+o'

## Troubleshot

Debian 9:

```
Error: LeaderF requires vim compiled with +python or +python3
```

Need install vim plugin to fix

```
sudo apt install vim-nox
```

Another options is:

```
sudo apt install vim-gnome-py2
```
