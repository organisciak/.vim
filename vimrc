" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Set leader to ,
let mapleader=","


" Run Vim Pathogen https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" Coffee Script Indentation
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab softtabstop=2
" Coffeescript fold by indent (use 'zi' to fold)
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" Python Regular indentation (4 spaces per tab)
au BufNewFile,BufReadPost *.py setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.py setl shiftwidth=4 expandtab softtabstop=4

" Javascript indentation (4 spaces per tab) and folding
au BufNewFile,BufReadPost *.js setl shiftwidth=4 expandtab softtabstop=4
let javaScript_fold=1         " JavaScript
au BufNewFile,BufReadPost *.js setl foldmethod=syntax foldlevelstart=1 

" Enable Powerline when you're not in split screen
set laststatus=2

" Enable filetype plugins (e.g. for NERD Commenter)
filetype plugin on 

" Preferences for CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" Toggle Auto-indenting for pasting of code
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Map CtrlPBuffer to the ;
nmap ; :CtrlPBuffer<CR>

" Use Java highlighting for Processing files
au BufRead,BufNewFile *.pde     setf java

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" to use it, copy it to
"     for unix and os/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
