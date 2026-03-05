# Zsh

Configuration for [Zsh](https://www.zsh.org/) with [Oh My Zsh](https://ohmyz.sh/) and [Starship](https://starship.rs/) prompt.

## Files

- `.zshrc` - shell configuration (aliases, plugins, environment variables)
- `git-ohmyzsh-cheatsheet.md` - Git and Oh My Zsh command reference

## Install

```bash
cp .zshrc ~/
source ~/.zshrc
```

## Dependencies

These should be installed first (all available via Homebrew):

```bash
brew install autojump fzf gh ripgrep thefuck tldr zsh-autosuggestions zsh-completions
brew install --cask iterm2
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh
```
