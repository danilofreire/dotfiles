# Install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Then also install a few plugins:
# brew cask install font-fira-code
# brew cask install font-firacode-nerd-font
# brew install autojump
# brew install fzf
# brew install gh
# brew install googler
# brew install lazygit
# brew install pyenv
# brew install ripgrep
# brew install thefuck
# brew tap homebrew/cask-fonts
# https://github.com/morhetz/gruvbox-contrib

# autojump
[[ -s /Users/politicaltheory/.autojump/etc/profile.d/autojump.sh ]] && source /Users/politicaltheory/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# fzf
alias nfzf='nvim $(fzf)'
alias ofzf='open $(fzf)'
export FZF_BASE=/usr/local/bin/fzf
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore --files'

# git
alias gar='git add article.Rmd references.bib'
alias gcane='git commit --amend --no-edit'
alias gwip='git add . && git commit -m "WIP" && git push'

# git-ignore
alias gig='gi latex,linux,macos,python,r,vim,windows >> .gitignore'
alias gignore='gi latex,linux,macos,python,r,vim,windows >> .gitignore'

# gh cli
alias ghclone='gh repo clone'
alias ghmd='gh repo clone danilofreire/rmarkdown-templates'
alias ghupdate='brew update && brew upgrade gh'
alias ghweb='gh repo view --web'
alias ghart='gh repo clone danilofreire/rmarkdown-templates && cd rmarkdown-templates/article && nvim article.Rmd references.bib'

# Miniconda
# /Users/USERNAME/Documents/miniconda3/bin/conda init zsh
# export PATH="/Users/USERNAME/miniconda3/bin:$PATH"  
# commented out by conda initialize

# lazygit
# alias lg='lazygit'

# neovim
alias n='nvim'
alias nar='nvim article.Rmd references.bib'
alias nn='nvim article.Rmd references.bib'
alias v='nvim'
alias vim='nvim'

# python3
alias python=/usr/local/bin/python3
alias python3=/usr/local/bin/python3
alias p=/usr/local/bin/python3

# radian
alias r='radian'

# remove images 
alias rmdp='rm ~/Desktop/*.png'
alias rmdj='rm ~/Desktop/*.jpg'
alias rmp='rm *.png'
alias rmj='rm *.jpg'

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
export ZSH="/Users/politicaltheory/.oh-my-zsh"

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
  autojump
  brew
  catimg
  command-not-found
  copyfile
  dircycle
  docker
  docker-compose
  docker-machine
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
  zsh-interactive-cd
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
eval $(/usr/local/bin/python3 /usr/local/bin/thefuck --alias)

# Googler aliases

# A

# AliExpress
alias @ae='googler -w aliexpress.com'
alias @ali='googler -w aliexpress.com'
# Amazon.com
alias @a='googler -w amazon.com'
alias @amazon='googler -w amazon.com'
alias @abr='googler -w amazon.com.br'
# AlternativeTo
alias @alt='googler -w alternativeto.net'
# Android Developers
alias @android='googler -w developer.android.com'
# ARM Information Center
alias @arm='googler -w infocenter.arm.com'
# asciinema
alias @asciinema='googler -w asciinema.org'
# Ask Ubuntu
alias @askubuntu='googler -w askubuntu.com'
# Arch Forums
alias @abbs='googler -w bbs.archlinux.org'
# Arch User Repository
alias @aur='googler -w aur.archlinux.org'
# Arch Wiki
alias @aw='googler -w wiki.archlinux.org'
# AZLyrics
alias @azl='googler -w azlyrics.com'

# B

# BBC
alias @bbc='googler -w bbc.co.uk'
# Encyclopaedia Britannica
alias @britannica='googler -w britannica.com'

# C

# crunchbase
alias @cb='googler -w crunchbase.com'
# Chrome Extensions
alias @chrome='googler -w chrome.google.com'
# craigslist
alias @cl='googler -w craigslist.org'
# commandlinefu
alias @cmd='googler -w commandlinefu.com'
# CNN
alias @cnn='googler -w cnn.com'
# Comedy Central
alias @comedy='googler -w cc.com'
# CPP Reference
alias @cpp='googler -w en.cppreference.com'
# Cracked.com
alias @cracked='googler -w cracked.com'
# Cricinfo
alias @cricinfo='googler -w espncricinfo.com'

# D

# The Free Dictionary
alias @d='googler -w thefreedictionary.com'
# Dictionary.com
alias @di='googler -w dictionary.com'
# DistroWatch
alias @distrowatch='googler -w distrowatch.com'
# Daily Natural Remedies
alias @dnr='googler -w dailynaturalremedies.com'
# Debian Package Search
alias @dpkg='googler -w packages.debian.org'

# E

# eBay
alias @e='googler -w ebay.com'
# Episode Guides
alias @eg='googler -w epguides.com'
# Embedded
alias @embedded='googler -w embedded.com'
# ESPN
alias @espn='googler -w espn.com'
# Etsy
alias @etsy='googler -w etsy.com'
# Online Etymology Dictionary
alias @etym='googler -w etymonline.com'

# F

# Facebook
alias @fb='googler -w facebook.com'
# Fandango Movie Reviews
alias @fd='googler -w fandango.com'
# Firefox Add-ons
alias @firefox='googler -w addons.mozilla.org'
# Forbes
alias @forbes='googler -w forbes.com'
# Forvo
alias @forvo='googler -w forvo.com'
# Financial Times
alias @ft='googler -w markets.ft.com'

# G

# Google Scholar
alias @gs='googler -w scholar.google.com'
alias @scholar='googler -w scholar.google.com'
# Google Search
alias @g='googler'
# Genius Lyrics
alias @genius='googler -w genius.com'
# GitHub
alias @gh='googler -w github.com'
# GNU
alias @gnu='googler -w gnu.org'
# The GNU Privacy Guard
alias @gpg='googler -w gnupg.org'
# Project Gutenberg
alias @gutenberg='googler -w gutenberg.org'

# H

# Hackaday
alias @had='googler -w hackaday.com'
# Healthline
alias @hl='googler -w healthline.com'
# History
alias @history='googler -w history.com'
# Hacker News
alias @hn='googler -w news.ycombinator.com'
# HowStuffWorks
alias @hsw='googler -w howstuffworks.com'
# HowtoForge
alias @htf='googler -w howtoforge.com'
# Hulu
alias @hulu='googler -w hulu.com'

# I

# IEEE
alias @ieee='googler -w ieee.org'
# IETF
alias @ietf='googler -w ietf.org'
# IETF Datatracker
alias @ietfd='googler -w datatracker.ietf.org'
# Instagram
alias @ig='googler -w instagram.com'
# IMDB
alias @imdb='googler -w imdb.com'
# Internet Radio
alias @iradio='googler -w internet-radio.com'

# J

# K

# The Linux Kernel Archives
alias @kernel='googler -w kernel.org'
# Khan Academy
alias @khan='googler -w khanacademy.org'

# L

# Last.fm
alias @lfm='googler -w last.fm'
# LinkedIn
alias @li='googler -w linkedin.com'
# Linux.com
alias @linux='googler -w linux.com'
# Linux Journal
alias @lj='googler -w linuxjournal.com'
# LinuxQuestions
alias @lq='googler -w linuxquestions.org'
# LQWiki
alias @lqw='googler -w wiki.linuxquestions.org'
# LWN.net
alias @lwn='googler -w lwn.net'
# Linux Cross Reference
alias @lxr='googler -w lxr.free-electrons.com'

# M

# Ubuntu Manpage
alias @man='googler -w manpages.ubuntu.com'
# Linux manual page
alias @man7='googler -w man7.org'
# Manga Reader
alias @mangar='googler -w mangareader.net'
# MLB
alias @mlb='googler -w mlb.mlb.com'
# Mac Rumors
alias @mr='googler -w macrumors.com'

# N

# Google News
alias @n='googler -N'
# Nature Research
alias @nature='googler -N nature.com'
# NBA
alias @nba='googler -N nba.com'
# National Geographic
alias @ng='googler -N nationalgeographic.com'
# National Programme on Technology Enhanced Learning
alias @nptel='googler -w nptel.ac.in'

# O

# MIT OpenCourseWare
alias @ocw='googler -w ocw.mit.edu'
# Open Embedded
alias @oembedded='googler -w openembedded.org'
# OpenSubtitles
alias @op='googler -w opensubtitles.org'
# Opensource.com
alias @opensource='googler -w opensource.com'
# Open Source Alternative
alias @osalt='googler -w osalt.com'
# OSDev Wiki
alias @osdev='googler -w wiki.osdev.org'
# OpenWrt
alias @owrt='googler -w openwrt.org'
# Oxford Dictionary
alias @ox='googler -w en.oxforddictionaries.com'

# P

# Google Patents
alias @patent='googler -w patents.google.com'
# The Pirate Bay
alias @pirate='googler -w thepiratebay.org'
# Android Apps
alias @play='googler -w play.google.com'
# PlayOnLinux
alias @playonlinux='googler -w playonlinux.com'
# Python documentation
alias @python='googler -w docs.python.org'

# Q

# Wikiquote
alias @quotes='googler -w en.wikiquote.org'

# R

# Reddit
alias @r='googler -w reddit.com'
# Reader's Digest
alias @rd='googler -w rd.com'
# RFC Reader
alias @rfc='googler -w rfc-editor.org'
# Rpmfind
alias @rpm='googler -w rpmfind.net'
# Rotten Tomatoes
alias @rt='googler -w rottentomatoes.com'

# S

# OnlineSlangDictionary
alias @slang='googler -w onlineslangdictionary.com'
# Stack Overflow
alias @so='googler -w stackoverflow.com'
# Softpedia
alias @softpedia='googler -w softpedia.com'
# SurceForge
alias @sourceforge='googler -w sourceforge.net'
# Subscene
alias @ss='googler -w subscene.com'
# Steam
alias @st='googler -w store.steampowered.com'

# T

# Thesaurus.com
alias @t='googler -w thesaurus.com'
# TED Talks
alias @ted='googler -w ted.com'
# The Linux Documentation Project
alias @tldp='googler -w tldp.org'
# tl;drLegal
alias @tldrlegal='googler -w tldrlegal.com'
# Torrentz2
alias @to='googler -w torrentz2.eu'
# The Pirate Bay
alias @tpb='googler -w thepiratebay.org'
# TuneIn
alias @tunein='googler -w tunein.com'
# Twitter
alias @tw='googler -w twitter.com'
# Twitch
alias @twitch='googler -w twitch.tv'

# U

# Ubuntu Forums
alias @ubuntuforums='googler -w ubuntuforums.org'
# Ubuntu Packages
alias @ubuntupackages='googler -w packages.ubuntu.com'
# Ubuntu Wiki
alias @uwiki='googler -w wiki.ubuntu.com'

# V

# Vim Wiki
alias @vim='googler -w vim.org'

# W

# Wikipedia
alias @w='googler -w en.wikipedia.org'
# Walmart
alias @walmart='googler -w walmart.com'
# Weather.com
alias @weather='googler -w weather.com'
# Wikia
alias @wikia='googler -w wikia.com'

# X

# XKCD
alias @xkcd='googler -w xkcd.com'

# Y

# Yahoo
alias @y='googler -w yahoo.com'
# Yahoo Finance
alias @yf='googler -w finance.yahoo.com'
# YouTube
alias @yt='googler -w youtube.com'
alias @youtube='googler -w youtube.com'

# Z

# ZDNet
alias @zdnet='googler -w zdnet.com'

