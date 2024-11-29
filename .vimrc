" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-commentary'                                               " Commenting out code
Plug 'github/copilot.vim'                                                 " GitHub Copilot - autocomplete
Plug 'chrisbra/csv.vim'                                                   " CSV editing
Plug 'tpope/vim-dadbod'                                                   " Interact with databases
Plug 'blueyed/vim-diminactive'                                            " Dim inactive buffers
Plug 'junegunn/vim-easy-align'                                            " Align text
Plug 'easymotion/vim-easymotion'                                          " Text navigation
Plug 'haya14busa/incsearch.vim'                                           " Incremental search
Plug 'haya14busa/incsearch-easymotion.vim'                                " Incremental search with easymotion
Plug 'junegunn/vim-emoji'                                                 " Emoji support
Plug 'voldikss/vim-floaterm'                                              " Floating terminal
Plug 'tpope/vim-fugitive'                                                 " Git integration
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                       " Fuzzy file finder
Plug 'junegunn/fzf.vim'                                                   " Fuzzy file finder
Plug 'mattn/gist-vim'                                                     " Gist integration
Plug 'mattn/webapi-vim'                                                   " Web API integration
Plug 'airblade/vim-gitgutter'                                             " Git integration
Plug 'junegunn/goyo.vim'                                                  " Distraction-free writing
Plug 'rhysd/vim-grammarous'                                               " Syntax highlighting for prose
Plug 'sainnhe/gruvbox-material'                                           " Gruvbox theme
Plug 'machakann/vim-highlightedyank'                                      " Highlight yanked text
Plug 'davidhalter/jedi-vim'                                               " Python autocompletion
Plug 'camspiers/animate.vim'                                              " Animate text
Plug 'camspiers/lens.vim'                                                 " Lens
Plug 'reedes/vim-lexical'                                                 " Lexical navigation
Plug 'itchyny/lightline.vim'                                              " Lightline
Plug 'mengelbrecht/lightline-bufferline'                                  " Lightline bufferline
Plug 'junegunn/limelight.vim'                                             " Highlight matching parenthesis
Plug 'dhruvasagar/vim-table-mode'                                         " Table editing
Plug 'godlygeek/tabular'                                                  " Text filtering and alignment
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } } " Markdown preview
Plug 'plasticboy/vim-markdown'                                            " Markdown editing
Plug 'kaicataldo/material.vim'                                            " Material theme
Plug 'terryma/vim-multiple-cursors'                                       " Multiple cursors
Plug 'scrooloose/nerdtree'                                                " File tree
Plug 'jalvesaq/Nvim-R'                                                    " R integration
Plug 'vim-pandoc/vim-pandoc'                                              " Pandoc integration
Plug 'vim-pandoc/vim-pandoc-syntax'                                       " Pandoc syntax highlighting
Plug 'jeetsukumaran/vim-pythonsense'                                      " Python syntax highlighting
Plug 'frazrepo/vim-rainbow'                                               " Rainbow brackets
Plug 'tpope/vim-repeat'                                                   " Repeat last change
Plug 'tpope/vim-sensible'                                                 " Sensible defaults
Plug 'kshenoy/vim-signature'                                              " Place, toggle and display marks
Plug 'junegunn/vim-slash'                                                 " Slash commands
Plug 'honza/vim-snippets'                                                 " Snippets
Plug 'Shougo/neosnippet-snippets'                                         " Neosnippet snippets
Plug 'sainnhe/sonokai'                                                    " Sonokai theme
Plug 'tpope/vim-surround'                                                 " Surround text
Plug 'mhinz/vim-startify'                                                 " Start screen
Plug 'wellle/targets.vim'                                                 " Add text objects to help navigation
Plug 'ron89/thesaurus_query.vim'                                          " Thesaurus query
Plug 'voldikss/vim-translator'                                            " Translate text
Plug 'davidbeckingsale/writegood.vim'                                     " Linter for English writing
Plug 'lervag/vimtex'                                                      " LaTeX
Plug 'reedes/vim-wordy'                                                   " Tools for English prose
Plug 'ryanoasis/vim-devicons'                                             " Show icons for files
Plug 'nvim-lua/plenary.nvim'                                              " Plenary
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }             " Copilot chat
Plug '3rd/image.nvim'                                                     " Image viewer

" All of your Plugins must be added before the following line
call plug#end()

" Settings
set autochdir                              " Set working directory to current folder
set autoread                               " Reload files
set backspace=indent,eol,start             " Backspacing over everything in insert mode
set belloff+=ctrlg                         " If Vim beeps during completion
set clipboard=unnamed                      " Use y to copy text to clipboard
set completeopt+=menuone,noselect,noinsert " Autocomplete options
set completeopt-=preview                   " Remove preview
set confirm                                " Y-N-C prompt if closing with unsaved changes
set expandtab                              " Expand tabs into spaces
set encoding=utf8                          " Enconding for vim-devicons
set fo-=t                                  " Formatting
set guicursor=i:ver25-iCursor              " Cursor size
set guifont=FiraCodeNerdFont-Retina:h16    " Font for vim-devicons
set hidden                                 " No unsaved buffer warnings
set hlsearch                               " Highlight all search results
set ignorecase                             " Always case-insensitive
set incsearch                              " Searches for strings incrementally
set laststatus=2                           " Show status bar
set linebreak                              " Break lines
set list                                   " List
set listchars=tab:>-                       " Find tabs (useful to editing YAML)
set modeline                               " Set variables specific to files
set mouse=a                                " Mouse support
set mousehide                              " Hide mouse when typing
set nobackup                               " No backup~ files
set nospell                                " Turn off spell check (see below)
set number relativenumber                  " Show line numbers
set pastetoggle=<F3>                       " Toggle paste mode
set path+=**                               " Fuzzy find files
set shiftwidth=2                           " Indent
set shortmess+=c                           " Shut off completion messages
set showmatch                              " Show matching pair for [] {} and ()
set showtabline=2                          " Show tablines
set smartcase                              " Enable smart-case search
set smartindent                            " Smart indentation
set smarttab                               " Enable smart-tabs
set softtabstop=2                          " Tab
set spelllang=en_gb,pt_br                  " British English
set splitright                             " Always split right
set tabstop=2                              " Number of spaces per Tab
set tw=0                                   " Textwidth
set undolevels=1000                        " Number of undo levels
set visualbell                             " Use visual bell (no beeping)
set wildmenu                               " Show menu autocomplete options
set wildmode=longest,list,full             " Options for wildmenu
syntax enable                              " Syntax highlighting

" Remap leader to space
let mapleader=" "
nnoremap <SPACE> <Nop>

" Save with Ctrl+S
nmap <C-s> :w <CR>
imap <C-s> <ESC>:w<CR>a
vmap <C-s> <ESC>:w<CR>gv

" Copilot Chat
lua << EOF
local copilot_chat = require("CopilotChat")
copilot_chat.setup({
  debug = true,
  show_help = "yes",
  prompts = {
    Explain = "Explain how it works in English for a beginner.",
    Review = "Review the following code and provide concise suggestions.",
    Tests = "Briefly explain how the selected code works, then generate unit tests.",
    Refactor = "Refactor the code to improve clarity and readability.",
  },
  build = function()
    vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
  end,
  event = "VeryLazy",
})

EOF

" Copilot Chat mappings
nnoremap <leader>gha <cmd>CopilotChatAgents<cr>
nnoremap <leader>ghe <cmd>CopilotChatExplain<cr>
nnoremap <leader>ghf <cmd>CopilotChatFix<cr>
nnoremap <leader>ghm <cmd>CopilotChatModels<cr>
nnoremap <leader>gho <cmd>CopilotChatOptimize<cr>
nnoremap <leader>ght <cmd>CopilotChatToggle<cr>

" Spelling
au FileType rmd,md,markdown,pandoc,tex,latex syntax spell toplevel
au FileType rmd,md,markdown,pandoc,tex,latex,bib,bibtex setl spl=en_gb,pt_br spell
map <Leader>ns :set nospell<CR>
map <Leader>z 1z=

" Colour column
call matchadd('ColorColumn', '\%81v.', 100)
hi ColorColumn ctermbg=magenta

" True colors
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR             = 1
endif
if (has('termguicolors'))
  set termguicolors
endif

" Material theme
let g:material_terminal_italics               = 0
let g:material_theme_style                    = 'palenight'
" colors material

" Gruvbox Material theme
let g:gruvbox_material_better_performance     = 1
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_enable_bold            = 1
let g:gruvbox_material_palette                = 'original'
" colors gruvbox-material

" Sonokai theme
let g:sonokai_style                           = 'espresso'
let g:sonokai_enable_italic                   = 0
let g:sonokai_disable_italic_comment          = 1
colors sonokai

" Lightline configuration
let g:lightline = {
      \ 'colorscheme': 'sonokai',
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
let g:lightline#bufferline#enable_devicons   = 1
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#shorten_path      = 0
let g:lightline#bufferline#show_number       = 0
let g:lightline#bufferline#unicode_symbols   = 1
let g:lightline#bufferline#unnamed           = '[No Name]'

" Turn off search highlighting
map <Leader>n :noh <CR>

" GitGutter
let g:gitgutter_max_signs = 500

" fzf
nmap <Leader><S-F> :FZF ~/<CR>

" Highlight yanks
let g:highlightedyank_highlight_duration = -1

" Delete all marks
nmap <Leader>dm :delm! <bar> delm A-Z0-9<CR>

" Rainbow parentheses
let g:rainbow_active = 1

" Python
"
" Install Python 3 support: 
" pip install neovim
" pip install pynvim --upgrade 
" Use conda environment ml:
" conda create --name ml
" conda activate ml
let g:python3_host_prog = '/opt/miniconda3/bin/python'
let g:python_host_prog = '/opt/miniconda3/bin/python'

" Floaterm
nmap <Leader>t :FloatermNew --position=center<CR>
nmap <F7> :FloatermNew --wintype=normal --position=right<CR>
nmap <F8> :FloatermNew --wintype=normal --position=right radian<CR>
nmap <F9> :FloatermNew --wintype=normal --position=right python3<CR>
let g:floaterm_keymap_next   = '<F10>'
let g:floaterm_keymap_toggle = '<F11>'
let g:floaterm_keymap_kill   = '<F12>'
let g:floaterm_opener        = 'vsplit'
nmap <Leader>zf :FloatermNew fzf<CR>
nmap <Leader>l :FloatermSend <CR>
nmap <S-CR> :FloatermSend <CR>
vmap <Leader>l :'<,'>FloatermSend <CR> 
vmap <S-CR> :'<,'>FloatermSend <CR>

" Thesaurus
let g:tq_enabled_backends = ["datamuse_com", "mthesaur_txt",]

" Latex live preview
let g:livepreview_previewer = 'open -a Preview'

" Vim Easy Align
xmap <Leader>ea <Plug>(EasyAlign)
nmap <Leader>ea <Plug>(EasyAlign)

" NERDTree
nmap <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>nf :NERDTreeFind<CR>

" Cursor.execute for Python and SQL
nnoremap <Leader>ex i<CR>cursor.execute("")<Esc>F"i

" Jedi
let g:jedi#goto_command             = ""
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_stubs_command       = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command    = ""
let g:jedi#usages_command           = ""
let g:jedi#completions_command      = ""
let g:jedi#rename_command           = ""
let g:jedi#completions_enabled      = 0

" Translate Me
let g:translator_source_lang = "auto"
let g:translator_target_lang = "pt-br"
nmap <Leader><S-t> <Plug>TranslateW
vmap <Leader><S-t> <Plug>TranslateWV

" Quick yanking to the end of the line
nmap Y y$

" Moving text
vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv

" Yank/paste to the OS clipboard with <Leader>y and <Leader>p
nmap <Leader>y "+y
nmap <Leader>Y "+y$
nmap <Leader>p "+p
nmap <Leader>P "+P
nmap <C-a> :%y+ <CR>

" Select all
nmap <C>a ggXG<CR>

" Copy to clipboard
nmap <C>c :w !pbcopy<CR>

" Paste from clipboard
nmap <C>v :r !pbpaste<CR>

" Deactivate arrows
nmap <Up> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>
nmap <Right> <Nop>

" Remap j and k as gj and gk
nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk

" In insert or command mode, move normally by using Ctrl
cnoremap <C-S-b> <C-O><S-b>
cnoremap <C-S-w> <C-O><S-w>
cnoremap <C-b> <C-O>b
cnoremap <C-e> <C-O>e<C-O>l
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
cnoremap <C-w> <C-O>w
inoremap <C-S-b> <C-O><S-b>
inoremap <C-S-w> <C-O><S-w>
inoremap <C-b> <C-O>b
inoremap <C-e> <C-O>e<C-O>l
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-w> <C-O>w

" Auto-save
let g:auto_save        = 1
let g:auto_save_events = ["InsertLeave"]
nmap <Leader>as :AutoSaveToggle<CR>

" Write good
nmap <Leader>wg :WritegoodToggle<CR>

" Grammarous
nmap <Leader>wc :GrammarousCheck<CR>
nmap <Leader>wr :GrammarousReset<CR>

" Git
nmap <leader>ga :Gwrite<CR>
nmap <leader>gb :Git blame<CR>
nmap <leader>gbr :Git branch<Space>
nmap <leader>gc :Git commit<CR>
nmap <leader>gca :Git commit --amend<CR>
nmap <leader>gcam :Git commit --amend --no-edit<CR>
nmap <leader>gco :Gcheckout<Space>
nmap <leader>gd :GDelete<CR>
nmap <leader>gf :Gfetch<CR>
nmap <leader>gl :silent! Glog<CR>
nmap <leader>gm :Git merge<CR>
nmap <leader>gpb :Git pull --rebase<CR>
nmap <leader>gpl :Git pull<CR>
nmap <leader>gps :Git push<CR>
nmap <leader>gr :Gread<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gv :Gvdiffsplit<CR>

" Gist.vim
let g:gist_clip_command     = 'pbcopy'
let g:gist_detect_filetype  = 1
let g:gist_get_multiplefile = 1
let g:gist_post_private     = 1
let g:gist_show_privates    = 1
let g:github_token          = ''
let g:github_user           = 'danilofreire'
nmap <Leader>ge :Gist -e -s
nmap <Leader>gi :Gist -b -s
nmap <Leader>gpri :Gist -p -s
nmap <Leader>gx :Gist -d<CR>

" Sort - alphabetically, numbers, reverse
vmap <Leader>sa :'<,'>sort u<CR>
vmap <Leader>sn :'<,'>sort n<CR>
vmap <Leader>sr :'<,'>sort!<CR>

" Vim-Polyglot
let g:polyglot_disabled = ['latex']

" Markdown
let g:vim_markdown_auto_insert_bullets  = 0
let g:vim_markdown_conceal              = 0
let g:vim_markdown_conceal_code_blocks  = 0
let g:vim_markdown_frontmatter          = 1
let g:vim_markdown_math                 = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_strikethrough        = 1
let g:vim_markdown_toc_autofit          = 1

" Table mode
nmap <Leader>mm :TableModeToggle<CR>

" MarkdownPreview
let g:mkdp_refresh_slow                 = 1
nmap <Leader>mp :MarkdownPreview<CR>
nmap <Leader>ms :MarkdownPreviewStop<CR>

" Format
nmap Q {gq}
nmap QQ gggqG

" Vimtex Config
let g:tex_conceal                      = ''
let g:vimtex_fold_enabled              = 1
let g:vimtex_quickfix_open_on_warning  = 0
set conceallevel=0

" Limelight config
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg        = 'gray'
let g:limelight_conceal_ctermfg        = 240
let g:limelight_default_coefficient    = 0.7
nmap <Leader>L :Limelight!! <CR>i<Esc>`^

" Goyo integration
nmap <Leader>go :Goyo <CR>
let g:goyo_linenr = 1
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
  set linebreak
  set wrap
  set tw=80
  Limelight
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
  Limelight!
endfunction

autocmd VimResized * if exists('#goyo') | exe "normal \<c-w>20<" | endif
autocmd User GoyoEnter nested call <SID>goyo_enter()
autocmd User GoyoLeave nested call <SID>goyo_leave()

" Increase window after Goyo
" nmap <Leader>yo <C-w><C-h> :20<C-w>

" UltiSnips
let g:UltiSnipsUsePythonVersion = 3

" Close tab
nmap <Leader>x :bd <CR>

" Set filetype of files with extension .tex to tex
let g:tex_flavor = 'latex'

" Enable pandoc functionality for markdown files
let g:pandoc#filetypes#handled         = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 1
let g:pandoc#formatting#mode           = "h"
let g:pandoc#keyboard#display_motions  = 0
let g:pandoc#syntax#conceal#use        = 0
au BufNewFile,BufRead *.Rmd :call pandoc#completion#Init()
au BufNewFile,BufRead *.Rmd :call pandoc#bibliographies#Init()

" Map ESC to leave terminal
:tnoremap <Esc> <C-\><C-n>

" nvim-R
" Install radian: pip3 install radian
let R_app              = "radian"
let R_args             = []
let R_bracketed_paste  = 1
let R_cmd              = "R"
let R_hl_term          = 0
let R_min_editor_width = 30
let R_nvimpager        = "horizontal"
let R_rconsole_width   = 50
let g:R_hi_fun         = 1
let r_syntax_folding   = 0

" Some shortcuts for easymotion:
" <Leader>f{char} to move to {char}{char}
map  <Leader>f <Plug>(easymotion-bd-f2)
nmap <Leader>f <Plug>(easymotion-overwin-f2)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Indentation
filetype indent on
au FileType python setl ts=4 sw=4 sts=4 et
au FileType r,html,css,javascript setl ts=2 sw=2 sts=2 et

" Wrap/unwrap text
function! WrapText()
  let tw = &textwidth
  if tw==80 
    set tw=0
  else
    set tw=80
  endif
endfunc
nmap <Leader>tw :call WrapText()<CR>

" Toggle relativenumber
function! NumberToggle()
  if(&rnu == 1)
    set nornu
  else
    set rnu
  endif
endfunc
nmap <Leader>rn :call NumberToggle()<CR>

" Remove all trailing whitespace by pressing F6
nmap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Refresh current tab with F5
nmap <F5> :e <CR>

" Clear highlighting by pressing Enter in normal modemap
imap <C-v> <ESC>"+pa

" Move buffers
nmap <Leader>1 :bfirst <CR>
nmap <Leader>2 :bfirst <bar> :bn<CR>
nmap <Leader>3 :bfirst <bar> :2bn<CR>
nmap <Leader>4 :bfirst <bar> :3bn<CR>
nmap <Leader>5 :bfirst <bar> :4bn<CR>
nmap <Leader>6 :bfirst <bar> :5bn<CR>
nmap <Leader>7 :bfirst <bar> :6bn<CR>
nmap <Leader>8 :bfirst <bar> :7bn<CR>
nmap <Leader>9 :bfirst <bar> :8bn<CR>

" Navigate around splits with a single key combo
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>
nmap <C-k> <C-w><C-k>
nmap <C-j> <C-w><C-j>

