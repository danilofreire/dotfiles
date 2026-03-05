# Useful Vim/Neovim commands

A reference of Vim commands I regularly use. Many are custom mappings from my `.vimrc`.

## Navigation

### Moving within a line

* `0` go to beginning of the line
* `^` jump to the first non-blank character of the line
* `$` go to the end of the line
* `fX` jump to the next character X
* `FX` find the previous character X
* `tX` place the cursor just before character X
* `TX` place the cursor just after the previous character X
* `h j k l` move cursor (h: left, j: down, k: up, l: right)

### Moving between lines and the screen

* `gg` go to the first line
* `G` go to last line
* `XXgg` go to line XX (just type the number)
* `H` go to the top of the screen
* `M` go to the middle of the screen
* `L` go to the bottom of the screen
* `gj` go to following displayed line
* `gk` go to previous displayed line
* `{` move to previous paragraph
* `}` move to next paragraph
* `(` move to previous sentence
* `)` move to next sentence
* `%` move to matching bracket (pairs: `()`, `{}`, `[]`)

### Scrolling

* `<Ctrl>f` page down
* `<Ctrl>b` page up
* `<Ctrl>e` move view pane down
* `<Ctrl>y` move view pane up
* `zz` centre current line on screen
* `zt` move current line to the top
* `zb` move current line to the bottom

## Editing

### Inserting text

* `i` insert mode
* `I` insert at beginning of line (`0i`)
* `A` append at end of line (`$a`)
* `o` open new line below, enter insert mode
* `O` open new line above, enter insert mode
* `R` replace mode
* `Esc` return to normal mode

### Changing and deleting

* `r` replace a single character
* `x` delete character under cursor
* `~` switch case
* `C` delete to end of line, enter insert mode (`c$`)
* `D` delete to end of line (`d$`)
* `S` delete line, enter insert mode at indentation
* `J` join line below with one space in between
* `gJ` join line below without space
* `cMOTION` change to end of word (`e`) or any other motion
* `.` repeat last change
* `;` repeat last `f`/`F`/`t`/`T` command

### Copying and pasting

* `y` yank (copy)
* `yy` yank line
* `Y` yank to end of line (custom)
* `yyp` duplicate line
* `p` paste after cursor
* `P` paste before cursor
* `<Ctrl>a` yank all text (custom)
* `<Ctrl>c` copy text (custom)
* `<Ctrl>v` paste text (custom)

### Undo and redo

* `u` undo
* `<Ctrl>r` redo

### Sorting (custom)

* `<Leader>sa` sort lines alphabetically, remove duplicates
* `<Leader>sn` sort numbers
* `<Leader>sr` sort in reverse

### Moving lines (custom, visual mode)

* `K` move selected lines up
* `J` move selected lines down

## Search and replace

* `/pattern` search for pattern
* `?pattern` search backward for pattern
* `/pattern/e+1` move to 1 space after the end of the match
* `n` repeat search forward
* `N` repeat search backward
* `*` search for next occurrence of word under cursor
* `#` search for previous occurrence of word under cursor
* `:%s/old/new/gc` replace all occurrences with confirmation
* `:noh` disable search highlighting
* `<Leader>n` disable search highlighting (custom)

## Visual mode

* `v` visual mode (select text)
* `<Ctrl>n` select text for multicursors editing (normal mode)

## Commenting

* `gcc` comment a line
* `gcMOTION` comment a text selection (e.g. `gcip` for a paragraph)

## Surround (vim-surround)

* `SELECTEDTEXT S'` add quotes (or any symbol) around selected text
* `vi[S"` add `"` around text inside `[]`
* `cs"'` change surrounding `"` to `'`
* `ds"` delete surrounding `"`

## Folding

* `za` open/close fold
* `zR` unfold the whole document
* `zx` refresh folds

## Buffers and tabs

* `<Leader>1` go to buffer 1 (custom, up to 9)
* `<Leader>x` close buffer (custom)
* `<Ctrl><Tab>` go to next buffer (custom)
* `:tabmove 0` move tab to the beginning
* `:tabmove 1` move current tab to second position
* `:tabmove` move tab to the end

## Windows

* `<Ctrl>wv` or `:vs` vertical split
* `<Ctrl>wS` or `:sp` horizontal split
* `<Ctrl>wl` move focus right (`h` left, `j` down, `k` up)
* `<Ctrl>wL` move window right (`H` left, `J` down, `K` up)
* `<Ctrl>w<Ctrl>R` swap windows
* `<Ctrl>wT` send window to a new tab
* `<Ctrl>wXX<` increase width (replace XX with a number)
* `<Ctrl>wXX>` decrease width
* `<Ctrl>wc` or `<Ctrl>wQ` close window

## Files and commands

* `:w` save file
* `<Ctrl>s` save file (custom)
* `:q` quit
* `:q!` quit without saving
* `:qa` quit all windows
* `:e .` open file browser
* `:e` edit file (then enter file path)
* `:h` help
* `:!<COMMAND>` run a terminal command
* `:colors` change colour scheme
* `set COMMAND!` unset a command
* `<F3>` toggle paste mode (custom)
* `<F5>` refresh current tab (custom)
* `<F6>` remove trailing whitespace (custom)

## Plugin-specific commands

### NERDTree (custom)

* `<Leader>nt` toggle NERDTree
* `<Leader>nf` toggle NERDTreeFind

### FZF and navigation (custom)

* `<Leader>F` open FZF
* `<Leader>w` navigate to word
* `<Leader>fXX` jump to the next two characters you type

### Floaterm (custom)

* `<Leader>t` open new terminal
* `<F7>` open new terminal
* `<F8>` open R terminal
* `<F9>` open Python terminal
* `<F10>` next terminal
* `<F11>` toggle terminal
* `<F12>` close terminal
* `<Leader>l` send code to terminal

### Goyo and Limelight (custom)

* `<Leader>go` toggle Goyo (tip: `<Ctrl>w20<` when opening Markdown)
* `<Leader>L` toggle Limelight
* `<Leader>as` toggle AutoSave
* `<Leader>rn` toggle relative line numbers

### Coc-Nvim (custom)

* `<Leader>cc` open `:CocCommand`
* `<Leader>cl` open coc-lists
* `<Leader>cm` open coc-marketplace

### GitHub Copilot

* `<Ctrl-]>` dismiss suggestion
* `<fn-option-]>` next suggestion
* `<fn-option-[>` previous suggestion
* `<fn-option-\>` request suggestion

### Git (custom)

* `<Leader>gs` git status
* `<Leader>ga` git add
* `<Leader>gc` git commit
* `<Leader>gca` git amend
* `<Leader>gcam` git amend --no-edit
* `<Leader>gco` git checkout
* `<Leader>gd` git remove
* `<Leader>gf` git fetch
* `<Leader>gl` git log
* `<Leader>gm` git merge
* `<Leader>gpl` git pull
* `<Leader>gpb` git pull --rebase
* `<Leader>gps` git push
* `<Leader>gb` git blame
* `<Leader>gbr` git branch
* `<Leader>gr` git read
* `<Leader>gv` git diff (vertical split)

### Gist (custom)

* `<Leader>gi` create private gist
* `<Leader>gI` create public gist
* `<Leader>ge` edit gist
* `<Leader>gx` delete gist

## Language-specific

### LaTeX

* `<Leader>ll` build PDF with latexmk
* `<Leader>lv` view PDF
* `<Leader>lc` clean auxiliary files
* `<Leader>lt` open table of contents

### R (Nvim-R)

* `<Leader>rf` open R session
* `<Leader>rq` quit R session
* `<Leader>d` run a line and move down
* `<Leader>sa` run selection and move down
* `<Leader>se` run selection and show output
* `<Leader>ae` send file
* `<Leader>ca` send chunk
* `<Leader>fa` run function and move down
* `<Leader>pa` run paragraph and move down
* `<Leader>gn` go to next R chunk
* `<Leader>gN` go to previous R chunk
* `<Leader>rh` help
* `<Leader>rp` print
* `<Leader>rs` summary
* `<Leader>rt` structure
* `<Leader>rn` names
* `<Leader>rl` list space
* `<Leader>ro` object browser
* `<Leader>rv` show data in new tab
* `<Leader>rm` remove objects and clear console
* `<Leader>rr` clear console
* `<Leader>kp` build PDF with Knitr
* `<Leader>kh` build HTML
* `<Leader>kl` build Beamer PDF
* `<Leader>kr` render Markdown file
* `<Leader>xx` toggle comment
* `=` indent selection
* `==` indent line
* `gg=G` indent whole buffer

### Markdown

* `]]` next header
* `[[` previous header
* `][` next sibling header
* `[]` previous sibling header
* `]c` current header
* `]u` parent header

### Pandoc

* `:Pandoc --ascii` display diacritics in HTML output

## Writing and prose

### Spell check

* `z=` show spelling suggestions (place cursor on word first)
* `zG` add word to dictionary
* `]s` next misspelled word
* `[s` previous misspelled word
* `<Ctrl>ns` disable spell check (custom)
* `<Leader>z` pick first suggested word (custom)

### Grammar and style (custom)

* `<Leader>cs` open thesaurus
* `<Leader>T` translate word
* `<Leader>wg` toggle write-good
* `<Leader>wc` toggle vim-grammarous
* `<Leader>wr` reset vim-grammarous

### Tables (custom)

* `<Leader>mm` toggle vim-table-mode. Use `|` to delimit the first line, then type `||` (without leaving insert mode) for a horizontal separator. Add rows delimited with `|`, then return to the first line and type `||`.

## Marks

* `mX` set mark X (0-9, a-z)
* `dmX` delete mark X
* `m,` set next available mark
* `m-` delete all marks from current line
* `m<Space>` delete all marks
* `'X` jump to mark X
* `]'` next line with a mark
* `['` previous line with a mark
* `` ]` `` next mark
* `` [` `` previous mark
* `m/` show all marks
