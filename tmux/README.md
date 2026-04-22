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
# Adding agents
tw add          # Add agent below current pane (horizontal split, default)
tw add h        # Same as above (horizontal split, like vim :split)
tw add v        # Add agent beside current pane (vertical split, like vim :vsplit)
tw add up       # Same as tw add h
tw add down     # Same as tw add h
tw add left     # Same as tw add v
tw add right    # Same as tw add v

# Removing agents
tw rm           # Remove the focused agent pane
tw remove       # Same as above
tw rm h         # Remove the neighbour below (or above)
tw rm v         # Remove the neighbour to the right (or left)
tw rm up        # Remove the pane above
tw rm down      # Remove the pane below
tw rm left      # Remove the pane to the left
tw rm right     # Remove the pane to the right
```

Split directions follow vim conventions: `h` = horizontal line (`:split`, top/bottom), `v` = vertical line (`:vsplit`, side by side).

The `rm` directional commands protect the preview pane and the last remaining agent pane.

### Moving a pane

```bash
tw move left     # Move focused pane to the left edge of the agent area
tw move right    # Move to the right edge
tw move up       # Move to the top
tw move down     # Move to the bottom
```

Useful for reshaping the layout without killing and rebuilding. For instance, with two agents stacked top and bottom, `tw move right` from the bottom pane puts them side by side. With three or four panes, the moved pane attaches adjacent to the edge-most agent rather than spanning the full height or width, which follows from how tmux models splits as a tree.

The command refuses to move the preview pane, and needs at least two agent panes to have somewhere to attach.

### Restart

```bash
tw restart        # Respawn Claude in every agent pane, keeping the layout
tw restart --hard # Kill the session and rebuild from the stored preset
```

`tw restart` uses `tmux respawn-pane -k`, which preserves each pane's ID, title, and size while relaunching Claude inside. It does not ask for confirmation.

`tw restart --hard` reads the preset stored when the session was started (`solo`, `duo`, `focus`, or the default 4-agent layout) and rebuilds from scratch. It asks for confirmation before killing the session.

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
