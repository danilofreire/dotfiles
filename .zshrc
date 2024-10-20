# Install Homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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
# auto-complete
# source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# autojump
[[ -s /Users/dafreir/.autojump/etc/profile.d/autojump.sh ]] && source /Users/dafreir/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# fzf
alias nfzf='nvim $(fzf)'
alias ofzf='open $(fzf)'
export FZF_BASE=/usr/local/bin/fzf
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore --files'

# git
alias gaa='git add .'
alias gar='git add article.qmd references.bib'
alias gcane='git commit --amend --no-edit'
alias gcmsg='git commit -am'
alias gorigin='git remote add origin main && git push -u origin main'
alias gp='git push'
alias gpf='git -f push'
alias gpl='git pull'
alias gs='git status'
alias gst='git status'
alias gup='git push --set-upstream origin main'
alias gwip='git add . && git commit -m "WIP" && git push'

# git-ignore
alias gig='gi latex,linux,macos,python,r,vim,windows >> .gitignore'
alias gignore='gi latex,linux,macos,python,r,vim,windows >> .gitignore'

# gh cli
alias ghclone='gh repo clone'
alias ghmd='gh repo clone danilofreire/quarto-templates && cd quarto-templates'
alias ghqa='gh repo clone danilofreire/quarto-templates . && rm -rf letter cv syllabus title-page .git && rm article-screenshot.png .gitignore README.md _config.yaml && nvim article.qmd references.bib'
alias ghquarto='gh repo clone danilofreire/quarto-templates && cd quarto-templates'
alias ghupdate='brew update && brew upgrade gh'
alias ghweb='gh repo view --web'

# lazygit
alias lg='lazygit'

# neovim
alias n='nvim'
alias nar='nvim article.Rmd references.bib'
alias narticle='nvim article.Rmd references.bib'
alias nn='nvim article.Rmd references.bib'
alias v='nvim'

# python3
alias python=/opt/miniconda3/bin/python
alias python3=/opt/miniconda3/bin/python
alias p3=/opt/miniconda3/bin/python
alias p=/opt/miniconda3/bin/python

# quarto
alias qa='gh repo clone danilofreire/quarto-templates && mv quarto-templates/article/* ./ && rm -rf quarto-templates && code article.qmd references.bib'
alias qah='quarto render article.qmd --to html'
alias qap='quarto render article.qmd --to pdf'
alias qapdf='quarto render article.qmd --to pdf'
alias qappendix='gh repo clone danilofreire/quarto-templates && mv quarto-templates/article/* ./ && rm -rf quarto-templates && rm article.pdf && mv article.qmd appendix.qmd && code appendix.qmd references.bib'
alias qarticle='gh repo clone danilofreire/quarto-templates && mv quarto-templates/article/* ./ && rm -rf quarto-templates && code article.qmd references.bib'
alias qclone='gh repo clone danilofreire/quarto-templates && cd quarto-templates/'
alias qletter='gh repo clone danilofreire/quarto-templates && mv quarto-templates/letter/* ./ && rm -rf quarto-templates && code letter.qmd'
alias qlh='quarto render letter.qmd --to html'
alias qlp='quarto render letter.qmd --to pdf'
alias qmd='gh repo clone danilofreire/quarto-templates && cd quarto-templates/'
alias qmetropolis='gh repo clone danilofreire/metropolis-beamer && mv metropolis-beamer/* ./ && git remote remove origin && rm -rf testing.sh README.md .gitignore LICENSE.md && .git && code template.qmd references.bib'
alias qp='gh repo clone danilofreire/quarto-presentation && mv quarto-presentation/* ./ && rm -rf screenshot.png README.md *.html .gitignore .git'
alias qpresentation='gh repo clone danilofreire/quarto-presentation && mv quarto-presentation/* ./ && rm -rf screenshot.png README.md *.html .gitignore .git'
export QUARTO_PYTHON=/opt/miniconda3/bin/python

# radian
alias r='radian'

# remove images 
alias rdpng='rm ~/Desktop/*.png'
alias rmdj='rm ~/Desktop/*.jpg'
alias rmdp='rm ~/Desktop/*.png'
alias rmj='rm ~/Desktop/*.jpg'
alias rmp='rm ~/Desktop/*.png'
alias rmpng='rm ~/Desktop/*.png'

# save files
alias vim="stty stop '' -ixoff ; vim"

# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f

##########################
### Script begins here ###
##########################
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/dafreir/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Set fzf installation directory path
# export FZF_BASE=/path/to/fzf/install/dir

# Uncomment to set the FZF_DEFAULT_COMMAND
# export FZF_DEFAULT_COMMAND='<your fzf default commmand>'

# Uncomment the following line to disable fuzzy completion
# DISABLE_FZF_AUTO_COMPLETION="true"

# Uncomment the following line to disable key bindings (CTRL-T, CTRL-R, ALT-C)
# DISABLE_FZF_KEY_BINDINGS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  aliases
  autojump
  brew
  catimg
  command-not-found
  copyfile
  dircycle
  docker
  docker-compose
  fzf 
  git
  gitfast
  gitignore
  gh
  macos
  thefuck
  themes
  ubuntu
  vi-mode
  virtualenv
  web-search
  z
  zsh-interactive-cd
)

# Search engines
ZSH_WEB_SEARCH_ENGINES=(
  reddit "https://www.reddit.com/search/?q="
  perplexity "https://www.perplexity.ai/search?q="
  pp "https://www.perplexity.ai/search?q="
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Starship
eval "$(starship init zsh)"

# fuck
# eval $(/opt/homebrew/bin/python3.11 /usr/local/bin/thefuck --alias)

# Quarto Python
# export QUARTO_PYTHON=/opt/miniconda3/bin/python

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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
# <<< conda initialize <<<
# End of conda initialization
eval "$(gh copilot alias -- zsh)"
