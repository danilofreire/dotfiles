# Install Homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
# Install a few plugins:
# brew tap ryanoasis/nerd-fonts
# brew install --cask font-fira-code-nerd-font
# Select Fira Code Nerd Font in Iterm2 (Settings, Profile, Text)
# brew install autojump
# brew install fzf
# brew install gh
# brew install --cask iterm2
# brew install pyenv
# brew install --cask quarto
# brew install r
# brew install ripgrep
# brew install thefuck
# brew install tldr
# brew install zsh-autosuggestions
# brew install zsh-completions
# conda install -c conda-forge radian
# Go to https://github.com/morhetz/gruvbox-contrib/blob/master/iterm2/gruvbox-dark.itermcolors
# Download the file, then load it on Settings, Profiles, Color, Colour Presents in iTerm2
# Extensions for gh:
# gh extension install github/gh-copilot
# gh extension install gennaro-tedesco/gh-s
# gh extension install korosuke613/gh-user-stars

# Make zsh handle spaces in filenames better
setopt AUTO_CD              # If a command is not recognized, and is a directory, cd to it
setopt GLOB_COMPLETE        # Show autocompletion menu with globs
setopt MAGIC_EQUAL_SUBST    # Perform filename expansion on the right side of '=' in assignments
setopt NO_CASE_GLOB         # Case insensitive globbing
setopt NUMERIC_GLOB_SORT    # Sort globs numerically
setopt RC_EXPAND_PARAM      # Expand arrays in parameters
setopt EXTENDED_GLOB        # Use extended globbing syntax
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shells

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""  # Using Starship for prompt
plugins=(aliases autojump brew common-aliases conda docker gh git gitignore iterm2 macos pip python vi-mode web-search)
source "$ZSH/oh-my-zsh.sh"

# Auto-quote special characters in URLs or filenames with spaces
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# Vim-like keybindings
bindkey -v

# fzf
alias nfzf='nvim $(fzf)'
alias ofzf='open $(fzf)'
export FZF_BASE=/usr/local/bin/fzf
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore --files'

# git
alias gaa='git add .'
alias gar='git add article.qmd references.bib'
alias gcane='git commit --amend --no-edit'
alias gcmsg='git commit -am'
alias ggp='git add . && git commit -m "add lectures" && gp && git switch main'
alias gl='git log'
alias gorigin='git push -u origin main'
alias gp='git push'
alias gpf='git push -f'
alias gpl='git pull'
alias gs='git status'
alias gup='git push --set-upstream origin main'
alias gwip='git add . && git commit -m "WIP" && git push'

# git-ignore
alias gig='gi latex,linux,macos,python,r,vim,windows >> .gitignore'

# gh cli
alias ghclone='gh repo clone'
alias ghquarto='gh repo clone danilofreire/quarto-templates && cd quarto-templates'
alias ghqa='gh repo clone danilofreire/quarto-templates . && rm -rf letter cv syllabus title-page .git && rm article-screenshot.png .gitignore README.md _config.yaml && nvim article.qmd references.bib'
alias ghupdate='brew update && brew upgrade gh'
alias ghweb='gh repo view --web'

# jupyterlite
# the command below builds a jupyterlite site for pages hosted on GitHub
# it is useful for my data science courses
# run the command from the root folder in the repository
# it builds the website in the docs/ folder of the gh-pages branch
# the example jupyter folder is also in the root folder
alias gjl='mkdir -p docs/jupyter && cp -r jupyter/* docs/jupyter && cd docs/jupyter && pip install -r requirements.txt && jupyter lite build && mv _output/* ./ && git add ./ -f && git commit -m "update JupyterLite" && git push'

# lazygit
alias lg='lazygit'

# neovim
alias n='nvim'
alias nn='nvim article.qmd references.bib'

# claude
alias c='claude'
alias c45='claude --model claude-opus-4-5-20251101 --dangerously-skip-permissions'
alias csp='clear && claude --dangerously-skip-permissions'
alias tw='tmux-work'

# quarto
alias qa='gh repo clone danilofreire/quarto-templates && mv quarto-templates/article/* ./ && rm -rf quarto-templates && code article.qmd references.bib'
alias qah='quarto render article.qmd --to html'
alias qapdf='quarto render article.qmd --to pdf'
alias qappendix='gh repo clone danilofreire/quarto-templates && mv quarto-templates/article/* ./ && rm -rf quarto-templates && rm article.pdf && mv article.qmd appendix.qmd && code appendix.qmd references.bib'
alias qarticle='gh repo clone danilofreire/quarto-templates && mv quarto-templates/article/* ./ && rm -rf quarto-templates && code article.qmd references.bib'
alias qclone='gh repo clone danilofreire/quarto-templates && cd quarto-templates/'
alias ql='quarto render lectures.qmd && gaa && git add docs -f && gcmsg "add lecture" && gp && git switch main'
alias qletter='gh repo clone danilofreire/quarto-templates && mv quarto-templates/letter/* ./ && rm -rf quarto-templates && code letter.qmd'
alias qlh='quarto render letter.qmd --to html'
alias qlp='quarto render letter.qmd --to pdf'
alias qmetropolis='gh repo clone danilofreire/metropolis-beamer && mv metropolis-beamer/* ./ && git remote remove origin && rm -rf testing.sh README.md .gitignore LICENSE.md .git && code template.qmd references.bib'
alias qp='gh repo clone danilofreire/quarto-presentation && mv quarto-presentation/* ./ && rm -rf .git quarto-presentation figures && rm -rf ./_extensions/coatless-quarto/ ./_extensions/quarto-ext/ ./_extensions/r-wasm/ ./_extensions/martinomagnifico/ screenshot.png README.md *.html references.bib && mkdir figures'
alias qpresentation='gh repo clone danilofreire/quarto-presentation && mv quarto-presentation/* ./ && rm -rf .git quarto-presentation figures && rm screenshot.png README.md *.html && mkdir figures'
alias qr='quarto render'
alias qclean='find . -name "*.quarto_ipynb*" -delete && echo "Cleaned .quarto_ipynb files"'
export QUARTO_PYTHON=/opt/miniconda3/bin/python3

# radian
alias r='radian'

# remove images
alias rmpng='rm ~/Desktop/*.png'
alias rmj='rm ~/Desktop/*.jp*g'

# Starship
eval "$(starship init zsh)"

# Web-UI
alias webui='cd /Users/dafreir/Documents/github/web-ui && ./.venv/bin/python webui.py --ip 127.0.0.1 --port 7788'

# code-insiders
alias code='code-insiders'

# Lazy-load conda (deferred until first use for faster startup)
conda() {
  unfunction conda
  __conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
      . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
      export PATH="/opt/miniconda3/bin:$PATH"
    fi
  fi
  unset __conda_setup
  conda "$@"
}

# Tool paths
path=(
  $HOME/.local/bin
  $HOME/.opencode/bin
  $HOME/.lmstudio/bin
  $path
)
typeset -U path

# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
