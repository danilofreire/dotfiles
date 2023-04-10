# Useful Commands

Here is a list of commands that I regularly use. Some of them are customised.

## Basic commands

*  `{` move to previous paragraph
*  `}` move to next paragraph
* `#` search for previous occurrence of the word under cursor
* `$` go to the end of the line
* `%` move to matching character (default supported pairs: '()', '{}', '[]' - use :h matchpairs in vim for more info)
* `(` move to previous sentence
* `)` move to next sentence
* `*` search for next occurrence of the word under cursor
* `.` repeat last change
* `/pattern/e+1` move to 1 space after the end of the word
* `/pattern` search for pattern
* `0` go to beginning of the line
* `:!<COMMAND>` run a terminal command
* `:%s/old/new/gc` replace all old with new throughout file with confirmation
* `:colors` change colour scheme
* `:e .` open file browser
* `:e` edit file (then enter file address)
* `:h` help
* `:noh` disable search highlighting
* `:q!` quit without saving
* `:q` quit
* `:qa` quit all windows at once
* `:tabmove 0` move tab to the beginning
* `:tabmove 1` move current tab to become the 2nd tab
* `:tabmove` move tab to the end
* `:w` save file
* `;` repeat last command
* `<Ctrl><Tab>` go to next buffer (custom)
* `<Ctrl>a` yank all text (custom)
* `<Ctrl>b` page up
* `<Ctrl>c` copy text (custom)
* `<Ctrl>e` move view pane down
* `<Ctrl>f` page down
* `<Ctrl>h` move to the left in insert or command mode (h,j,k,l,w,e,b movements are mapped -- custom)
* `<Ctrl>n` autocomplete (insert mode)
* `<Ctrl>n` select text for multicursors editing (normal mode)
* `<Ctrl>r` redo
* `<Ctrl>s` save files (custom)
* `<Ctrl>v` paste text (custom)
* `<Ctrl>y` move view pane up
* `<F3>` toggle paste mode (custom)
* `<F5>` refresh current tab (custom)
* `<F6>` remove white trailing space (custom)
* `<F7>` open new terminal (custom)
* `<Leader>1` go to buffer #1 (custom, up to 9)
* `<Leader>F` open FZF (custom)
* `<Leader>L` toggle limelight
* `<Leader>as` toggle AutoSave (custom)
* `<Leader>ea` open easy-align (custom)
* `<Leader>fXX` move to the next two XX characters you type (custom)
* `<Leader>go` toggle Goyo (custom). Suggestion: Type `<Ctrl>w20<` when opening Markdown files
* `<Leader>n` disable search highlighting (custom)
* `<Leader>nf` toggle NERDTreeFind (custom)
* `<Leader>nt` toggle NERDTree (custom)
* `<Leader>rn` toggle relative line numbers (custom)
* `<Leader>sa` sort lines alphabetically, remove duplicates (`:'<,'>sort u`) (custom)
* `<Leader>sn` sort numbers (custom)
* `<Leader>sr` sort in reverse (custom)
* `<Leader>t` open vertical terminal REPL (custom)
* `<Leader>w` navigate to word (custom)
* `<Leader>x` close buffer (`:bd`) (custom)
* `?pattern` search backward for pattern
* `A` append at end of line (`$a`)
* `C` delete to the end of the line and open insert mode (`c$`)
* `D` delete to the end of the line (`d$`)
* `Esc` normal mode
* `FX` find the previous X character
* `G` go to last line
* `H` go to the top of the screen
* `I` insert mode in the beginning of the line (`0i`)
* `K` move selected lines up in visual mode (custom)
* `J` move selected lines down in visual mode (custom)
* `J` join line below to the current one with one space in between
* `L` go to the bottom of the screen
* `M` go to the middle of the screen
* `N` search backwards
* `O` open new line above and take to insert mode
* `P` paste before cursor
* `R` replace mode
* `SELECTEDTEXT S'` add `'` or any other symbol surrounding a text element. From tpope's great [surround plugin](https://github.com/tpope/vim-surround). It can be combined with `targets.vim`, too. Ex: to add inverted commas to `[surround plugin]` above, just type `vi[S"`. To change `"` to `'`, type `cs"'`; to delete the surrounding `"`, type `ds"`
* `S` delete line and move to the beginning
* `TX` puts the cursor just before the character X
* `XXgg` go to the XX line, just type the number
* `Y` yank to the end of the line (custom)
* `` `" `` go to last cursor position
* `cMOTION` change to end of word (`e`) or any other motion you want to use
* `fX` jump to the next character X
* `gJ` join line below to the current one without space in between
* `gcMOTION` comment a text selection. It can be a paragraph (`gcip`) or any other selection
* `gcc` comment a line
* `gg` go to the first line
* `gj` go to following _displayed_ line
* `gk` go to previous _displayed_ line
* `h j k l` move cursor ( h: ←  j: ↓  k: ↑  l: → )
* `i` writing mode
* `n` repeat search
* `o` open new line below and take to insert mode
* `p` paste after cursor
* `r` replace a single character
* `set COMMAND!` unset a command
* `tX` place the cursor in the character that comes before `X`
* `u` undo
* `v` visual mode (use to select text)
* `x` delete character under cursor
* `y` yank (copy)
* `yy` yank line
* `yyp` duplicate line
* `zR` unfold the whole document
* `za` open/close fold
* `zb` moves the current line to the bottom of the screen
* `zt` moves the current line to the top of the screen
* `zx` refresh folds
* `zz` moves the current line to the middle of the screen
* `~` switch case
* `ˆ` jump to the first non-blank character of the line

## Coc-Nvim

* `<Leader>cc` open `:CocCommand` (custom)
* `<Leader>cl` open [coc-lists](https://vimawesome.com/plugin/coc-lists) (custom)
* `<Leader>cm` open [coc-marketplace](https://github.com/fannheyward/coc-marketplace) (custom)

## Floaterm

* `<Leader>t` open new terminal (custom)
* `<F7>` open new terminal (custom)
* `<F8>` open new R terminal (custom)
* `<F9>` open new python terminal (custom)
* `<F10>` go to next terminal (custom)
* `<F11>` toggle terminal (custom)
* `<F12>` close terminal (custom)
* `<Leader>l` send code to terminal (custom)

## Gist

* `<Leader>gi` create private gist with description (custom)
* `<Leader>gI` create public gist with description
* `<Leader>ge` edit gist with description (custom)
* `<Leader>gx` delete gist

## Git

* `<Leader>ga` git add (custom)
* `<Leader>gb` shows `git blame` output (custom)
* `<Leader>gbr` git branch (custom)
* `<Leader>gc` git commit. Write a comment and close the tab to push (custom)
* `<Leader>gca` git amend (custom)
* `<Leader>gcam` git amend --no-edit (custom)
* `<Leader>gco` git checkout (custom)
* `<Leader>gd` git remove (custom)
* `<Leader>gf` git fetch (custom)
* `<Leader>gl` git log (custom)
* `<Leader>gm` git merge (custom)
* `<Leader>gpb` git pull --rebase (custom)
* `<Leader>gpl` git pull (custom)
* `<Leader>gps` git push (custom)
* `<Leader>gr` git read (custom)
* `<Leader>gs` git status (custom)
* `<Leader>gv` git diff, vertical split (custom)

## GitHub Copilot

* `<Ctrl-]>` dismiss the current suggestion
* `<fn-option-]>` cycle to the next suggestion, if one is available 
* `<fn-option-[>` cycle to the previous suggestion 
* `<fn-option-\>` explicitly request a suggestion, even if Copilot is disabled 

## LaTeX

* `<Leader>ll` build a pdf with latexmk
* `<Leader>lv` view pdf
* `<Leader>lc` clean auxiliary files
* `<Leader>lt` open table of contents

## Marks

* `mX` toggle mark `X` (0-9, a-z) to text
* `dmX` delete mark `X`
* `m,` toggle next available mark
* `m-` delete all marks from current line
* `m<Space>` delete all marks
* `'X` jump to mark `X`
* `]'` jump to next line containing a mark
* `['` jump to previous line containing a mark
* `` ]` `` jump to next mark
* `` [` `` jump to previous mark
* `m/` show all marks

## Markdown

* `]]` go to next header
* `[[` go to previous header
* `][` go to next sibling header
* `[]` go to previous sibling header
* `]c` go to current header
* `]u` go to parent header

## Pandoc

* `:Pandoc --ascii` display diacritics in html output

## R

* `==` indent line
* `=` indent selection
* `gg=G` indent whole buffer
* `<Leader>ae` send file
* `<Leader>ca` send chunk
* `<Leader>d` run a line and goes down
* `<Leader>fa` run a function and go down
* `<Leader>gn` go to next R chunk
* `<Leader>gN` go to previous R chunk
* `<Leader>kh` builds html
* `<Leader>kl` builds beamer pdf
* `<Leader>kp` build pdf with Knitr
* `<Leader>kr` renders markdown file
* `<Leader>pa` run a paragraph and go down
* `<Leader>rf` opens a new R session
* `<Leader>rh` help
* `<Leader>rl` list space
* `<Leader>rm` remove objects and clear console
* `<Leader>rn` names
* `<Leader>ro` object browser
* `<Leader>rp` print
* `<Leader>rq` quit R session
* `<Leader>rr` clear console
* `<Leader>rs` summary
* `<Leader>rt` structure
* `<Leader>rv` show data in a new tab
* `<Leader>sa` run a selection and go down
* `<Leader>se` runs a selection and show output
* `<Leader>xx` toggle comment

## Windows

* `<Ctrl>wXX<` increase width (replace `XX` by any number you prefer)
* `<Ctrl>wXX>` decrease width (replace `XX` by any number you prefer)
* `<Ctrl>w<Ctrl>R` switch windows
* `<Ctrl>wT` send current window to a new tab
* `<Ctrl>wl` move focus to the right window (use `h` to move to the right window, `j` below, `k` above)
* `<Ctrl>wL` move window ( H: ←  J: ↓  K: ↑  L: → )
* `<Ctrl>wc` close window
* `<Ctrl>wS` horizontal splitting
* `:sp` horizontal splitting
* `<Ctrl>wv` vertical splitting
* `:vs` vertical splitting
* `<Ctrl>wQ` close window

## Writing prose

* `z=` in normal mode (click over the word first)
* `zG` add new word to dictionary
* `]s` next wrong word
* `[s` previous wrong word
* `<Ctrl>ns` disable spell check (custom)
* `<Leader>z` automatically chooses the first suggested word
* `<Leader>cs` open Thesaurus
* `<Leader>wg` toggle write-good (custom)
* `<Leader>T` translate word (custom)
* `<Leader>wc` toggle [vim-grammarous](https://github.com/rhysd/vim-grammarous/) (custom)
* `<Leader>wr` reset [vim-grammarous](https://github.com/rhysd/vim-grammarous/) (custom)
* `<Leader>mm` toggle [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode) (custom). Use `|` to delimit the first line, then type `||` (without leaving insert mode) to write a properly formatted horizontal line. Add as many lines as you want (remember to delimit the columns with `|`), then return to the first line and type `||`.
