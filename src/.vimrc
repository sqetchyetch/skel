" COLOR OPTIONS ---------------------------------------------------------- {{{
set nocompatible
let skip_defaults_vim=1
syntax enable on
" use wildmenu, type :colo <Tab> to see autocompletions
" color scemes are stored in /usr/share/vim/vim81/colors
colorscheme elflord
"if has('gui_running')
    " Set the background tone.
"    set background=dark
    " Set the color scheme.
"    colorscheme elflord
    " Set a custom font you have installed on your computer.
    " Syntax: set guifont=<font_name>\ <font_weight>\ <size>
"    set guifont=Monospace\ Regular\ 12
    " Display more of the file by default.
    " Hide the toolbar.
"    set guioptions-=T
    " Hide the the left-side scroll bar.
"    set guioptions-=L
    " Hide the the right-side scroll bar.
"    set guioptions-=r
    " Hide the the menu bar.
"    set guioptions-=m
    " Hide the the bottom scroll bar.
"    set guioptions-=b
    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
"    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
"        \set guioptions-=mTr<Bar>
"        \else<Bar>
"        \set guioptions+=mTr<Bar>
"        \endif<CR>
"endif
" ------------------------------------------------------------------------ }}}
" EDITOR OPTIONS (open with za) ------------------------------------------ {{{
set number
set showcmd
set cursorline
"set cursorcolumn
filetype plugin indent on
set backspace=eol,start,indent
"set noerrorbells
set novisualbell
set scrolloff=85
set cmdheight=1
set showmode
set modelines=0
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
"set wrap
set nowrap
"really move when you want to.
nnoremap <S-J> 15j
nnoremap <S-K> 15k
nnoremap <S-H> 100h
nnoremap <S-L> 100l
" ------------------------------------------------------------------------ }}}
" SEARCH ----------------------------------------------------------------- {{{
set wildmenu
set showmatch
set matchtime=2		" delay in tenths of a second before showing match
set shortmess-=S
set incsearch
set ignorecase		" Ignore capital letters during search.
set smartcase		" This will allow you to search specifically for capital letters.
set hlsearch		" Use highlighting when doing a search.
nnoremap <space><space> :nohlsearch<CR>
set history=300		" Set the commands to save in history default number is 20.
set wildmode=list:longest	" Make wildmenu behave similar to Bash completion.
" There are certain files that we would never want to edit with Vim, wildmenu will ignore files with these extensions.
"set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" ------------------------------------------------------------------------ }}}
" FOLDING: PRESS za TO OPEN ---------------------------------------------- {{{
" This will enable code folding and use the marker method of folding.
set foldenable
set foldmethod=marker
" :help foldmethod
" TOGGLE folds with za
" OPEN folds with zo
" CLOSE folds with zc
" open ALL folds with zr
" close ALL folds with zm
" ------------------------------------------------------------------------ }}}
" FOLDER AND FILE SPECIFIC OPTIONS --------------------------------------- {{{
" This allows you to undo changes to a file even after saving it.
if !isdirectory($HOME."/.vim")
  call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
  call mkdir($HOME."/.vim/undo")
endif
set undodir=~/.vim/undo
set undofile
set undoreload=10000
if !isdirectory($HOME."/.vim/backup")
  call mkdir($HOME."/.vim/backup")
endif
set backupdir=~/.vim/backup
set backup
" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
" ------------------------------------------------------------------------ }}}
" MAPPINGS --------------------------------------------------------------- {{{
" Press \p to print the current file to the default printer from a Linux operating system.
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
"nnoremap <silent> \p :%w !lp<CR>
" Open a line above O or below o cursorline without entering input mode.
nnoremap o o<esc>
nnoremap O O<esc>
" Center the cursor vertically when moving to the next word during a search.
"nnoremap n nzz
"nnoremap N Nzz
" Yank from cursor to the end of line.
"nnoremap Y y$
" Map the F5 key to run a Python script inside Vim.
" I map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
"nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>
" ------------------------------------------------------------------------ }}}
" WINDOW OPTIONS --------------------------------------------------------- {{{
" You can split the window in Vim by typing :split or :vsplit.
" Display cursorline ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
augroup END
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><
""" You don't have NERDTree installed..
"" NERDTree specific mappings.
"" Map the F3 key to toggle NERDTree open and close.
"nnoremap <F3> :NERDTreeToggle<cr>
"" Have nerdtree ignore certain files and directories.
"let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']
" ------------------------------------------------------------------------ }}}
" PLUGINS ---------------------------------------------------------------- {{{
"call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes
" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
"call plug#end()
" ------------------------------------------------------------------------ }}}
" STATUS LINE ------------------------------------------------------------ {{{
" Clear status line when vimrc is reloaded.
set statusline=
" Status line LEFT SIDE.
set statusline+=\[\ %F\ %M\ %Y\ %R\]\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 
" Use a divider to separate the left side from the right side.
set statusline+=%=
" Status line RIGHT SIDE.
set statusline+=\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \[\ ascii:\ %b\ \ hex:\ 0x%B\ \ row:\ %l\ \ col:\ %c\ \ percent:\ %p%%\ \]
" Show the status on the second to last line.
set laststatus=2
" ------------------------------------------------------------------------ }}}
" PERSONAL MAPPINGS ------------------------------------------------------ {{{
inoremap <S-Tab> <Esc>
nnoremap <S-Tab> <Esc>
vnoremap <S-Tab> <Esc>
"imap <S-Tab> <Esc>
" ------------------------------------------------------------------------ }}}
