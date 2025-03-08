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
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# VS Code Insiders
alias code='code-insiders'

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
alias nar='nvim article.Rmd references.bib'
alias narticle='nvim article.Rmd references.bib'
alias nn='nvim article.Rmd references.bib'
alias v='nvim'

# ollama
alias deepseek='ollama run michaelneale/deepseek-r1-goose:latest'
alias ds='ollama run michaelneale/deepseek-r1-goose:latest'
alias llm='ollama run michaelneale/deepseek-r1-goose:latest'
alias r1='ollama run michaelneale/deepseek-r1-goose:latest'
alias stop='ollama stop michaelneale/deepseek-r1-goose:latest'
alias stopr1='ollama stop michaelneale/deepseek-r1-goose:latest'

# python3
alias python=/opt/miniconda3/bin/python3
alias python3=/opt/miniconda3/bin/python3
alias p3=/opt/miniconda3/bin/python3
alias p=/opt/miniconda3/bin/python3

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
alias qp='gh repo clone danilofreire/quarto-presentation && mv quarto-presentation/* ./ && rm -rf .git quarto-presentation figures && rm screenshot.png README.md *.html && mkdir figures'
alias qpresentation='gh repo clone danilofreire/quarto-presentation && mv quarto-presentation/* ./ && rm -rf .git quarto-presentation figures && rm screenshot.png README.md *.html && mkdir figures'
alias ql='quarto render lectures.qmd && gaa && git add docs -f && gcmsg "add lecture" && gp && git switch main'
export QUARTO_PYTHON=/opt/miniconda3/bin/python3

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
alias vim="stty stop '' -ixoff ;;" then
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

. "$HOME/.local/bin/env"

# CBT therapist alias
alias cbt='~/Documents/github/cbt/chat_session.sh'
