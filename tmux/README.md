# tmux setup

Configuration for a multi-agent Claude Code workspace using tmux and iTerm2.

## What's in this folder

| File | Purpose | Install location |
|------|---------|------------------|
| `tmux.conf` | tmux settings (mouse, colours, clipboard, pane titles) | `~/.tmux.conf` |
| `tmux-work` | Script to launch and manage multi-agent Claude Code sessions | `~/.local/bin/tmux-work` |

## Prerequisites

```bash
# Install tmux (macOS)
brew install tmux

# Make sure ~/.local/bin exists and is on your PATH
mkdir -p ~/.local/bin
```

Your `~/.zshrc` should include `~/.local/bin` in the path:

```zsh
path=(
  $HOME/.local/bin
  $path
)
typeset -U path
```

And optionally, an alias for convenience:

```zsh
alias tw='tmux-work'
```

## Installation

```bash
# From the dotfiles repo
cp tmux/tmux.conf ~/.tmux.conf
cp tmux/tmux-work ~/.local/bin/tmux-work
chmod +x ~/.local/bin/tmux-work
```

If tmux is already running, reload the config:

```bash
tmux source-file ~/.tmux.conf
```

## Usage

### Starting a session

```bash
tw              # 4 Claude agents + preview pane (default)
tw duo          # 2 agents (stacked) + preview pane
tw solo         # 1 agent + preview pane
tw focus        # 1 agent, full screen (no preview)
```

The default layout looks like this:

```
+----------+----------+--------------+
| Agent 1  | Agent 2  |              |
| (Claude) | (Claude) |   Preview    |
|          |          |   / Neovim   |
+----------+----------+   (shared    |
| Agent 3  | Agent 4  |    shell)    |
| (Claude) | (Claude) |              |
+----------+----------+--------------+
```

Each agent pane launches `claude` automatically. The preview pane on the right stays as a plain shell for viewing files.

### Managing agents

```bash
tw add          # Add another agent (splits the current pane)
tw remove       # Remove the focused agent pane
```

### Preview pane

```bash
tw preview      # Toggle the preview pane on/off
tw open <file>  # Open a file in neovim in the preview pane
```

`tw open` automatically restores the preview pane if it is hidden. It also quits any running neovim instance before opening the new file.

### Session management

```bash
tw attach       # Reattach to an existing session
tw kill         # Kill the session
```

### Keybinding

The tmux config binds `prefix + p` to toggle the preview pane (same as `tw preview`).

## tmux.conf highlights

- **Mouse support**: click between panes, scroll, resize with the mouse
- **Pane titles**: shown on the top border of each pane so you know which agent is which
- **Clipboard**: copy mode sends to the system clipboard via `pbcopy`
- **Low escape delay** (10ms): avoids lag when using neovim inside tmux
- **True colour**: 256-colour and RGB support for terminals that support it
- **Scrollback**: 50,000 lines per pane
