" *************************************************
" *************************************************
" **                                             **
" ** This .vimrc was reproduced from here:       **
" ** http://dougblack.io/words/a-good-vimrc.html **
" **                                             **
" *************************************************
" *************************************************


" 1.0 Vundle stuff {{{
" Added VUNDLE to tip top of script...
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"set runtimepath^=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'




" Track the engine.
Plugin 'SirVer/ultisnips'
"
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

"Add Projectionist
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-fugitive'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ===================END VUNDLE SHIT========================
" }}}

syntax enable           " enable syntax processing
set t_Co=256
colorscheme meta5
"colorscheme badwolf

"---TAB STUFF---
" number of visual spaces per TAB
set tabstop=4 

" number of spaces in tab when editing
set softtabstop=4

" tabs are spaces
" converts tabs to actual spaces so that number above is just 4 spaces
set expandtab

" default line nums
set number

" show the last cmd at bottom right
set showcmd

" cursorline draws a horizontal highlight (or underline, depending on your colorscheme) 
" on the line your cursor is currently on.

set cursorline          " highlight current line



" set filetype indentation on based on filetype
" Will look at ~/.vim/indent/php.vim or python.vim for queues

filetype indent on      " load filetype-specific indent files


set wildmenu            " visual autocomplete for command menu

set lazyredraw          " redraw only when we need to.

set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

set foldenable          " enable folding

set foldlevelstart=10   " open most folds by default

set foldnestmax=10      " 10 nested fold max

" space open/closes folds
nnoremap <space> za

set foldmethod=indent   " fold based on indent level

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

let mapleader=","       " leader is comma

" jk is escape
inoremap jk <esc>

" toggle gundo
set runtimepath^=~/.vim/bundle/gundo
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>


" save session
nnoremap <leader>s :mksession<CR>

" open ag.vim
nnoremap <leader>a :Ag

" CtrlP settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" allows cursor change in tmux mode
if exists('$TMUX')
            let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
                let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
        else
                    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
                        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
                endif

augroup configgroup
            autocmd!
            autocmd VimEnter * highlight clear SignColumn
            autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
            autocmd FileType java setlocal noexpandtab
            autocmd FileType java setlocal list
            autocmd FileType java setlocal listchars=tab:+\ ,eol:-
            autocmd FileType java setlocal formatprg=par\ -w80\ -T4
            autocmd FileType php setlocal expandtab
            autocmd FileType php setlocal list
            autocmd FileType php setlocal listchars=tab:+\ ,eol:-
            autocmd FileType php setlocal formatprg=par\ -w80\ -T4
            autocmd FileType ruby setlocal tabstop=2
            autocmd FileType ruby setlocal shiftwidth=2
            autocmd FileType ruby setlocal softtabstop=2
            autocmd FileType ruby setlocal commentstring=#\ %s
            autocmd FileType python setlocal commentstring=#\ %s
            autocmd BufEnter *.cls setlocal filetype=java
            autocmd BufEnter *.zsh-theme setlocal filetype=zsh
            autocmd BufEnter Makefile setlocal noexpandtab
            autocmd BufEnter *.sh setlocal tabstop=2
            autocmd BufEnter *.sh setlocal shiftwidth=2
            autocmd BufEnter *.sh setlocal softtabstop=2
augroup END


" If you leave a Vim process open in which you've changed file, 
" Vim creates a backup file. Then, when you open the file from a 
" different Vim session, Vim knows to complain at you for trying 
" to edit a file that is already being edited. The backup file is 
" created by appending a ~ to the end of the file in the current directory. 
" This can get quite annoying when browsing around a directory, so I 
" applied the following settings to move backups to the /tmp folder.
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" toggle between number and relativenumber
function! ToggleNumber()
            if(&relativenumber == 1)
                            set norelativenumber
                             set number
                              else
                               set relativenumber
            endif
endfunc


" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
            " save last search & cursor position
                let _s=@/
                    let l = line(".")
                        let c = col(".")
                            %s/\s\+$//e
                                let @/=_s
                                    call cursor(l, c)
                            endfunction




