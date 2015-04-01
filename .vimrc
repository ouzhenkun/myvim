set nocompatible
set autoindent
set modifiable
set nowrap
set nobackup
set nowritebackup
set number                      " Show line numbers
set autoread                    " Set autoread when a file is changed outside
set autowrite                   " Writes on make/shell commands
set noswapfile                  " No swap files
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set cursorline                  " Highlight current line
set hlsearch                    " Highlight all search matches
set incsearch                   " Find as you type search
set ignorecase                  " Case insensitive search
set history=100                 " Number of things to remember in history.
set laststatus=2                " Always display the status line
set showtabline=2               " Display tab bar all the time
set clipboard=unnamed           " Use OS clipboard for copypasta
set backspace=indent,eol,start  " Backspace for dummies
set ttimeoutlen=15              " Less key code delays
set ttyfast                     " Got a fast terminal
set ttyscroll=3
set lazyredraw                  " To avoid scrolling problems
set synmaxcol=128               " Limit syntax highlighting
set pastetoggle=<F10>

" Showing some whitespace chars
set list
set listchars=tab:\ \ ,trail:●

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Default to soft tabs, 2 spaces
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

let mapleader = ","

" Swap iTerm2 cursors in vim insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

map <F5> :set nowrap! <CR>

" Keep search matches in the middle of the window
nmap n nzzzv
nmap N Nzzzv
nmap * *zzzv
nmap # #zzzv
nmap g* g*zzzv
nmap g# g#zzzv

" Selecting your pasted text
nmap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Clear search highlighting
nmap <silent><Leader><Space> :noh<CR>

" Add a blank line below or above and keep the cursor in place
nmap <Leader>O m`O<Esc>``
nmap <Leader>o m`o<Esc>``

" Use the 'black hole register', "_ to really delete/paste something.
nmap <Leader>d "_d
vmap <Leader>d "_d
nmap <Leader>D "_D
vmap <Leader>D "_D
vmap <Leader>p "_dp
vmap <Leader>P "_dP

" Navigation - command line
cmap <C-A> <Home>
cmap <C-E> <End>

" Navigation - between windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Tab control
nmap <silent>L :tabn<CR>
nmap <silent>H :tabp<CR>
nmap <silent><C-M>L :tabm +1<CR>
nmap <silent><C-M>H :tabm -1<CR>
nmap <silent><C-T> :tabnew<CR>
nmap <silent><C-Q> :q

" Use CTRL-S for saving, also in Insert mode
nmap <silent><C-S> :update<CR>
imap <silent><C-S> <Esc>:update<CR>
" Preserves the previous selection
vmap <silent><C-S> <Esc>:update<CR>gv

" Improve F1
imap <F1> <Esc>
nmap <silent><F1> :call ToggleHelp()<CR>

fu ToggleHelp()
  if &buftype == "help"
    exec 'quit'
  else
    exec "help ".expand("<cword>")
  endif
endf

"
" Bundle
" Runtime Path Manipulation
"
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on                 " Syntax highlighting
filetype plugin indent on " Automatically detect file types

color molokai

map <C-E> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>/ <Plug>(easymotion-sn)
omap <Leader>/ <Plug>(easymotion-tn)
nmap <F8> <Plug>GitGutterNextHunk
nmap <F7> <Plug>GitGutterPrevHunk
imap <expr><Tab>   pumvisible() ? "\<C-N>" : "\<Tab>"
imap <expr><S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
imap <expr><CR>    pumvisible() ? "\<C-Y>" : "\<CR>"
imap <expr><C-B>   neocomplcache#cancel_popup()

set viminfo='100,n$HOME/.vim/viminfo
set wildignore+=
      \*/tmp/*,*/.tmp/*,*/dist/*,
      \*/.idea/*,*/node_modules/*,*/platforms/*,*/.live-archive/*,
      \*.jar,*.zip,*.so,*.swp,*.class,*.map,*.swf,*.swc

let g:ackhighlight = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:gist_post_private = 1
let g:gitgutter_max_signs = 10000
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-m>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'
let g:syntastic_html_checkers = []
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify']
let g:airline_theme = 'myvim'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.readonly = 'Ʀ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#hunks#non_zero_only = 1
let g:startify_session_persistence = 1 " Automatically update sessions
let g:startify_session_delete_buffers = 1
let g:startify_list_order = [
        \ ['   Sessions:'],
        \ 'sessions',
        \ ['   Most recently used:'],
        \ 'files',
        \ ['   Bookmarks:'],
        \ 'bookmarks',
        \ ]
let g:startify_custom_header = [
        \ '                                                                   Z',
        \ '      |\/|    \  /`.|\/|                                    Z',
        \ '      |  |\/   \/  ||  |                (,.~.,.        z',
        \ '          /                             ////((\\    z',
        \ '   __________________________          ///`_  _`\ `    ___________________',
        \ '                                       ||G   \ ||      ',
        \ '   First, solve the problem.           .\|.: ~ :         .--------------.',
        \ '                                      __.| `"`.__       | \              |',
        \ '   Then, write the code.            .``   `---`   `.    |  .             :',
        \ '                                   /                `   |   `-.__________)',
        \ '   - John Johnson                 |   H A C K I N G     |  :  |          .',
        \ '                                  |    _                |     |   [ ##   :',
        \ '                                   \    `--.        ____|  ,   oo_______.`',
        \ ]

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END
