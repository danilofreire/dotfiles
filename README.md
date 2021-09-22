# Neovim Directory

My configuration files and plugins for [Neovim](https://neovim.io/). They work fine with regular [vim](http://www.vim.org) too.

## Set up instructions:

Install the latest version of neovim with [homebrew](https://brew.sh/):
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install neovim
```

I recommend you to install [iterm2](https://www.iterm2.com/) and [tmux](https://github.com/tmux/tmux) too:
```
brew cask install iterm2
brew install tmux
```

Download [vim-plug](https://github.com/junegunn/vim-plug):
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Download this repository and copy the contents to your home folder
```
git clone https://github.com/danilofreire/vimrc
cd vimrc/
mv .vimrc /Users/username/
```

Create a `~/.config/nvim/init.vim` file with the following content:
```
set runtimepath^=/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```
... or just copy the [`init.vim`](https://raw.githubusercontent.com/danilofreire/vimrc/master/init.vim) file above.

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

And this is how the editor looks like with the default configurations:

![](https://github.com/danilofreire/vimrc/raw/master/neovim.png)

I hope you enjoy using Neovim! :)

