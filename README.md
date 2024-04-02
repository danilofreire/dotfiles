# Dotfiles

This repository contains my configuration files and scripts for my development environment. I use [Neovim](https://neovim.io/) and [VSCode](https://code.visualstudio.com/) as my text editors, [Zsh](https://www.zsh.org/) as my shell, and [Git](https://git-scm.com/) as my version control system. I also use [GitHub Copilot](https://copilot.github.com/) as my AI pair programmer.

## Neovim

Most of the configuration files here are for Neovim, but they work fine with regular [vim](http://www.vim.org) too. You can find a detailed explanation of how to set up Neovim below.

### Neovim set up instructions:

Install the latest version of neovim with [homebrew](https://brew.sh/):
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install neovim
```

I recommend you to install [iterm2](https://www.iterm2.com/), [tmux](https://github.com/tmux/tmux), [zsh](https://www.zsh.org/), and [oh-my-zsh](https://ohmyz.sh/) as well:
```
brew install --cask iterm2
brew install tmux
brew install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Download [vim-plug](https://github.com/junegunn/vim-plug):
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Download this repository and copy the contents to your home folder
```
git clone https://github.com/danilofreire/dotfiles
cd vimrc/
mv .vimrc /Users/username/
```

Create a `~/.config/nvim/init.vim` file with the following content:
```
set runtimepath^=/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```
... or just copy the [`init.vim`](https://raw.githubusercontent.com/danilofreire/dotfiles/master/init.vim) file above.

Open `.vimrc` and type `:PlugInstall`. From the command line:
```
nvim .vimrc +PlugInstall +qall
```

To use the arrow keys in normal mode, delete the following lines in the `.vimrc` file:
```
" Deactivate arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
```

If you want to make your [lightline toolbar](https://github.com/itchyny/lightline.vim) and [vim-devicons](https://github.com/ryanoasis/vim-devicons) look nice, please download [Nerd fonts](https://github.com/ryanoasis/nerd-fonts). I use [Fira Code](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode).
```
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
```

To install the [iTerm2 Gruvbox Theme](https://github.com/herrbischoff/iterm2-gruvbox/tree/master), download the [`gruvbox.itermcolors`](https://raw.githubusercontent.com/herrbischoff/iterm2-gruvbox/master/gruvbox.itermcolors) file and import it in iTerm2.

And this is how the editor looks like with the default configurations:

![](https://github.com/danilofreire/dotfiles/raw/master/neovim.png)

I hope you enjoy using Neovim! :)

