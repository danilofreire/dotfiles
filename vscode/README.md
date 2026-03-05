# VS Code

Configuration for [VS Code Insiders](https://code.visualstudio.com/insiders/).

## Files

- `settings.json` - editor settings (theme, font, extensions config)
- `vscode-extensions.txt` - list of installed extensions

## Install

Copy settings:

```bash
cp settings.json ~/Library/Application\ Support/Code\ -\ Insiders/User/
```

Install all extensions:

```bash
cat vscode-extensions.txt | xargs -L 1 code-insiders --install-extension
```
