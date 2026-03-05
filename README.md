# Dotfiles

Configuration files for my development environment. I use [Neovim](https://neovim.io/) and [VS Code](https://code.visualstudio.com/) as text editors, [Zsh](https://www.zsh.org/) as my shell, and [iTerm2](https://iterm2.com/) as my terminal.

## Repository structure

```
dotfiles/
├── gemini/              # Gemini MCP settings
├── iterm2-themes/       # iTerm2 colour schemes
├── latex/               # LaTeX configuration (.latexmkrc)
├── nano/                # Nano editor configuration
├── neovim/              # Neovim/Vim configuration and plugins
├── roo-code/            # Roo Code MCP settings and custom modes
├── vscode/              # VS Code settings and extensions list
└── zsh/                 # Zsh configuration and cheatsheet
```

## Neovim

The `neovim/` folder contains `.vimrc`, `init.vim`, `coc-settings.json`, a command reference (`useful-commands.md`), and a screenshot. These files work with both Neovim and regular [Vim](http://www.vim.org).

### Setup

Install Neovim with [Homebrew](https://brew.sh/):

```bash
brew install neovim
```

I also recommend installing iTerm2, Zsh, and [Oh My Zsh](https://ohmyz.sh/):

```bash
brew install --cask iterm2
brew install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Download [vim-plug](https://github.com/junegunn/vim-plug):

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Copy the configuration files to your home folder and create a symlink for Neovim:

```bash
git clone https://github.com/danilofreire/dotfiles
cp dotfiles/neovim/.vimrc ~/
cp dotfiles/neovim/init.vim ~/.config/nvim/init.vim
```

Then open Neovim and install plugins:

```bash
nvim .vimrc +PlugInstall +qall
```

For nice icons in [lightline](https://github.com/itchyny/lightline.vim) and [vim-devicons](https://github.com/ryanoasis/vim-devicons), install [Fira Code Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode):

```bash
brew install --cask font-fira-code-nerd-font
```

![Neovim screenshot](https://github.com/danilofreire/dotfiles/raw/master/neovim/neovim.png)

## iTerm2 themes

The `iterm2-themes/` folder includes Gruvbox, Nord, Pale Night Hc, Monokai Pro, Monokai Pro Octagon, and Monokai Pro Ristretto. To install a theme, run `open <filename>.itermcolors` and select it in iTerm2 under **Settings > Profiles > Colors > Color Presets**. Many more themes are available at <https://iterm2colorschemes.com>.

## VS Code

The `vscode/` folder contains my `settings.json` and a list of installed extensions. To install all extensions at once:

```bash
cat vscode/vscode-extensions.txt | xargs -L 1 code --install-extension
```

## Zsh

The `zsh/` folder contains my `.zshrc` with aliases, plugins, and shell options. It also includes a Git/Oh My Zsh cheatsheet. I use [Starship](https://starship.rs/) as my prompt and [autojump](https://github.com/wting/autojump) for quick directory navigation.
