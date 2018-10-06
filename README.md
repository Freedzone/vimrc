Such vimrc. Much plugins. Wow.

## Installation
Clone this repo into `$HOME/.vim` (`%HOMEPATH%/.vim` for Win) directory.
```sh
git clone https://github.com/Freedzone/vimrc.git
```

###### Unix
Symlink .vimrc
```sh
ln -s ~/.vim/.vimrc ~/.vimrc
```

###### Windows
1. Download [vim-plug][plug] and put in `%HOMEPATH%/.vim/autoload` directory
2. Symlink .vimrc to your 
```powershell
mklink %HOMEPATH%\.vimrc %HOMEPATH%\.vim\.vimrc
```
[plug]: https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

###### All
1. Install `neovim` python package (required for `deoplete` autocomplete plugin):
`python -m pip install neovim`
2. Start Vim. Run `PlugInstall` command. Restart Vim.

## How it looks?
###### Linux (Manjaro)
![Linux demo][pic-nix]

###### Windows 10
![Windows demo][pic-win]

[pic-win]: https://raw.githubusercontent.com/Freedzone/i/master/vimrc/win.png
[pic-nix]: https://raw.githubusercontent.com/Freedzone/i/master/vimrc/linux.png

## How it feels?
**Dogelicious!**

![Dogelicious](https://pbs.twimg.com/profile_images/531075797218377728/Lu7211ud_400x400.jpeg)
