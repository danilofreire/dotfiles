# Neovim

Configuration for [Neovim](https://neovim.io/) (also works with regular Vim).

## Files

- `.vimrc` - main configuration (plugins, keybindings, settings)
- `init.vim` - Neovim init file that sources `.vimrc`
- `coc-settings.json` - [coc.nvim](https://github.com/neoclide/coc.nvim) language server settings
- `useful-commands.md` - command reference and cheatsheet
- `neovim.png` - screenshot

## Install

```bash
cp .vimrc ~/
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/
mkdir -p ~/.config/nvim
cp coc-settings.json ~/.config/nvim/
```

Then install plugins:

```bash
nvim +PlugInstall +qall
```
