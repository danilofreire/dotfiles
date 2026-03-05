" Set the runtimepath to include the system-wide Vim files and the user's Vim files.
" Also set the packpath to the same value as the runtimepath.
" Finally, source the user's Vim configuration file.
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
