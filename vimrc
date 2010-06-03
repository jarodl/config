set nocompatible		      " don't act like vi
set history=1000		      " a lot of command line history
set ffs=unix,dos,mac		  " support these files
call pathogen#runtime_append_all_bundles()
filetype plugin indent on	  " load the filetype plugin

set modeline			      " make sure modeline support is enabled
set autoread			      " reload files (no local changes only)
set tabpagemax=50		      " max of 50 tabs

" ----------------------------------------------------------------------------
"  Backups
" ----------------------------------------------------------------------------

set nobackup                           " do not keep backups after close
set nowritebackup                      " do not keep a backup while working
set noswapfile                         " don't keep swp files either
set backupdir=$HOME/.vim/backup        " store backups under ~/.vim/backup
set backupcopy=yes                     " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap,~/tmp,.      " keep swp files under ~/.vim/swap

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------

set ruler                  " show the cursor position all the time
set noshowcmd              " don't display incomplete commands
set nolazyredraw           " turn off lazy redraw
set number                 " line numbers
set wildmenu               " turn on wild menu
set wildmode=list:longest,full
set ch=2                   " command line height
set backspace=2            " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=filtIoOA     " shorten messages
set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling

" ----------------------------------------------------------------------------
" Visual Cues
" ----------------------------------------------------------------------------

set showmatch              " brackets/braces that is
set mat=5                  " duration to show matching brace (1/10 sec)
set incsearch              " do incremental searching
set hlsearch               " highlight search
set laststatus=2           " always show the status line
set ignorecase             " ignore case when searching
set visualbell             " shut the heck up

" ----------------------------------------------------------------------------
" File browsing
" ----------------------------------------------------------------------------

let g:explHideFiles='^\.,.*\.sw[po]$,.*\.pyc$'

" ----------------------------------------------------------------------------
" Text Formatting
" ----------------------------------------------------------------------------

set autoindent             " automatic indent new lines
set smartindent            " be smart about it
set nowrap                 " do not wrap lines
set softtabstop=2          " yep, two
set shiftwidth=2           " ..
set tabstop=4
set expandtab              " expand tabs to spaces
set nosmarttab             " tabs can get the heck out
set formatoptions+=n       " support for numbered/bullet lists
set textwidth=78           " leave a little room for 80 cols
set virtualedit=block      " allow virtual edit in visual block ..

" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

map <C-t> :FufFile<CR>      " Find a file quickly
map <D-/> ,c<space>         " toggle comment state

" ---------------------------------------------------------------------------
"  sh config
" ---------------------------------------------------------------------------

au Filetype sh,bash set ts=4 sts=4 sw=4 expandtab
let g:is_bash = 1

" ---------------------------------------------------------------------------
" File Types
" ---------------------------------------------------------------------------

au BufRead,BufNewFile *.ru         set ft=ruby
au BufRead,BufNewFile *.haml       set ft=haml
au BufRead,BufNewFile *.md         set ft=mkd tw=80 ts=2 sw=2 expandtab
au BufRead,BufNewFile *.markdown   set ft=mkd tw=80 ts=2 sw=2 expandtab

" close an open tag by pressing Ctrl + Shift + Underscore
au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 
au Filetype ruby		   set tw=80  ts=2
