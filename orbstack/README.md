# Setting up an Ubuntu development environment on macOS with OrbStack

A complete guide to running Ubuntu alongside macOS for academic data science work, covering OrbStack, Ubuntu, zsh, Neovim, R, Python, Quarto, Claude Code, VS Code Remote-SSH, GitHub, and shared files between macOS and Linux.

Tested on a MacBook Air M5 (Apple Silicon) with macOS, running Ubuntu 24.04 LTS through OrbStack.

---

## Why this setup?

If you do academic or data science work on a Mac and occasionally need a real Linux environment (for reproducibility, server simulation, or just to test that your code runs on Ubuntu the way your students or co-authors will run it), OrbStack is the cleanest way to get there.

Compared to traditional VMs (Parallels, UTM, VirtualBox), OrbStack is dramatically faster, uses far less memory, and integrates well with macOS: your Mac home directory is automatically mounted inside Ubuntu, GUI apps appear as native Mac windows, and ports are forwarded transparently. It also handles Docker if you need it later, all from the same app.

The workflow we'll set up here:

- **Ubuntu** as a lightweight, persistent development machine
- **VS Code on macOS** connected via Remote-SSH, so your editor stays native while your code runs Linux
- **Shared files** between the two sides, so your existing Mac repos just work
- **Optional XFCE desktop** for the rare cases you want a full GUI

---

## 1. Install OrbStack

On macOS, with Homebrew:

```bash
brew install --cask orbstack
```

Or download from [orbstack.dev](https://orbstack.dev). Free for personal use.

Open the app once after installing so it can finish first-run setup.

---

## 2. Create an Ubuntu machine

From your Mac terminal:

```bash
orb create ubuntu mydev
```

This creates an Ubuntu 24.04 LTS machine called `mydev` in a few seconds. List your machines anytime with:

```bash
orb list
```

Drop into a shell:

```bash
orb -m mydev
```

The `-m` flag selects which machine to enter. (A common pitfall is to write `orb shell mydev`: that opens the *default* machine and tries to run a command called `mydev` inside it, giving `bash: mydev: command not found`.)

Or SSH in directly (useful for scripts and VS Code later):

```bash
ssh mydev@orb
```

From this point on, all commands go inside the Ubuntu machine unless I say otherwise.

### Terminal compatibility note

If you use Ghostty, kitty, WezTerm, or another terminal that advertises a custom `TERM` value, Ubuntu won't recognise it the first time you SSH in. The shell falls back to a generic profile and prompt redraws break: doubled keystrokes, garbled output, the cursor jumping around. The fix is to install the terminal's terminfo on the Ubuntu side.

For Ghostty, OrbStack's filesystem mount makes the Ghostty bundle visible inside Ubuntu, so one SSH command does it:

```bash
ssh mydev@orb 'mkdir -p ~/.terminfo/x && \
  cp /Applications/Ghostty.app/Contents/Resources/terminfo/78/xterm-ghostty \
     ~/.terminfo/x/xterm-ghostty'
```

Verify:

```bash
ssh mydev@orb 'infocmp xterm-ghostty | head -1'
```

For other terminals, the same pattern applies: locate the binary terminfo file inside the app bundle and drop it into `~/.terminfo/x/<terminal-name>` on the remote. Some terminals (kitty's `kitten ssh`) bundle a built-in fix.

As a belt-and-braces fallback, add this near the top of Ubuntu's `~/.zshrc` so any unrecognised `TERM` gracefully degrades:

```bash
if [[ -n "$TERM" ]] && ! infocmp "$TERM" >/dev/null 2>&1; then
  export TERM=xterm-256color
fi
```

---

## 3. Update the system and install essentials

```bash
sudo apt update && sudo apt upgrade -y

sudo apt install -y \
    curl wget git build-essential \
    software-properties-common \
    ca-certificates gnupg \
    libssl-dev libffi-dev zlib1g-dev \
    htop tree unzip
```

`build-essential` gives you `gcc`, `make`, and the toolchain needed to compile R packages and Python extensions from source.

---

## 4. Set zsh as the default shell

Ubuntu ships with Bash. If you prefer zsh (and the niceties of Oh My Zsh), set it up now:

```bash
sudo apt install -y zsh
chsh -s $(which zsh)
```

(Some recent OrbStack Ubuntu images already have zsh installed and set as the default for the user. Run `echo $SHELL`, and if you see `/usr/bin/zsh` you can skip this step.)

The `chsh` change writes to `/etc/passwd`, but only login programs read it. Your current bash process keeps running until you exit, so the new shell will only take effect on a fresh login.

To pick it up:

```bash
# Inside Ubuntu, leave the current bash shell:
exit
```

That drops you back to your Mac terminal. Re-enter the machine:

```bash
orb -m mydev    # or: ssh mydev@orb
```

Confirm zsh is now your login shell:

```bash
echo $SHELL     # should print /usr/bin/zsh
```

If you'd rather not leave the machine, you can start a zsh login shell in place of the current bash:

```bash
exec zsh -l
```

`exec` replaces the current process, so `exit` from that zsh will close the whole session, the same as if you had logged in as zsh from the start.

Then install Oh My Zsh:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

A couple of useful plugins:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Edit `~/.zshrc` and update the plugins line:

```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

Then reload:

```bash
source ~/.zshrc
```

### Reusing your Mac `.zshrc` inside Ubuntu

OrbStack mounts your Mac home at `/Users/dafreir/`, so the Mac `.zshrc` is readable from Ubuntu at `/Users/dafreir/.zshrc`. You can have the Ubuntu zsh source it on every start, which keeps your aliases, functions, and prompt config consistent across both sides.

The catch: a real Mac `.zshrc` usually has Homebrew paths (`/opt/homebrew/...`), `/usr/local/bin/...` references, and macOS-only initialisations that don't exist on Linux. Sourcing it blindly will print a few errors. There are two ways to handle that.

**Option A: source it as-is, accept the noise.** Append to Ubuntu's `~/.zshrc`:

```bash
# Reuse the Mac .zshrc when it's readable
if [[ -r /Users/dafreir/.zshrc ]]; then
  source /Users/dafreir/.zshrc
fi
```

Reload and look at the output:

```bash
source ~/.zshrc
```

Any line that fails will print a `no such file or directory` error. Either ignore them or fix them at the source on the Mac side.

**Option B: guard the macOS-only lines on the Mac.** Edit your Mac `~/.zshrc` and wrap platform-specific blocks in an OS check, so the same file works on both systems:

```bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS-only setup
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  export FZF_BASE=/usr/local/bin/fzf
fi
```

`$OSTYPE` is a built-in zsh variable; on Apple Silicon it expands to `darwin24` (or similar) and on Ubuntu to `linux-gnu`. Truly cross-platform pieces (aliases, functions, prompt theme) live outside the guard and run on both.

Once the Mac file is portable, the source line in Ubuntu becomes harmless: zero errors on reload.

A heavier-weight pattern, if you find yourself wanting more separation: split your config into `~/.zshrc.shared` (cross-platform) and `~/.zshrc` (platform-specific bootstrap that sources the shared file). Worth considering once the OS guards in Option B start to multiply.

---

## 5. Install Neovim (latest version)

The version of Neovim in the default Ubuntu repositories is usually behind. Use the official PPA for the current release:

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install -y neovim
```

Verify:

```bash
nvim --version
```

### Bringing your existing `.vimrc` / Neovim config

You have two clean options.

**Option A: symlink from your Mac** (so configs stay in sync):

```bash
mkdir -p ~/.config
ln -s /Users/dafreir/.config/nvim ~/.config/nvim
```

(Adjust the path to wherever your Neovim config lives on macOS, commonly `~/.config/nvim` or `~/.vim`.)

For classic Vim users with a `.vimrc`, Neovim can read it directly:

```bash
mkdir -p ~/.config/nvim
cat > ~/.config/nvim/init.vim << 'EOF'
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source /Users/dafreir/.vimrc
EOF
```

**Option B: copy and version-control separately:**

```bash
cp -r /Users/dafreir/.config/nvim ~/.config/nvim
```

I recommend Option A: one source of truth, edits on either side propagate, and you can keep the whole config under git on the Mac.

---

## 6. Install R

Ubuntu's default R is sometimes outdated, but on recent releases (24.04 noble onwards) it's current enough for most academic work. Check what apt offers first:

```bash
apt-cache policy r-base | head -5
```

If the candidate version is recent (4.4+ in 2026), install from Ubuntu directly and skip the CRAN repo:

```bash
sudo apt install -y r-base r-base-dev
```

If you want the very latest R or your Ubuntu version is too old, add the official CRAN repository:

```bash
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc \
    | sudo gpg --dearmor -o /usr/share/keyrings/r-project.gpg

echo "deb [signed-by=/usr/share/keyrings/r-project.gpg] \
https://cloud.r-project.org/bin/linux/ubuntu noble-cran40/" \
    | sudo tee /etc/apt/sources.list.d/r-project.list

sudo apt update
sudo apt install -y r-base r-base-dev
```

(`noble` is the codename for Ubuntu 24.04. Replace with `jammy` for 22.04. CRAN typically only publishes for LTS releases, so on non-LTS Ubuntu (`questing` 25.10, `plucky` 25.04, etc.) you'll need to fall back to apt's own `r-base`.)

A few common system dependencies that R packages tend to want:

```bash
sudo apt install -y \
    libcurl4-openssl-dev libxml2-dev libfontconfig1-dev \
    libharfbuzz-dev libfribidi-dev libfreetype6-dev \
    libpng-dev libtiff-dev libjpeg-dev
```

For VS Code integration, install `languageserver` from inside R:

```r
install.packages("languageserver")
```

---

## 7. Install Quarto

Quarto's `.deb` releases are on GitHub. On Apple Silicon you want the `arm64` build:

```bash
QUARTO_VERSION="1.9.37"   # check github.com/quarto-dev/quarto-cli/releases
wget https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-arm64.deb
sudo dpkg -i quarto-${QUARTO_VERSION}-linux-arm64.deb
rm quarto-${QUARTO_VERSION}-linux-arm64.deb

quarto check
```

`quarto check` will tell you if anything is missing (LaTeX, Python kernel, etc.).

For PDF output:

```bash
quarto install tinytex
```

---

## 8. Install Python and Jupyter

Ubuntu 24.04 ships with Python 3.12. Add pip and venv:

```bash
sudo apt install -y python3 python3-pip python3-venv python3-tk
```

I recommend a project-level virtual environment rather than installing globally:

```bash
mkdir -p ~/projects/scratch && cd ~/projects/scratch
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install jupyterlab numpy pandas matplotlib seaborn scikit-learn
```

To launch Jupyter Lab and open it in your Mac browser:

```bash
jupyter lab --no-browser --port=8888
```

OrbStack forwards the port automatically. Open `http://localhost:8888` in Safari or Chrome on the Mac.

---

## 9. Install Claude Code

The simplest method now is the native installer (no Node.js dependency). Pipe to `bash`, not `sh`: on Ubuntu, `/bin/sh` is `dash`, which doesn't accept the bash-specific syntax used by the installer.

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

Verify:

```bash
claude --version
```

The installer drops the binary in `~/.local/bin/`. If that's not on your `PATH`, add it:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
```

On first run, you'll be prompted to authenticate.

If you'd rather use npm, install Node.js (≥ 18) via [nvm](https://github.com/nvm-sh/nvm) first, then `npm install -g @anthropic-ai/claude-code`. Avoid `sudo` with global npm installs.

---

## 10. (Optional) Lightweight XFCE desktop

Most of the time you won't need a full desktop. VS Code Remote-SSH and OrbStack's native GUI app forwarding cover almost everything. But if you want a desktop for testing or curiosity:

```bash
sudo apt install -y xfce4 xfce4-goodies tigervnc-standalone-server novnc
```

Set a VNC password and create a startup script:

```bash
vncpasswd

mkdir -p ~/.vnc
cat > ~/.vnc/xstartup << 'EOF'
#!/bin/bash
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
exec startxfce4
EOF
chmod +x ~/.vnc/xstartup
```

Start the VNC server:

```bash
vncserver :1 -geometry 1920x1080 -depth 24
```

Connect from macOS via Finder → Go → Connect to Server:

```
vnc://mydev.orb.local:5901
```

Or use noVNC in a browser:

```bash
websockify --web=/usr/share/novnc/ 6080 localhost:5901 &
```

Then open `http://mydev.orb.local:6080/vnc.html`.

Stop the session with:

```bash
vncserver -kill :1
```

If you decide you don't need it, remove cleanly:

```bash
sudo apt remove --purge xfce4 xfce4-goodies tigervnc-standalone-server novnc -y
sudo apt autoremove --purge -y
```

---

## 11. VS Code with Remote-SSH (recommended workflow)

This is the sweet spot: editor on macOS, code on Ubuntu.

**On macOS:**

1. Install [VS Code](https://code.visualstudio.com/) if you don't have it.
2. Install the **Remote - SSH** extension (Microsoft).

**Connect:**

1. `Cmd+Shift+P` → `Remote-SSH: Connect to Host…`
2. Enter `mydev@orb`.
3. VS Code installs a small server inside Ubuntu the first time and connects.

The bottom-left corner will show a green indicator with the remote name. Open any folder under `/home/dafreir` or `/Users/dafreir` and work as if local.

**Useful extensions to install on the remote:**

- Python + Pylance
- Jupyter
- R (from REditorSupport)
- Quarto
- Claude Code (if you'd like Claude integrated in the editor)

**Why this beats a Linux desktop:**

- Native Mac fonts, scrolling, and keyboard shortcuts
- Files sit on the Linux filesystem, no path translation issues
- Port forwarding is automatic: Jupyter, Quarto preview, R Shiny apps all just work on `localhost`
- No display lag, no VNC artefacts

---

## 12. Sharing files between macOS and Ubuntu

OrbStack mounts your entire macOS home directory inside Ubuntu automatically. From inside the Ubuntu machine:

```bash
ls /Users/dafreir
```

That's your Mac home, live and bidirectional. A symlink keeps things tidy:

```bash
ln -s /Users/dafreir/Documents/github ~/github
```

Now `cd ~/github` works from Ubuntu.

**A few things worth knowing:**

1. **Performance**: file operations on `/Users/...` cross a virtualisation boundary, so they're a bit slower than native Linux paths. You won't notice for editing or running scripts. For heavy `npm install` or large builds with thousands of small files, clone natively into `~/projects` on Ubuntu instead.

2. **Git permissions**: macOS and Linux disagree about file modes occasionally. If git starts complaining about phantom permission changes:

   ```bash
   git config --global core.fileMode false
   ```

3. **Direction of ownership**: it's the *same files*. Edit a `.qmd` from VS Code on Ubuntu, save it, then open it in RStudio on the Mac, and the changes are right there.

---

## 13. GitHub setup

You can either share your Mac SSH keys with Ubuntu or set up new ones.

**Option A: share Mac SSH keys** (convenient):

```bash
ln -s /Users/dafreir/.ssh ~/.ssh
chmod 700 /Users/dafreir/.ssh   # if not already set
```

This works because OrbStack respects the macOS file permissions.

**Option B: generate fresh keys on Ubuntu** (cleaner separation):

```bash
ssh-keygen -t ed25519 -C "danilofreire@ubuntu-orb"
cat ~/.ssh/id_ed25519.pub
```

Copy the output and add it at `https://github.com/settings/keys`.

Test:

```bash
ssh -T git@github.com
```

**GitHub CLI** is also worth installing:

```bash
sudo mkdir -p -m 755 /etc/apt/keyrings
wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt update
sudo apt install -y gh

gh auth login
```

Set up your git identity once:

```bash
git config --global user.name "Danilo Freire"
git config --global user.email "danilofreire@gmail.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
```

---

## 14. Daily workflow tips

A few small things that pay off:

**Quick aliases in `~/.zshrc`:**

```bash
alias ll='ls -lah'
alias gs='git status'
alias gp='git pull'
alias jl='jupyter lab --no-browser --port=8888'
alias work='cd ~/projects'
```

**Open the Ubuntu machine straight from VS Code:** add this to your Mac shell profile (`~/.zshrc`):

```bash
alias vsorb='code --remote ssh-remote+mydev@orb'
```

Then `vsorb ~/projects/myrepo` opens that folder remotely in one command.

**Snapshot a clean machine state:** OrbStack lets you clone machines, so you can keep a "pristine" Ubuntu for experiments:

```bash
orb clone mydev mydev-experiment
```

If the experiment goes wrong, just delete it.

**Stop the machine when not in use** (saves RAM):

```bash
orb stop mydev
```

Restart with `orb start mydev`.

**Update everything periodically:**

```bash
sudo apt update && sudo apt upgrade -y
```

For Claude Code with the native installer, updates happen automatically in the background.

---

## What you have now

A persistent Ubuntu development environment that:

- Boots in seconds
- Shares files transparently with macOS
- Runs R, Python, Quarto, and Neovim natively on Linux
- Connects to VS Code on the Mac as if it were a remote server
- Handles GitHub with shared or separate credentials
- Optionally renders GUI apps as native Mac windows
- Stays out of your way when you don't need it

It's the closest thing I've found to "having Linux as a feature of macOS" rather than as a separate operating system to context-switch into.

---

*Comments and corrections welcome.*
