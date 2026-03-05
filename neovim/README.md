# Neovim

Configuration for [Neovim](https://neovim.io/) (also works with regular Vim).

## Files

- `.vimrc` - main configuration (plugins, keybindings, settings)
- `init.vim` - Neovim init file that sources `.vimrc`
- `coc-settings.json` - [coc.nvim](https://github.com/neoclide/coc.nvim) language server settings
- `useful-commands.md` - command reference and cheatsheet
- `neovim.png` - screenshot

## Full setup from scratch

### 1. Install Homebrew

If you don't have [Homebrew](https://brew.sh/) yet:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After installation, follow the instructions printed in the terminal to add Homebrew to your PATH.

### 2. Install Neovim and dependencies

```bash
brew install neovim node npm
```

Node and npm are needed by [coc.nvim](https://github.com/neoclide/coc.nvim) for language server support. You will also want a Nerd Font for icons in the status bar and file tree:

```bash
brew install --cask font-fira-code-nerd-font
```

Then set "FiraCode Nerd Font" as the font in your terminal (iTerm2: Settings > Profiles > Text > Font).

### 3. Install vim-plug

[vim-plug](https://github.com/junegunn/vim-plug) is the plugin manager used in this configuration:

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### 4. Copy configuration files

From the root of this repository:

```bash
cp neovim/.vimrc ~/
mkdir -p ~/.config/nvim
cp neovim/init.vim ~/.config/nvim/
cp neovim/coc-settings.json ~/.config/nvim/
```

### 5. Install plugins

Open Neovim and install all plugins:

```bash
nvim +PlugInstall +qall
```

### 6. Install tree-sitter parsers

The configuration uses [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting. Install the parsers and their build dependencies:

```bash
brew install tree-sitter tree-sitter-cli
nvim +'TSInstallSync r markdown markdown_inline rnoweb yaml csv' +'q'
```

If you get a "permission denied" error for the parser directory:

```bash
sudo chown -R $(whoami):staff ~/.local/share/nvim/site
```

### 7. Optional tools

These are used by various plugins in the `.vimrc`:

```bash
brew install fzf ripgrep          # fuzzy finder and search (fzf.vim)
brew install r                    # R language (R.nvim)
conda install -c conda-forge radian  # nicer R console
pip install pynvim                # Python support for Neovim
```

For LaTeX support ([vimtex](https://github.com/lervag/vimtex)):

```bash
brew install --cask mactex        # or: brew install --cask basictex
```

## Troubleshooting

- **`E117: Unknown function: job_start`** - You may have the old `jalvesaq/Nvim-R` plugin instead of `R-nvim/R.nvim`. Run `:PlugClean` and then `:PlugInstall` to fix it.
- **`module nvim-treesitter.configs not found`** - The treesitter plugin must use the `master` branch. Run: `cd ~/.vim/plugged/nvim-treesitter && git checkout master`, then restart Neovim.
- **Broken icons** - Make sure your terminal is using a Nerd Font (step 2 above).

## Screenshot

![Neovim screenshot](https://github.com/danilofreire/dotfiles/raw/master/neovim/neovim.png)
