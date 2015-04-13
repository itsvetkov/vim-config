"language en_US.UTF-8
language mes en_US.UTF-8
set langmenu=en_US.UTF-8
set helplang=en
set guifont=Consolas:h10:cRUSSIAN
set guioptions=acg
"winsize 126 46

colorscheme xoria256

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Turn on that syntax highlighting
syntax on

" Why is this not a default
set hidden

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
set stl=%<%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]\ %h%m%r\ %b\ %{&fileencoding}\ 0x\ \ %l,%c%V\ %P

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
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Включаем "умные" отступы ( например, автоотступ после {)
set smartindent

set cinoptions+=(0
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

