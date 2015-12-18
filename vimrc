"language en_US.UTF-8
language mes en_US.UTF-8
set langmenu=en_US.UTF-8
set helplang=en

if has('gui_running')
    set guioptions=acg
    if has('gui_win32')
        set guifont=Consolas:h10:cRUSSIAN
    endif
    if has('gui_macvim')
        set guifont=Menlo\ Regular:h10
        set linespace=2
    endif
endif

" Fix for default Ubuntu terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

colorscheme xoria256

set nocompatible
filetype off
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
" Plugin 'jeaye/color_coded'
" Plugin 'scrooloose/nerdtree'
" Plugin 'Shougo/unite.vim'
" Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ },
  \ 'fallback': 'ag --files-with-matches --nogroup --nocolor -g "" %s'
  \ }
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Highlight the current line in every window and update the highlight as the
" cursor moves
set cursorline
" Set invisible character represemtations
set listchars=tab:▸—,eol:¬,trail:·

" Toggle invisible characters
nmap <silent> <leader>i :set list!<CR>

" Search word under cursor
nnoremap <silent> <leader>w :LAg! --word-regexp --case-sensitive <C-R><C-W><CR>
nnoremap <silent> <leader>W :LAg! <C-R><C-W><CR>

" Turn on that syntax highlighting
syntax on

" Why is this not a default
set hidden

" Add more option to 'grep' to ignore errors and binary matches
if has('unix')
    set grepprg=grep\ -nsI\ $*\ /dev/null
endif

" Don't update the display while executing macros
" set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Set the search scan to wrap around the file
set wrapscan

" Set the forward slash to be the slash of note.  Backslashes suck
" This is really only applicable to Windows but I like to have a vimrc
" that works no matter what OS I'm currently on
set shellslash

" Make command line two lines high
set cmdheight=2

" Set visual bell
" set visualbell
" set t_vb=

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" See :help 'cpoptions' for these ones.  'cpoptions' has a huge
" set of possible options
set cpoptions=ces$

" Set the status line the way I like it
" %<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
set statusline=%<%f     " Filename
set statusline+=:
set statusline+=%l
set statusline+=:
set statusline+=%c
set statusline+=%=
set statusline+=#%n     " Buffer number
set statusline+=\       " Space
set statusline+=%m      " Is modified?
set statusline+=%r      " Is read-only?
set statusline+=\       " Space
set statusline+=%{&fileencoding}
set statusline+=\       " Space
set statusline+=%P

" Always put a status line in, even if there is only one window
set laststatus=2

" Hide the mouse pointer while typing
set mousehide

" Keep some stuff in the history
set history=256

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Incrementally match the search
set incsearch
set hlsearch

" Показывать положение курсора всё время.
set ruler  

" Показывать незавершённые команды в статусбаре
set showcmd  

" Включаем нумерацию строк
set number
set relativenumber
set numberwidth=6

" Фолдинг по отсупам
" set foldmethod=indent

" Кодировка текста по умолчанию
set termencoding=utf-8

" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden

" Включить автоотступы
set autoindent

" Влючить подстветку синтаксиса
syntax on

" Преобразование Таба в пробелы
set expandtab

" Размер табулации по умолчанию
set shiftwidth=2
set softtabstop=2
set tabstop=2

set colorcolumn=80

" Включаем "умные" отступы ( например, автоотступ после {)
set smartindent

set cinoptions=(0
set cinoptions+=N-s
set cinoptions+=g-1

set wildmenu

autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl set filetype=glsl
autocmd BufNewFile,BufRead *.ps1 set filetype=ps1

function! CleverTab()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
	else
		return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" Allow per-project configuration files
set exrc
" Disable unsafe commands in project-specific .vimrc files
" This setting have to go last in global .vimrc
set secure
